@val external assert_: (bool, 'a) => unit = "console.assert"
@val external assert2: (bool, 'a, 'b) => unit = "console.assert"
@val external assert3: (bool, 'a, 'b, 'c) => unit = "console.assert"
@val external assert4: (bool, 'a, 'b, 'c, 'd) => unit = "console.assert"
@val external assert5: (bool, 'a, 'b, 'c, 'd, 'e) => unit = "console.assert"
@val external assert6: (bool, 'a, 'b, 'c, 'd, 'e, 'f) => unit = "console.assert"
@val @variadic external assertMany: (bool, array<_>) => unit = "console.assert"

@val external clear: unit => unit = "console.clear"

@val external count: string => unit = "console.count"
@val external countReset: string => unit = "console.countReset"

@val external debug: 'a => unit = "console.debug"
@val external debug2: ('a, 'b) => unit = "console.debug"
@val external debug3: ('a, 'b, 'c) => unit = "console.debug"
@val external debug4: ('a, 'b, 'c, 'd) => unit = "console.debug"
@val external debug5: ('a, 'b, 'c, 'd, 'e) => unit = "console.debug"
@val external debug6: ('a, 'b, 'c, 'd, 'e, 'f) => unit = "console.debug"
@val @variadic external debugMany: array<_> => unit = "console.debug"

type dirOptions = {
  colors?: bool,
  depth?: Stdlib_Nullable.t<int>,
  showHidden?: bool,
}
@val external dir: ('a, ~options: dirOptions=?) => unit = "console.dir"
@val external dirxml: 'a => unit = "console.dirxml"

@val external error: 'a => unit = "console.error"
@val external error2: ('a, 'b) => unit = "console.error"
@val external error3: ('a, 'b, 'c) => unit = "console.error"
@val external error4: ('a, 'b, 'c, 'd) => unit = "console.error"
@val external error5: ('a, 'b, 'c, 'd, 'e) => unit = "console.error"
@val external error6: ('a, 'b, 'c, 'd, 'e, 'f) => unit = "console.error"
@val @variadic external errorMany: array<_> => unit = "console.error"

@val external group: string => unit = "console.group"
@val external groupCollapsed: string => unit = "console.groupCollapsed"
@val external groupEnd: unit => unit = "console.groupEnd"

@val external info: 'a => unit = "console.info"
@val external info2: ('a, 'b) => unit = "console.info"
@val external info3: ('a, 'b, 'c) => unit = "console.info"
@val external info4: ('a, 'b, 'c, 'd) => unit = "console.info"
@val external info5: ('a, 'b, 'c, 'd, 'e) => unit = "console.info"
@val external info6: ('a, 'b, 'c, 'd, 'e, 'f) => unit = "console.info"
@val @variadic external infoMany: array<_> => unit = "console.info"

@val external log: 'a => unit = "console.log"
@val external log2: ('a, 'b) => unit = "console.log"
@val external log3: ('a, 'b, 'c) => unit = "console.log"
@val external log4: ('a, 'b, 'c, 'd) => unit = "console.log"
@val external log5: ('a, 'b, 'c, 'd, 'e) => unit = "console.log"
@val external log6: ('a, 'b, 'c, 'd, 'e, 'f) => unit = "console.log"
@val @variadic external logMany: array<_> => unit = "console.log"

@val external table: 'a => unit = "console.table"

@val external time: string => unit = "console.time"
@val external timeEnd: string => unit = "console.timeEnd"
@val external timeLog: string => unit = "console.timeLog"

@val external trace: unit => unit = "console.trace"

@val external warn: 'a => unit = "console.warn"
@val external warn2: ('a, 'b) => unit = "console.warn"
@val external warn3: ('a, 'b, 'c) => unit = "console.warn"
@val external warn4: ('a, 'b, 'c, 'd) => unit = "console.warn"
@val external warn5: ('a, 'b, 'c, 'd, 'e) => unit = "console.warn"
@val external warn6: ('a, 'b, 'c, 'd, 'e, 'f) => unit = "console.warn"
@val @variadic external warnMany: array<_> => unit = "console.warn"
