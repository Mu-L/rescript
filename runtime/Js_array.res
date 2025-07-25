/* Copyright (C) 2015-2016 Bloomberg Finance L.P.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * In addition to the permissions granted to you by the LGPL, you may combine
 * or link a "work that uses the Library" with a publicly distributed version
 * of this file to produce a combined library or application, then distribute
 * that combined work under the terms of your choosing, with no requirement
 * to comply with the obligations normally placed on you by section 4 of the
 * LGPL version 3 (or the corresponding section of a later version of the LGPL
 * should you choose to use a later version).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. */

/***
Provides bindings to JavaScript’s `Array` functions. These bindings are
optimized for pipe-last (`|>`), where the array to be processed is the last
parameter in the function.
*/

@@warning("-103")

/**
The type used to describe a JavaScript array.
*/
type t<'a> = array<'a>

/**
A type used to describe JavaScript objects that are like an array or are iterable.
*/
type array_like<'a> = Js_array2.array_like<'a>

/* commented out until bs has a plan for iterators
   type 'a array_iter = 'a array_like
*/

/**
Creates a shallow copy of an array from an array-like object. See [`Array.from`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from) on MDN.

## Examples

```rescript
let strArr = Js.String.castToArrayLike("abcd")
Js.Array.from(strArr) == ["a", "b", "c", "d"]
```
*/
@val
external from: array_like<'a> => array<'a> = "Array.from"

/* ES2015 */

