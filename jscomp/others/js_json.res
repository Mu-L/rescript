/*** Efficient JSON encoding using JavaScript API */

type t

type rec kind<_> =
  | String: kind<Js_string.t>
  | Number: kind<float>
  | Object: kind<Js_dict.t<t>>
  | Array: kind<array<t>>
  | Boolean: kind<bool>
  | Null: kind<Js_types.null_val>

type tagged_t =
  | JSONFalse
  | JSONTrue
  | JSONNull
  | JSONString(string)
  | JSONNumber(float)
  | JSONObject(Js_dict.t<t>)
  | JSONArray(array<t>)

let classify = (x: t): tagged_t => {
  let ty = Js.typeof(x)
  if ty == "string" {
    JSONString(Obj.magic(x))
  } else if ty == "number" {
    JSONNumber(Obj.magic(x))
  } else if ty == "boolean" {
    if Obj.magic(x) == true {
      JSONTrue
    } else {
      JSONFalse
    }
  } else if Obj.magic(x) === Js.null {
    JSONNull
  } else if Js_array2.isArray(x) {
    JSONArray(Obj.magic(x))
  } else {
    JSONObject(Obj.magic(x))
  }
}

let test = (type a, x: 'a, v: kind<a>): bool =>
  switch v {
  | Number => Js.typeof(x) == "number"
  | Boolean => Js.typeof(x) == "boolean"
  | String => Js.typeof(x) == "string"
  | Null => Obj.magic(x) === Js.null
  | Array => Js_array2.isArray(x)
  | Object => Obj.magic(x) !== Js.null && (Js.typeof(x) == "object" && !Js_array2.isArray(x))
  }

let decodeString = json =>
  if Js.typeof(json) == "string" {
    Some((Obj.magic((json: t)): string))
  } else {
    None
  }

let decodeNumber = json =>
  if Js.typeof(json) == "number" {
    Some((Obj.magic((json: t)): float))
  } else {
    None
  }

let decodeObject = json =>
  if (
    Js.typeof(json) == "object" &&
      (!Js_array2.isArray(json) &&
      !((Obj.magic(json): Js.null<'a>) === Js.null))
  ) {
    Some((Obj.magic((json: t)): Js_dict.t<t>))
  } else {
    None
  }

let decodeArray = json =>
  if Js_array2.isArray(json) {
    Some((Obj.magic((json: t)): array<t>))
  } else {
    None
  }

let decodeBoolean = (json: t) =>
  if Js.typeof(json) == "boolean" {
    Some((Obj.magic((json: t)): bool))
  } else {
    None
  }

let decodeNull = (json): option<Js.null<_>> =>
  if (Obj.magic(json): Js.null<'a>) === Js.null {
    Some(Js.null)
  } else {
    None
  }

/* external parse : string -> t = "parse"
 [@@bs.val][@@bs.scope "JSON"] */

@val @scope("JSON") external parseExn: string => t = "parse"

@val @scope("JSON") external stringifyAny: 'a => option<string> = "stringify"
/* TODO: more docs when parse error happens or stringify non-stringfy value */

@val external null: t = "null"
external string: string => t = "%identity"
external number: float => t = "%identity"
external boolean: bool => t = "%identity"
external object_: Js_dict.t<t> => t = "%identity"

/* external array_ : t array -> t = "%identity" */

external array: array<t> => t = "%identity"
external stringArray: array<string> => t = "%identity"
external numberArray: array<float> => t = "%identity"
external booleanArray: array<bool> => t = "%identity"
external objectArray: array<Js_dict.t<t>> => t = "%identity"
@val @scope("JSON") external stringify: t => string = "stringify"
@val @scope("JSON") external stringifyWithSpace: (t, @as(json`null`) _, int) => string = "stringify"

/* in memory modification does not work until your root is
   actually None, so we need wrap it as ``v`` and
   return the first element instead */

let patch: _ => _ = %raw(`function (json) {
  var x = [json];
  var q = [{ kind: 0, i: 0, parent: x }];
  while (q.length !== 0) {
    // begin pop the stack
    var cur = q[q.length - 1];
    if (cur.kind === 0) {
      cur.val = cur.parent[cur.i]; // patch the undefined value for array
      if (++cur.i === cur.parent.length) {
        q.pop();
      }
    } else {
      q.pop();
    }
    // finish
    var task = cur.val;
    if (typeof task === "object") {
      if (Array.isArray(task) && task.length !== 0) {
        q.push({ kind: 0, i: 0, parent: task, val: undefined });
      } else {
        for (var k in task) {
          if (k === "RE_PRIVATE_NONE") {
            if (cur.kind === 0) {
              cur.parent[cur.i - 1] = undefined;
            } else {
              cur.parent[cur.i] = undefined;
            }
            continue;
          }
          q.push({ kind: 1, i: k, parent: task, val: task[k] });
        }
      }
    }
  }
  return x[0];
}
`)

let serializeExn = (type t, x: t): string =>
  %raw(` function(obj){
  var output= JSON.stringify(obj,function(_,value){
      if(value===undefined){
          return {RE_PRIVATE_NONE : true}
      }
    return value
  });
  
 if(output === undefined){
   // JSON.stringify will raise TypeError when it detects cylic objects
   throw new TypeError("output is undefined")
 }
 return output 
 }
`)(x)

let deserializeUnsafe = (s: string): 'a => patch(parseExn(s))
