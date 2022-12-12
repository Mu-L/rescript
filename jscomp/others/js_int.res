/*** Provide utilities for handling `int`. */

/*
  If we use number, we need coerce to int32 by adding `|0`,
  otherwise `+0` can be wrong.
  Most JS API is float oriented, it may overflow int32 or
  comes with `NAN`
*/

/* + conversion */

@send
/**
Formats an `int` using exponential (scientific) notation.
Returns a `string` representing the given value in exponential notation.
Raises `RangeError` if digits is not in the range \[0, 20\] (inclusive).

**see** [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential)

```res example
/* prints \"7.7e+1\" */
Js.log(Js.Int.toExponential(77))
```
*/
external toExponential: int => string = "toExponential"

@send
/**
Formats an `int` using exponential (scientific) notation.
`digits` specifies how many digits should appear after the decimal point. The value must be in the range \[0, 20\] (inclusive).

Returns a `string` representing the given value in exponential notation.

The output will be rounded or padded with zeroes if necessary.
Raises `RangeError` if `digits` is not in the range \[0, 20\] (inclusive).

**see** [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential)

```res example
/* prints \"7.70e+1\" */
Js.log(Js.Int.toExponentialWithPrecision(77, ~digits=2))

/* prints \"5.68e+3\" */
Js.log(Js.Int.toExponentialWithPrecision(5678, ~digits=2))
```
*/
external toExponentialWithPrecision: (int, ~digits: int) => string = "toExponential"

@send
/**
Formats an `int` using some fairly arbitrary rules.
Returns a `string` representing the given value in fixed-point (usually).

`toPrecision` differs from `toFixed` in that the former will format the number with full precision, while the latter will not output any digits after the decimal point.
Raises `RangeError` if `digits` is not in the range accepted by this function.

**See** [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision)

```res example
/* prints \"123456789\" */
Js.log(Js.Int.toPrecision(123456789))
```
*/
external toPrecision: int => string = "toPrecision"

@send
/**
Formats an `int` using some fairly arbitrary rules.
`digits` specifies how many digits should appear in total. The value must between 0 and some arbitrary number that's hopefully at least larger than 20 (for Node it's 21. Why? Who knows).

Returns a `string` representing the given value in fixed-point or scientific notation.

The output will be rounded or padded with zeroes if necessary.

`toPrecisionWithPrecision` differs from `toFixedWithPrecision` in that the former will count all digits against the precision, while the latter will count only the digits after the decimal point.
`toPrecisionWithPrecision` will also use scientific notation if the specified precision is less than the number of digits before the decimal point.
Raises `RangeError` if `digits` is not in the range accepted by this function.


**See** [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision)

```res example
/* prints \"1.2e+8\" */
Js.log(Js.Int.toPrecisionWithPrecision(123456789, ~digits=2))

/* prints \"0.0\" */
Js.log(Js.Int.toPrecisionWithPrecision(0, ~digits=2))
```
*/
external toPrecisionWithPrecision: (int, ~digits: int) => string = "toPrecision"

@send
/**
Formats an `int` as a `string`. Returns a `string` representing the given value
in fixed-point (usually).

**See** [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)

```res example
/* prints \"123456789\" */
Js.log(Js.Int.toString(123456789))
```
*/
external toString: int => string = "toString"

@send
/**
Formats an `int` as a `string`. `radix` specifies the radix base to use for the
formatted number. The value must be in the range \[2, 36\] (inclusive). Returns
a `string` representing the given value in fixed-point (usually). Raises
`RangeError` if `radix` is not in the range \[2, 36\] (inclusive).


**See** [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)

```res example
/* prints \"110\" */
Js.log(Js.Int.toStringWithRadix(6, ~radix=2))

/* prints \"deadbeef\" */
Js.log(Js.Int.toStringWithRadix(3735928559, ~radix=16))

/* prints \"2n9c\" */
Js.log(Js.Int.toStringWithRadix(123456, ~radix=36))
```
*/
external toStringWithRadix: (int, ~radix: int) => string = "toString"

external toFloat: int => float = "%floatofint"

let equal = (x: int, y) => x == y
let max: int = 2147483647
let min: int = -2147483648