/**
Creates a new array by applying a function (the second argument) to each item
in the `array_like` first argument.  See
[`Array.from`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/from)
on MDN.

## Examples

```rescript
let strArr = Js.String.castToArrayLike("abcd")
let code = s => Js.String.charCodeAt(0, s)
Js.Array.fromMap(strArr, code) == [97.0, 98.0, 99.0, 100.0]
```
*/
@val
external fromMap: (array_like<'a>, 'a => 'b) => array<'b> = "Array.from"

/* ES2015 */

@val external isArray: 'a => bool = "Array.isArray"
/* ES2015 */
/*
Returns `true` if its argument is an array; `false` otherwise. This is a
runtime check, which is why the second example returns `true` — a list is
internally represented as a nested JavaScript array.

## Examples

```rescript
Js.Array.isArray([5, 2, 3, 1, 4]) == true
Js.Array.isArray(list{5, 2, 3, 1, 4}) == true
Js.Array.isArray("abcd") == false
```
*/

/**
Returns the number of elements in the array. See [`Array.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length) on MDN.
*/
@get
external length: array<'a> => int = "length"

/* Mutator functions */

/**
Copies from the first element in the given array to the designated `~to_` position, returning the resulting array. *This function modifies the original array.* See [`Array.copyWithin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/copyWithin) on MDN.

## Examples

```rescript
let arr = [100, 101, 102, 103, 104]
Js.Array.copyWithin(~to_=2, arr) == [100, 101, 100, 101, 102]
arr == [100, 101, 100, 101, 102]
```
*/
@send
external copyWithin: (t<'a>, ~to_: int) => 'this = "copyWithin"
let copyWithin = (~to_, obj) => copyWithin(obj, ~to_)

/* ES2015 */

/**
Copies starting at element `~from` in the given array to the designated `~to_` position, returning the resulting array. *This function modifies the original array.* See [`Array.copyWithin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/copyWithin) on MDN.

## Examples

```rescript
let arr = [100, 101, 102, 103, 104]
Js.Array.copyWithinFrom(~from=2, ~to_=0, arr) == [102, 103, 104, 103, 104]
arr == [102, 103, 104, 103, 104]
```
*/
@send
external copyWithinFrom: (t<'a>, ~to_: int, ~from: int) => 'this = "copyWithin"
let copyWithinFrom = (~to_, ~from, obj) => copyWithinFrom(obj, ~to_, ~from)

/* ES2015 */

/**
Copies starting at element `~start` in the given array up to but not including `~end_` to the designated `~to_` position, returning the resulting array. *This function modifies the original array.* See [`Array.copyWithin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/copyWithin) on MDN.

## Examples

```rescript
let arr = [100, 101, 102, 103, 104, 105]
Js.Array.copyWithinFromRange(~start=2, ~end_=5, ~to_=1, arr) == [100, 102, 103, 104, 104, 105]
arr == [100, 102, 103, 104, 104, 105]
```
*/
@send
external copyWithinFromRange: (t<'a>, ~to_: int, ~start: int, ~end_: int) => 'this = "copyWithin"
let copyWithinFromRange = (~to_, ~start, ~end_, obj) =>
  copyWithinFromRange(obj, ~to_, ~start, ~end_)

/* ES2015 */

/**
Sets all elements of the given array (the second arumgent) to the designated value (the first argument), returning the resulting array. *This function modifies the original array.* See [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.

## Examples

```rescript
let arr = [100, 101, 102, 103, 104]
Js.Array.fillInPlace(99, arr) == [99, 99, 99, 99, 99]
arr == [99, 99, 99, 99, 99]
```
*/
@send
external fillInPlace: (t<'a>, 'a) => 'this = "fill"
let fillInPlace = (arg1, obj) => fillInPlace(obj, arg1)

/* ES2015 */

/**
Sets all elements of the given array (the last arumgent) from position `~from` to the end to the designated value (the first argument), returning the resulting array. *This function modifies the original array.* See [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.

## Examples

```rescript
let arr = [100, 101, 102, 103, 104]
Js.Array.fillFromInPlace(99, ~from=2, arr) == [100, 101, 99, 99, 99]
arr == [100, 101, 99, 99, 99]
```
*/
@send
external fillFromInPlace: (t<'a>, 'a, ~from: int) => 'this = "fill"
let fillFromInPlace = (arg1, ~from, obj) => fillFromInPlace(obj, arg1, ~from)

/* ES2015 */

/**
Sets the elements of the given array (the last arumgent) from position `~start` up to but not including position `~end_` to the designated value (the first argument), returning the resulting array. *This function modifies the original array.* See [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.

## Examples

```rescript
let arr = [100, 101, 102, 103, 104]
Js.Array.fillRangeInPlace(99, ~start=1, ~end_=4, arr) == [100, 99, 99, 99, 104]
arr == [100, 99, 99, 99, 104]
```
*/
@send
external fillRangeInPlace: (t<'a>, 'a, ~start: int, ~end_: int) => 'this = "fill"
let fillRangeInPlace = (arg1, ~start, ~end_, obj) => fillRangeInPlace(obj, arg1, ~start, ~end_)

/* ES2015 */

/**
If the array is not empty, removes the last element and returns it as `Some(value)`; returns `None` if the array is empty. *This function modifies the original array.* See [`Array.pop`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop) on MDN.

## Examples

```rescript
let arr = [100, 101, 102, 103, 104]
Js.Array.pop(arr) == Some(104)
arr == [100, 101, 102, 103]

let empty: array<int> = []
Js.Array.pop(empty) == None
```
*/
@send
external pop: t<'a> => option<'a> = "pop"

/**
Appends the given value to the array, returning the number of elements in the updated array. *This function modifies the original array.* See [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) on MDN.

## Examples

```rescript
let arr = ["ant", "bee", "cat"]
Js.Array.push("dog", arr) == 4
arr == ["ant", "bee", "cat", "dog"]
```
*/
@send
external push: (t<'a>, 'a) => int = "push"
let push = (arg1, obj) => push(obj, arg1)

/**
Appends the values from one array (the first argument) to another (the second argument), returning the number of elements in the updated array. *This function modifies the original array.* See [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) on MDN.

## Examples

```rescript
let arr = ["ant", "bee", "cat"]
Js.Array.pushMany(["dog", "elk"], arr) == 5
arr == ["ant", "bee", "cat", "dog", "elk"]
```
*/
@send @variadic
external pushMany: (t<'a>, array<'a>) => int = "push"
let pushMany = (arg1, obj) => pushMany(obj, arg1)

/**
Returns an array with the elements of the input array in reverse order. *This function modifies the original array.* See [`Array.reverse`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) on MDN.

## Examples

```rescript
let arr = ["ant", "bee", "cat"]
Js.Array.reverseInPlace(arr) == ["cat", "bee", "ant"]
arr == ["cat", "bee", "ant"]
```
*/
@send
external reverseInPlace: t<'a> => 'this = "reverse"

/**
If the array is not empty, removes the first element and returns it as `Some(value)`; returns `None` if the array is empty. *This function modifies the original array.* See [`Array.shift`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift) on MDN.

## Examples

```rescript
let arr = [100, 101, 102, 103, 104]
Js.Array.shift(arr) == Some(100)
arr == [101, 102, 103, 104]

let empty: array<int> = []
Js.Array.shift(empty) == None
```
*/
@send
external shift: t<'a> => option<'a> = "shift"

/**
Sorts the given array in place and returns the sorted array. JavaScript sorts the array by converting the arguments to UTF-16 strings and sorting them. See the second example with sorting numbers, which does not do a numeric sort. *This function modifies the original array.* See [`Array.sort`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) on MDN.

## Examples

```rescript
let words = ["bee", "dog", "ant", "cat"]
Js.Array.sortInPlace(words) == ["ant", "bee", "cat", "dog"]
words == ["ant", "bee", "cat", "dog"]

let numbers = [3, 30, 10, 1, 20, 2]
Js.Array.sortInPlace(numbers) == [1, 10, 2, 20, 3, 30]
numbers == [1, 10, 2, 20, 3, 30]
```
*/
@send
external sortInPlace: t<'a> => 'this = "sort"

/**
Sorts the given array in place and returns the sorted array. *This function modifies the original array.*

The first argument to `sortInPlaceWith()` is a function that compares two items from the array and returns:

* an integer less than zero if the first item is less than the second item
* zero if the items are equal
* an integer greater than zero if the first item is greater than the second item

See [`Array.sort`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) on MDN.

## Examples

```rescript
// sort by word length
let words = ["horse", "aardvark", "dog", "camel"]
let byLength = (s1, s2) => Js.String.length(s1) - Js.String.length(s2)

Js.Array.sortInPlaceWith(byLength, words) == ["dog", "horse", "camel", "aardvark"]

// sort in reverse numeric order
let numbers = [3, 30, 10, 1, 20, 2]
let reverseNumeric = (n1, n2) => n2 - n1
Js.Array.sortInPlaceWith(reverseNumeric, numbers) == [30, 20, 10, 3, 2, 1]
```
*/
@send
external sortInPlaceWith: (t<'a>, ('a, 'a) => int) => 'this = "sort"
let sortInPlaceWith = (arg1, obj) => sortInPlaceWith(obj, arg1)

/**
Starting at position `~pos`, remove `~remove` elements and then add the
elements from the `~add` array. Returns an array consisting of the removed
items. *This function modifies the original array.* See
[`Array.splice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice)
on MDN.

## Examples

```rescript
let arr = ["a", "b", "c", "d", "e", "f"]
Js.Array.spliceInPlace(~pos=2, ~remove=2, ~add=["x", "y", "z"], arr) == ["c", "d"]
arr == ["a", "b", "x", "y", "z", "e", "f"]

let arr2 = ["a", "b", "c", "d"]
Js.Array.spliceInPlace(~pos=3, ~remove=0, ~add=["x", "y"], arr2) == []
arr2 == ["a", "b", "c", "x", "y", "d"]

let arr3 = ["a", "b", "c", "d", "e", "f"]
Js.Array.spliceInPlace(~pos=9, ~remove=2, ~add=["x", "y", "z"], arr3) == []
arr3 == ["a", "b", "c", "d", "e", "f", "x", "y", "z"]
```
*/
@send @variadic
external spliceInPlace: (t<'a>, ~pos: int, ~remove: int, ~add: array<'a>) => 'this = "splice"
let spliceInPlace = (~pos, ~remove, ~add, obj) => spliceInPlace(obj, ~pos, ~remove, ~add)

/**
Removes elements from the given array starting at position `~pos` to the end
of the array, returning the removed elements. *This function modifies the
original array.* See
[`Array.splice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice)
on MDN.

## Examples

```rescript
let arr = ["a", "b", "c", "d", "e", "f"]
Js.Array.removeFromInPlace(~pos=4, arr) == ["e", "f"]
arr == ["a", "b", "c", "d"]
```
*/
@send
external removeFromInPlace: (t<'a>, ~pos: int) => 'this = "splice"
let removeFromInPlace = (~pos, obj) => removeFromInPlace(obj, ~pos)

/**
Removes `~count` elements from the given array starting at position `~pos`,
returning the removed elements. *This function modifies the original array.*
See
[`Array.splice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice)
on MDN.

## Examples

```rescript
let arr = ["a", "b", "c", "d", "e", "f"]
Js.Array.removeCountInPlace(~pos=2, ~count=3, arr) == ["c", "d", "e"]
arr == ["a", "b", "f"]
```
*/
@send
external removeCountInPlace: (t<'a>, ~pos: int, ~count: int) => 'this = "splice"
let removeCountInPlace = (~pos, ~count, obj) => removeCountInPlace(obj, ~pos, ~count)

/**
Adds the given element to the array, returning the new number of elements in
the array. *This function modifies the original array.* See
[`Array.unshift`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift)
on MDN.

## Examples

```rescript
let arr = ["b", "c", "d"]
Js.Array.unshift("a", arr) == 4
arr == ["a", "b", "c", "d"]
```
*/
@send
external unshift: (t<'a>, 'a) => int = "unshift"
let unshift = (arg1, obj) => unshift(obj, arg1)

/**
Adds the elements in the first array argument at the beginning of the second
array argument, returning the new number of elements in the array. *This
function modifies the original array.* See
[`Array.unshift`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift)
on MDN.

## Examples

```rescript
let arr = ["d", "e"]
Js.Array.unshiftMany(["a", "b", "c"], arr) == 5
arr == ["a", "b", "c", "d", "e"]
```
*/
@send @variadic
external unshiftMany: (t<'a>, array<'a>) => int = "unshift"
let unshiftMany = (arg1, obj) => unshiftMany(obj, arg1)

/* Accessor functions
 */
/**
Concatenates the first array argument to the second array argument, returning
a new array. The original arrays are not modified. See
[`Array.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat)
on MDN.

## Examples

```rescript
Js.Array.concat(["c", "d", "e"], ["a", "b"]) == ["a", "b", "c", "d", "e"]
```
*/
@send
external concat: (t<'a>, 'this) => 'this = "concat"
let concat = (arg1, obj) => concat(obj, arg1)

/**
The first argument to `concatMany()` is an array of arrays; these are added
at the end of the second argument, returning a new array. See
[`Array.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat)
on MDN.

## Examples

```rescript
Js.Array.concatMany([["d", "e"], ["f", "g", "h"]], ["a", "b", "c"]) == [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
  ]
```
*/
@send @variadic
external concatMany: (t<'a>, array<'this>) => 'this = "concat"
let concatMany = (arg1, obj) => concatMany(obj, arg1)

/* ES2016 */
/**
Returns true if the given value is in the array, `false` otherwise. See
[`Array.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes)
on MDN.

## Examples

```rescript
Js.Array.includes("b", ["a", "b", "c"]) == true
Js.Array.includes("x", ["a", "b", "c"]) == false
```
*/
@send
external includes: (t<'a>, 'a) => bool = "includes"
let includes = (arg1, obj) => includes(obj, arg1)

/**
Returns the index of the first element in the array that has the given value.
If the value is not in the array, returns -1. See
[`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf)
on MDN.

## Examples

```rescript
Js.Array.indexOf(102, [100, 101, 102, 103]) == 2
Js.Array.indexOf(999, [100, 101, 102, 103]) == -1
```
*/
@send
external indexOf: (t<'a>, 'a) => int = "indexOf"
let indexOf = (arg1, obj) => indexOf(obj, arg1)

/**
Returns the index of the first element in the array with the given value. The
search starts at position `~from`. See
[`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf)
on MDN.

## Examples

```rescript
Js.Array.indexOfFrom("a", ~from=2, ["a", "b", "a", "c", "a"]) == 2
Js.Array.indexOfFrom("a", ~from=3, ["a", "b", "a", "c", "a"]) == 4
Js.Array.indexOfFrom("b", ~from=2, ["a", "b", "a", "c", "a"]) == -1
```
*/
@send
external indexOfFrom: (t<'a>, 'a, ~from: int) => int = "indexOf"
let indexOfFrom = (arg1, ~from, obj) => indexOfFrom(obj, arg1, ~from)

@send @deprecated("please use joinWith instead")
external join: t<'a> => string = "join"

/**
This function converts each element of the array to a string (via JavaScript)
and concatenates them, separated by the string given in the first argument,
into a single string. See
[`Array.join`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join)
on MDN.

## Examples

```rescript
Js.Array.joinWith("--", ["ant", "bee", "cat"]) == "ant--bee--cat"
Js.Array.joinWith("", ["door", "bell"]) == "doorbell"
Js.Array.joinWith("/", [2020, 9, 4]) == "2020/9/4"
Js.Array.joinWith(";", [2.5, 3.6, 3e-2]) == "2.5;3.6;0.03"
```
*/
@send
external joinWith: (t<'a>, string) => string = "join"
let joinWith = (arg1, obj) => joinWith(obj, arg1)

/**
Returns the index of the last element in the array that has the given value.
If the value is not in the array, returns -1. See
[`Array.lastIndexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf)
on MDN.

## Examples

```rescript
Js.Array.lastIndexOf("a", ["a", "b", "a", "c"]) == 2
Js.Array.lastIndexOf("x", ["a", "b", "a", "c"]) == -1
```
*/
@send
external lastIndexOf: (t<'a>, 'a) => int = "lastIndexOf"
let lastIndexOf = (arg1, obj) => lastIndexOf(obj, arg1)

/**
Returns the index of the last element in the array that has the given value,
searching from position `~from` down to the start of the array. If the value
is not in the array, returns -1. See
[`Array.lastIndexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/lastIndexOf)
on MDN.

## Examples

```rescript
Js.Array.lastIndexOfFrom("a", ~from=3, ["a", "b", "a", "c", "a", "d"]) == 2
Js.Array.lastIndexOfFrom("c", ~from=2, ["a", "b", "a", "c", "a", "d"]) == -1
```
*/
@send
external lastIndexOfFrom: (t<'a>, 'a, ~from: int) => int = "lastIndexOf"
let lastIndexOfFrom = (arg1, ~from, obj) => lastIndexOfFrom(obj, arg1, ~from)

/**
Returns a shallow copy of the given array from the `~start` index up to but
not including the `~end_` position. Negative numbers indicate an offset from
the end of the array. See
[`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice)
on MDN.

## Examples

```rescript
let arr = [100, 101, 102, 103, 104, 105, 106]
Js.Array.slice(~start=2, ~end_=5, arr) == [102, 103, 104]
Js.Array.slice(~start=-3, ~end_=-1, arr) == [104, 105]
Js.Array.slice(~start=9, ~end_=10, arr) == []
```
*/
@send
external slice: (t<'a>, ~start: int, ~end_: int) => 'this = "slice"
let slice = (start, ~end_, ~obj) => slice(obj, ~start, ~end_)

/**
Returns a copy of the entire array. Same as `Js.Array.Slice(~start=0,
~end_=Js.Array.length(arr), arr)`. See
[`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice)
on MDN.
*/
@send
external copy: t<'a> => 'this = "slice"

/**
Returns a shallow copy of the given array from the given index to the end.
See [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.

## Examples

```rescript
Js.Array.sliceFrom(2, [100, 101, 102, 103, 104]) == [102, 103, 104]
```
*/
@send
external sliceFrom: (t<'a>, int) => 'this = "slice"
let sliceFrom = (arg1, obj) => sliceFrom(obj, arg1)

/**
Converts the array to a string. Each element is converted to a string using
JavaScript. Unlike the JavaScript `Array.toString()`, all elements in a
ReasonML array must have the same type. See
[`Array.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString)
on MDN.

## Examples

```rescript
Js.Array.toString([3.5, 4.6, 7.8]) == "3.5,4.6,7.8"
Js.Array.toString(["a", "b", "c"]) == "a,b,c"
```
*/
@send
external toString: t<'a> => string = "toString"

/**
Converts the array to a string using the conventions of the current locale.
Each element is converted to a string using JavaScript. Unlike the JavaScript
`Array.toLocaleString()`, all elements in a ReasonML array must have the same
type. See
[`Array.toLocaleString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toLocaleString)
on MDN.

## Examples

```rescript
Js.Array.toLocaleString([Js.Date.make()])
// returns "3/19/2020, 10:52:11 AM" for locale en_US.utf8
// returns "2020-3-19 10:52:11" for locale de_DE.utf8
```
*/
@send
external toLocaleString: t<'a> => string = "toLocaleString"

/* Iteration functions
 */

/**
The first argument to `every()` is a predicate function that returns a boolean. The `every()` function returns `true` if the predicate function is true for all items in the given array. If given an empty array, returns `true`. See [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.

## Examples

```rescript
let isEven = x => mod(x, 2) == 0
Js.Array.every(isEven, [6, 22, 8, 4]) == true
Js.Array.every(isEven, [6, 22, 7, 4]) == false
```
*/
@send
external every: (t<'a>, 'a => bool) => bool = "every"
let every = (arg1, obj) => every(obj, arg1)

/**
The first argument to `everyi()` is a predicate function with two arguments: an array element and that element’s index; it returns a boolean. The `everyi()` function returns `true` if the predicate function is true for all items in the given array. If given an empty array, returns `true`. See [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.

## Examples

```rescript
// determine if all even-index items are positive
let evenIndexPositive = (item, index) => mod(index, 2) == 0 ? item > 0 : true

Js.Array.everyi(evenIndexPositive, [6, -3, 5, 8]) == true
Js.Array.everyi(evenIndexPositive, [6, 3, -5, 8]) == false
```
*/
@send
external everyi: (t<'a>, ('a, int) => bool) => bool = "every"
let everyi = (arg1, obj) => everyi(obj, arg1)

/**
Applies the given predicate function to each element in the array; the result is an array of those elements for which the predicate function returned `true`. See [`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) on MDN.

## Examples

```rescript
let nonEmpty = s => s != ""
Js.Array.filter(nonEmpty, ["abc", "", "", "def", "ghi"]) == ["abc", "def", "ghi"]
```
*/
@send
external filter: (t<'a>, 'a => bool) => 'this = "filter"
let filter = (arg1, obj) => filter(obj, arg1)

/**
Each element of the given array are passed to the predicate function. The
return value is an array of all those elements for which the predicate
function returned `true`.  See
[`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)
on MDN.

## Examples

```rescript
// keep only positive elements at odd indices
let positiveOddElement = (item, index) => mod(index, 2) == 1 && item > 0

Js.Array.filteri(positiveOddElement, [6, 3, 5, 8, 7, -4, 1]) == [3, 8]
```
*/
@send
external filteri: (t<'a>, ('a, int) => bool) => 'this = "filter"
let filteri = (arg1, obj) => filteri(obj, arg1)

/**
Returns `Some(value)` for the first element in the array that satisifies the
given predicate function, or `None` if no element satisifies the predicate.
See
[`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find)
on MDN.

## Examples

```rescript
// find first negative element
Js.Array.find(x => x < 0, [33, 22, -55, 77, -44]) == Some(-55)
Js.Array.find(x => x < 0, [33, 22, 55, 77, 44]) == None
```
*/
@send
external find: (t<'a>, 'a => bool) => option<'a> = "find"
let find = (arg1, obj) => find(obj, arg1)

/**
Returns `Some(value)` for the first element in the array that satisifies the given predicate function, or `None` if no element satisifies the predicate. The predicate function takes an array element and an index as its parameters. See [`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) on MDN.

## Examples

```rescript
// find first positive item at an odd index
let positiveOddElement = (item, index) => mod(index, 2) == 1 && item > 0

Js.Array.findi(positiveOddElement, [66, -33, 55, 88, 22]) == Some(88)
Js.Array.findi(positiveOddElement, [66, -33, 55, -88, 22]) == None
```
*/
@send
external findi: (t<'a>, ('a, int) => bool) => option<'a> = "find"
let findi = (arg1, obj) => findi(obj, arg1)

/**
Returns the index of the first element in the array that satisifies the given predicate function, or -1 if no element satisifies the predicate. See [`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) on MDN.

## Examples

```rescript
Js.Array.findIndex(x => x < 0, [33, 22, -55, 77, -44]) == 2
Js.Array.findIndex(x => x < 0, [33, 22, 55, 77, 44]) == -1
```
*/
@send
external findIndex: (t<'a>, 'a => bool) => int = "findIndex"
let findIndex = (arg1, obj) => findIndex(obj, arg1)

/**
Returns `Some(value)` for the first element in the array that satisifies the given predicate function, or `None` if no element satisifies the predicate. The predicate function takes an array element and an index as its parameters. See [`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) on MDN.

## Examples

```rescript
// find index of first positive item at an odd index
let positiveOddElement = (item, index) => mod(index, 2) == 1 && item > 0

Js.Array.findIndexi(positiveOddElement, [66, -33, 55, 88, 22]) == 3
Js.Array.findIndexi(positiveOddElement, [66, -33, 55, -88, 22]) == -1
```
*/
@send
external findIndexi: (t<'a>, ('a, int) => bool) => int = "findIndex"
let findIndexi = (arg1, obj) => findIndexi(obj, arg1)

/**
The `forEach()` function applies the function given as the first argument to each element in the array. The function you provide returns `unit`, and the `forEach()` function also returns `unit`. You use `forEach()` when you need to process each element in the array but not return any new array or value; for example, to print the items in an array. See [`Array.forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) on MDN.

## Examples

```rescript
// display all elements in an array
Js.Array.forEach(x => Js.log(x), ["a", "b", "c"]) == ()
```
*/
@send
external forEach: (t<'a>, 'a => unit) => unit = "forEach"
let forEach = (arg1, obj) => forEach(obj, arg1)

/**
The `forEachi()` function applies the function given as the first argument to each element in the array. The function you provide takes an item in the array and its index number, and returns `unit`. The `forEachi()` function also returns `unit`. You use `forEachi()` when you need to process each element in the array but not return any new array or value; for example, to print the items in an array. See [`Array.forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) on MDN.

## Examples

```rescript
// display all elements in an array as a numbered list
Js.Array.forEachi((item, index) => Js.log2(index + 1, item), ["a", "b", "c"]) == ()
```
*/
@send
external forEachi: (t<'a>, ('a, int) => unit) => unit = "forEach"
let forEachi = (arg1, obj) => forEachi(obj, arg1)

/**
Applies the function (given as the first argument) to each item in the array,
returning a new array. The result array does not have to have elements of the
same type as the input array. See
[`Array.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
on MDN.

## Examples

```rescript
Js.Array.map(x => x * x, [12, 4, 8]) == [144, 16, 64]
Js.Array.map(Js.String.length, ["animal", "vegetable", "mineral"]) == [6, 9, 7]
```
*/
@send
external map: (t<'a>, 'a => 'b) => t<'b> = "map"
let map = (arg1, obj) => map(obj, arg1)

/**
Applies the function (given as the first argument) to each item in the array,
returning a new array. The function acceps two arguments: an item from the
array and its index number. The result array does not have to have elements
of the same type as the input array. See
[`Array.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
on MDN.

## Examples

```rescript
// multiply each item in array by its position
let product = (item, index) => item * index
Js.Array.mapi(product, [10, 11, 12]) == [0, 11, 24]
```
*/
@send
external mapi: (t<'a>, ('a, int) => 'b) => t<'b> = "map"
let mapi = (arg1, obj) => mapi(obj, arg1)

/**
The `reduce()` function takes three parameters: a *reducer function*, a
beginning accumulator value, and an array. The reducer function has two
parameters: an accumulated value and an element of the array.

`reduce()` first calls the reducer function with the beginning value and the
first element in the array. The result becomes the new accumulator value, which
is passed in to the reducer function along with the second element in the
array. `reduce()` proceeds through the array, passing in the result of each
stage as the accumulator to the reducer function.

When all array elements are processed, the final value of the accumulator
becomes the return value of `reduce()`. See
[`Array.reduce`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)
on MDN.

## Examples

```rescript
let sumOfSquares = (accumulator, item) => accumulator + item * item

Js.Array.reduce(sumOfSquares, 0, [10, 2, 4]) == 120
Js.Array.reduce(\"*", 1, [10, 2, 4]) == 80
Js.Array.reduce(
  (acc, item) => acc + Js.String.length(item),
  0,
  ["animal", "vegetable", "mineral"],
) == 22 // 6 + 9 + 7
Js.Array.reduce((acc, item) => item /. acc, 1.0, [2.0, 4.0]) == 2.0 // 4.0 / (2.0 / 1.0)
```
*/
@send
external reduce: (t<'a>, ('b, 'a) => 'b, 'b) => 'b = "reduce"
let reduce = (arg1, arg2, obj) => reduce(obj, arg1, arg2)

/**
The `reducei()` function takes three parameters: a *reducer function*, a
beginning accumulator value, and an array. The reducer function has three
parameters: an accumulated value, an element of the array, and the index of
that element.

`reducei()` first calls the reducer function with the beginning value, the
first element in the array, and zero (its index). The result becomes the new
accumulator value, which is passed to the reducer function along with the
second element in the array and one (its index). `reducei()` proceeds from left
to right through the array, passing in the result of each stage as the
accumulator to the reducer function.

When all array elements are processed, the final value of the accumulator
becomes the return value of `reducei()`. See
[`Array.reduce`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)
on MDN.

## Examples

```rescript
// find sum of even-index elements in array
let sumOfEvens = (accumulator, item, index) =>
  if mod(index, 2) == 0 {
    accumulator + item
  } else {
    accumulator
  }

Js.Array.reducei(sumOfEvens, 0, [2, 5, 1, 4, 3]) == 6
```
*/
@send
external reducei: (t<'a>, ('b, 'a, int) => 'b, 'b) => 'b = "reduce"
let reducei = (arg1, arg2, obj) => reducei(obj, arg1, arg2)

/**
The `reduceRight()` function takes three parameters: a *reducer function*, a
beginning accumulator value, and an array. The reducer function has two
parameters: an accumulated value and an element of the array.

`reduceRight()` first calls the reducer function with the beginning value and
the last element in the array. The result becomes the new accumulator value,
which is passed in to the reducer function along with the next-to-last element
in the array. `reduceRight()` proceeds from right to left through the array,
passing in the result of each stage as the accumulator to the reducer function.

When all array elements are processed, the final value of the accumulator
becomes the return value of `reduceRight()`.  See
[`Array.reduceRight`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduceRight)
on MDN.

**NOTE:** In many cases, `reduce()` and `reduceRight()` give the same result. However, see the last example here and compare it to the example from `reduce()`, where order makes a difference.

## Examples

```rescript
let sumOfSquares = (accumulator, item) => accumulator + item * item

Js.Array.reduceRight(sumOfSquares, 0, [10, 2, 4]) == 120
Js.Array.reduceRight((acc, item) => item /. acc, 1.0, [2.0, 4.0]) == 0.5 // 2.0 / (4.0 / 1.0)
```
*/
@send
external reduceRight: (t<'a>, ('b, 'a) => 'b, 'b) => 'b = "reduceRight"
let reduceRight = (arg1, arg2, obj) => reduceRight(obj, arg1, arg2)

/**
The `reduceRighti()` function takes three parameters: a *reducer function*, a
beginning accumulator value, and an array. The reducer function has three
parameters: an accumulated value, an element of the array, and the index of
that element. `reduceRighti()` first calls the reducer function with the
beginning value, the last element in the array, and its index (length of array
minus one). The result becomes the new accumulator value, which is passed in to
the reducer function along with the second element in the array and one (its
index). `reduceRighti()` proceeds from right to left through the array, passing
in the result of each stage as the accumulator to the reducer function.

When all array elements are processed, the final value of the accumulator
becomes the return value of `reduceRighti()`. See
[`Array.reduceRight`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduceRight)
on MDN.

**NOTE:** In many cases, `reducei()` and `reduceRighti()` give the same result.
However, there are cases where the order in which items are processed makes a
difference.

## Examples

```rescript
// find sum of even-index elements in array
let sumOfEvens = (accumulator, item, index) =>
  if mod(index, 2) == 0 {
    accumulator + item
  } else {
    accumulator
  }

Js.Array.reduceRighti(sumOfEvens, 0, [2, 5, 1, 4, 3]) == 6
```
*/
@send
external reduceRighti: (t<'a>, ('b, 'a, int) => 'b, 'b) => 'b = "reduceRight"
let reduceRighti = (arg1, arg2, obj) => reduceRighti(obj, arg1, arg2)

/**
Returns `true` if the predicate function given as the first argument to
`some()` returns `true` for any element in the array; `false` otherwise.

## Examples

```rescript
let isEven = x => mod(x, 2) == 0

Js.Array.some(isEven, [3, 7, 5, 2, 9]) == true
Js.Array.some(isEven, [3, 7, 5, 1, 9]) == false
```
*/
@send
external some: (t<'a>, 'a => bool) => bool = "some"
let some = (arg1, obj) => some(obj, arg1)

/**
Returns `true` if the predicate function given as the first argument to
`somei()` returns `true` for any element in the array; `false` otherwise. The
predicate function has two arguments: an item from the array and the index
value

## Examples

```rescript
// Does any string in the array
// have the same length as its index?

let sameLength = (str, index) => Js.String.length(str) == index

// "ef" has length 2 and is it at index 2
Js.Array.somei(sameLength, ["ab", "cd", "ef", "gh"]) == true
// no item has the same length as its index
Js.Array.somei(sameLength, ["a", "bc", "def", "gh"]) == false
```
*/
@send
external somei: (t<'a>, ('a, int) => bool) => bool = "some"
let somei = (arg1, obj) => somei(obj, arg1)

/**
Returns the value at the given position in the array if the position is in
bounds; returns the JavaScript value `undefined` otherwise.

## Examples

```rescript
let arr = [100, 101, 102, 103]
Js.Array.unsafe_get(arr, 3) == 103
Js.Array.unsafe_get(arr, 4) // returns undefined
```
*/
external unsafe_get: (array<'a>, int) => 'a = "%array_unsafe_get"

/**
Sets the value at the given position in the array if the position is in bounds.
If the index is out of bounds, well, “here there be dragons.“ *This function
modifies the original array.*

## Examples

```rescript
let arr = [100, 101, 102, 103]
Js.Array.unsafe_set(arr, 3, 99)
// result is [100, 101, 102, 99]

Js.Array.unsafe_set(arr, 4, 88)
// result is [100, 101, 102, 99, 88]

Js.Array.unsafe_set(arr, 6, 77)
// result is [100, 101, 102, 99, 88, <1 empty item>, 77]

Js.Array.unsafe_set(arr, -1, 66)
// you don't want to know.
```
*/
external unsafe_set: (array<'a>, int, 'a) => unit = "%array_unsafe_set"
