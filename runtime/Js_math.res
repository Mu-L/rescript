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
Provide utilities for JS Math. Note: The constants `_E`, `_LN10`, `_LN2`,
`_LOG10E`, `_LOG2E`, `_PI`, `_SQRT1_2`, and `_SQRT2` begin with an underscore
because ReScript variable names cannot begin with a capital letter. (Module
names begin with upper case.)
*/

/**
Euler's number; ≈ 2.718281828459045. See
[`Math.E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E)
on MDN.
*/
@val @scope("Math")
external _E: float = "E"

/**
Natural logarithm of 2; ≈ 0.6931471805599453. See
[`Math.LN2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN2)
on MDN.
*/
@val @scope("Math")
external _LN2: float = "LN2"

/**
Natural logarithm of 10; ≈ 2.302585092994046. See
[`Math.LN10`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN10)
on MDN.
*/
@val @scope("Math")
external _LN10: float = "LN10"

/**
Base 2 logarithm of E; ≈ 1.4426950408889634. See
[`Math.LOG2E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG2E)
on MDN.
*/
@val @scope("Math")
external _LOG2E: float = "LOG2E"

/**
Base 10 logarithm of E; ≈ 0.4342944819032518. See
[`Math.LOG10E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG10E)
on MDN.
*/
@val @scope("Math")
external _LOG10E: float = "LOG10E"

/**
Pi - ratio of the circumference to the diameter of a circle; ≈ 3.141592653589793. See
[`Math.PI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/PI)
on MDN.
*/
@val @scope("Math")
external _PI: float = "PI"

/**
Square root of 1/2; ≈ 0.7071067811865476. See
[`Math.SQRT1_2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/SQRT1_2)
on MDN.
*/
@val @scope("Math")
external _SQRT1_2: float = "SQRT1_2"

/**
Square root of 2; ≈ 1.4142135623730951. See
[`Math.SQRT2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/SQRT2)
on MDN.
*/
@val @scope("Math")
external _SQRT2: float = "SQRT2"

/**
Absolute value for integer argument. See
[`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs)
on MDN.
*/
@val @scope("Math")
external abs_int: int => int = "abs"

/**
Absolute value for float argument. See
[`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs)
on MDN.
*/
@val @scope("Math")
external abs_float: float => float = "abs"

/**
Arccosine (in radians) of argument; returns `NaN` if the argument is outside
the range [-1.0, 1.0]. See
[`Math.acos`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acos)
on MDN.
*/
@val @scope("Math")
external acos: float => float = "acos"

/**
Hyperbolic arccosine (in radians) of argument; returns `NaN` if the argument
is less than 1.0. See
[`Math.acosh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/acosh)
on MDN.
*/
@val @scope("Math")
external acosh: float => float = "acosh"

/**
Arcsine (in radians) of argument; returns `NaN` if the argument is outside
the range [-1.0, 1.0]. See
[`Math.asin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asin)
on MDN.
*/
@val @scope("Math")
external asin: float => float = "asin"

/**
Hyperbolic arcsine (in radians) of argument. See
[`Math.asinh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/asinh)
on MDN.
*/
@val @scope("Math")
external asinh: float => float = "asinh"

/**
Arctangent (in radians) of argument. See
[`Math.atan`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan)
on MDN.
*/
@val @scope("Math")
external atan: float => float = "atan"

/**
Hyperbolic arctangent (in radians) of argument; returns `NaN` if the argument
is is outside the range [-1.0, 1.0]. Returns `-Infinity` and `Infinity` for
arguments -1.0 and 1.0. See
[`Math.atanh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atanh)
on MDN.
*/
@val @scope("Math")
external atanh: float => float = "atanh"

/**
Returns the angle (in radians) of the quotient `y /. x`. It is also the angle
between the *x*\-axis and point (*x*, *y*). See
[`Math.atan2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/atan2)
on MDN.

## Examples

```rescript
Js.Math.atan2(~y=0.0, ~x=10.0, ()) == 0.0
Js.Math.atan2(~x=5.0, ~y=5.0, ()) == Js.Math._PI /. 4.0
Js.Math.atan2(~x=-5.0, ~y=5.0, ())
Js.Math.atan2(~x=-5.0, ~y=5.0, ()) == 3.0 *. Js.Math._PI /. 4.0
Js.Math.atan2(~x=-0.0, ~y=-5.0, ()) == -.Js.Math._PI /. 2.0
```
*/
@val @scope("Math")
external atan2: (~y: float, ~x: float, unit) => float = "atan2"

/**
Cube root. See
[`Math.cbrt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cbrt)
on MDN
*/
@val @scope("Math")
external cbrt: float => float = "cbrt"

/**
Returns the smallest integer greater than or equal to the argument. This
function may return values not representable by `int`, whose range is
\-2147483648 to 2147483647. This is because, in JavaScript, there are only
64-bit floating point numbers, which can represent integers in the range
±(2<sup>53</sup>\-1) exactly. See
[`Math.ceil`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil)
on MDN.

## Examples

```rescript
Js.Math.unsafe_ceil_int(3.1) == 4
Js.Math.unsafe_ceil_int(3.0) == 3
Js.Math.unsafe_ceil_int(-3.1) == -3
Js.Math.unsafe_ceil_int(1.0e15) // result is outside range of int datatype
```
*/
@val @scope("Math")
external unsafe_ceil_int: float => int = "ceil"

@deprecated("Please use `unsafe_ceil_int` instead") let unsafe_ceil = unsafe_ceil_int

/**
Returns the smallest `int` greater than or equal to the argument; the result
is pinned to the range of the `int` data type: -2147483648 to 2147483647. See
[`Math.ceil`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil)
on MDN.

## Examples

```rescript
Js.Math.ceil_int(3.1) == 4
Js.Math.ceil_int(3.0) == 3
Js.Math.ceil_int(-3.1) == -3
Js.Math.ceil_int(-1.0e15) == -2147483648
Js.Math.ceil_int(1.0e15) == 2147483647
```
*/
let ceil_int = (f: float): int =>
  if f > Js_int.toFloat(Js_int.max) {
    Js_int.max
  } else if f < Js_int.toFloat(Js_int.min) {
    Js_int.min
  } else {
    unsafe_ceil_int(f)
  }

@deprecated("Please use `ceil_int` instead") let ceil = ceil_int

/**
Returns the smallest integral value greater than or equal to the argument.
The result is a `float` and is not restricted to the `int` data type range.
See
[`Math.ceil`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil)
on MDN.

## Examples

```rescript
Js.Math.ceil_float(3.1) == 4.0
Js.Math.ceil_float(3.0) == 3.0
Js.Math.ceil_float(-3.1) == -3.0
Js.Math.ceil_float(2_150_000_000.3) == 2_150_000_001.0
```
*/
@val @scope("Math")
external ceil_float: float => float = "ceil"

/**
Number of leading zero bits of the argument's 32 bit int representation. See
[`Math.clz32`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32)
on MDN.

## Examples

```rescript
Js.Math.clz32(0) == 32
Js.Math.clz32(-1) == 0
Js.Math.clz32(255) == 24
```
*/
@val @scope("Math")
external clz32: int => int = "clz32"

/**
Cosine of argument, which must be specified in radians. See
[`Math.cos`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cos)
on MDN.
*/
@val @scope("Math")
external cos: float => float = "cos"

/**
Hyperbolic cosine of argument, which must be specified in radians. See
[`Math.cosh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cosh)
on MDN.
*/
@val @scope("Math")
external cosh: float => float = "cosh"

/**
Natural exponentional; returns *e* (the base of natural logarithms) to the
power of the given argument. See
[`Math.exp`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/exp)
on MDN.
*/
@val @scope("Math")
external exp: float => float = "exp"

/**
Returns *e* (the base of natural logarithms) to the power of the given
argument minus 1. See
[`Math.expm1`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/expm1)
on MDN.
*/
@val @scope("Math")
external expm1: float => float = "expm1"

/**
Returns the largest integer less than or equal to the argument. This function
may return values not representable by `int`, whose range is -2147483648 to
2147483647. This is because, in JavaScript, there are only 64-bit floating
point numbers, which can represent integers in the range
±(2<sup>53</sup>\-1) exactly. See
[`Math.floor`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor)
on MDN.

## Examples

```rescript
Js.Math.unsafe_floor_int(3.7) == 3
Js.Math.unsafe_floor_int(3.0) == 3
Js.Math.unsafe_floor_int(-3.7) == -4
Js.Math.unsafe_floor_int(1.0e15) // result is outside range of int datatype
```
*/
@val @scope("Math")
external unsafe_floor_int: float => int = "floor"

@deprecated("Please use `unsafe_floor_int` instead") let unsafe_floor = unsafe_floor_int

/**
Returns the largest `int` less than or equal to the argument; the result is
pinned to the range of the `int` data type: -2147483648 to 2147483647. See
[`Math.floor`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor)
on MDN.

## Examples

```rescript
Js.Math.floor_int(3.7) == 3
Js.Math.floor_int(3.0) == 3
Js.Math.floor_int(-3.1) == -4
Js.Math.floor_int(-1.0e15) == -2147483648
Js.Math.floor_int(1.0e15) == 2147483647
```
*/
let floor_int = f =>
  if f > Js_int.toFloat(Js_int.max) {
    Js_int.max
  } else if f < Js_int.toFloat(Js_int.min) {
    Js_int.min
  } else {
    unsafe_floor(f)
  }

@deprecated("Please use `floor_int` instead") let floor = floor_int

/**
Returns the largest integral value less than or equal to the argument. The
result is a `float` and is not restricted to the `int` data type range. See
[`Math.floor`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor)
on MDN.

## Examples

```rescript
Js.Math.floor_float(3.7) == 3.0
Js.Math.floor_float(3.0) == 3.0
Js.Math.floor_float(-3.1) == -4.0
Js.Math.floor_float(2_150_000_000.3) == 2_150_000_000.0
```
*/
@val @scope("Math")
external floor_float: float => float = "floor"

/**
Round to nearest single precision float. See
[`Math.fround`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/fround)
on MDN.

## Examples

```rescript
Js.Math.fround(5.5) == 5.5
Js.Math.fround(5.05) == 5.050000190734863
```
*/
@val @scope("Math")
external fround: float => float = "fround"

/**
Returns the square root of the sum of squares of its two arguments (the
Pythagorean formula). See
[`Math.hypot`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot)
on MDN.
*/
@val @scope("Math")
external hypot: (float, float) => float = "hypot"

/**
Returns the square root of the sum of squares of the numbers in the array
argument (generalized Pythagorean equation). Using an array allows you to
have more than two items. See
[`Math.hypot`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/hypot)
on MDN.

## Examples

```rescript
Js.Math.hypotMany([3.0, 4.0, 12.0]) == 13.0
```
*/
@val @variadic @scope("Math")
external hypotMany: array<float> => float = "hypot"

/**
32-bit integer multiplication. Use this only when you need to optimize
performance of multiplication of numbers stored as 32-bit integers. See
[`Math.imul`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul)
on MDN.
*/
@val @scope("Math")
external imul: (int, int) => int = "imul"

/**
Returns the natural logarithm of its argument; this is the number *x* such
that *e*<sup>*x*</sup> equals the argument. Returns `NaN` for negative
arguments. See
[`Math.log`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log)
on MDN.

## Examples

```rescript
Js.Math.log(Js.Math._E) == 1.0
Js.Math.log(100.0) == 4.605170185988092
```
*/
@val @scope("Math")
external log: float => float = "log"

/**
Returns the natural logarithm of one plus the argument. Returns `NaN` for
arguments less than -1. See
[`Math.log1p`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log1p)
on MDN.

## Examples

```rescript
Js.Math.log1p(Js.Math._E -. 1.0) == 1.0
Js.Math.log1p(99.0) == 4.605170185988092
```
*/
@val @scope("Math")
external log1p: float => float = "log1p"

/**
Returns the base 10 logarithm of its argument. Returns `NaN` for negative
arguments. See
[`Math.log10`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log10)
on MDN.

## Examples

```rescript
Js.Math.log10(1000.0) == 3.0
Js.Math.log10(0.01) == -2.0
Js.Math.log10(Js.Math.sqrt(10.0)) == 0.5
```
*/
@val @scope("Math")
external log10: float => float = "log10"

/**
Returns the base 2 logarithm of its argument. Returns `NaN` for negative
arguments. See
[`Math.log2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/log2)
on MDN.

## Examples

```rescript
Js.Math.log2(512.0) == 9.0
Js.Math.log2(0.125) == -3.0
Js.Math.log2(Js.Math._SQRT2) == 0.5000000000000001 // due to precision
```
*/
@val @scope("Math")
external log2: float => float = "log2"

/**
Returns the maximum of its two integer arguments.  See
[`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max)
on MDN.
*/
@val @scope("Math")
external max_int: (int, int) => int = "max"

/**
Returns the maximum of the integers in the given array.  See
[`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max)
on MDN.
*/
@val @variadic @scope("Math")
external maxMany_int: array<int> => int = "max"

/**
Returns the maximum of its two floating point arguments. See
[`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max)
on MDN.
*/
@val @scope("Math")
external max_float: (float, float) => float = "max"

/**
Returns the maximum of the floating point values in the given array. See
[`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max)
on MDN.
*/
@val @variadic @scope("Math")
external maxMany_float: array<float> => float = "max"

/**
Returns the minimum of its two integer arguments. See
[`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min)
on MDN.
*/
@val @scope("Math")
external min_int: (int, int) => int = "min"

/**
Returns the minimum of the integers in the given array. See
[`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min)
on MDN.
*/
@val @variadic @scope("Math")
external minMany_int: array<int> => int = "min"

/**
Returns the minimum of its two floating point arguments. See
[`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min)
on MDN.
*/
@val @scope("Math")
external min_float: (float, float) => float = "min"

/**
Returns the minimum of the floating point values in the given array. See
[`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min)
on MDN.
*/
@val @variadic @scope("Math")
external minMany_float: array<float> => float = "min"

/**
Raises the given base to the given exponent. (Arguments and result are
integers.) See
[`Math.pow`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow)
on MDN.

## Examples

```rescript
Js.Math.pow_int(~base=3, ~exp=4) == 81
```
*/
@val @scope("Math") @deprecated("use `pow_float` instead, the return type may be not int")
external pow_int: (~base: int, ~exp: int) => int = "pow"

/**
Raises the given base to the given exponent. (Arguments and result are
floats.) Returns `NaN` if the result would be imaginary. See
[`Math.pow`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow)
on MDN.

## Examples

```rescript
Js.Math.pow_float(~base=3.0, ~exp=4.0) == 81.0
Js.Math.pow_float(~base=4.0, ~exp=-2.0) == 0.0625
Js.Math.pow_float(~base=625.0, ~exp=0.5) == 25.0
Js.Math.pow_float(~base=625.0, ~exp=-0.5) == 0.04
Js.Float.isNaN(Js.Math.pow_float(~base=-2.0, ~exp=0.5)) == true
```
*/
@val @scope("Math")
external pow_float: (~base: float, ~exp: float) => float = "pow"

/**
Returns a random number in the half-closed interval [0,1). See
[`Math.random`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random)
on MDN.
*/
@val @scope("Math")
external random: unit => float = "random"

/**
A call to `random_int(minVal, maxVal)` returns a random number in the
half-closed interval [minVal, maxVal). See
[`Math.random`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random)
on MDN.
*/
let random_int = (min, max) => floor(random() *. Js_int.toFloat(max - min)) + min

/**
Rounds its argument to nearest integer. For numbers with a fractional portion
of exactly 0.5, the argument is rounded to the next integer in the direction
of positive infinity. This function may return values not representable by
`int`, whose range is -2147483648 to 2147483647. This is because, in
JavaScript, there are only 64-bit floating point numbers, which can represent
integers in the range ±(2<sup>53</sup>\-1) exactly. See
[`Math.round`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round)
on MDN.

## Examples

```rescript
Js.Math.unsafe_round(3.7) == 4
Js.Math.unsafe_round(-3.5) == -3
Js.Math.unsafe_round(2_150_000_000_000.3) // out of range for int
```
*/
@val @scope("Math")
external unsafe_round: float => int = "round"

/**
Rounds to nearest integral value (expressed as a float). See
[`Math.round`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round)
on MDN.
*/
@val @scope("Math")
external round: float => float = "round"

/**
Returns the sign of its integer argument: -1 if negative, 0 if zero, 1 if
positive. See
[`Math.sign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign)
on MDN.
*/
@val @scope("Math")
external sign_int: int => int = "sign"

/**
Returns the sign of its float argument: -1.0 if negative, 0.0 if zero, 1.0 if
positive. See
[`Math.sign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign)
on MDN.
*/
@val @scope("Math")
external sign_float: float => float = "sign"

/**
Sine of argument, which must be specified in radians. See
[`Math.sin`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sin)
on MDN.
*/
@val @scope("Math")
external sin: float => float = "sin"

/**
Hyperbolic sine of argument, which must be specified in radians. See
[`Math.sinh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sinh)
on MDN.
*/
@val @scope("Math")
external sinh: float => float = "sinh"

/**
Square root. If the argument is negative, this function returns `NaN`. See
[`Math.sqrt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt)
on MDN.
*/
@val @scope("Math")
external sqrt: float => float = "sqrt"

/**
Tangent of argument, which must be specified in radians. Returns `NaN` if the
argument is positive infinity or negative infinity. See
[`Math.cos`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/cos)
on MDN.
*/
@val @scope("Math")
external tan: float => float = "tan"

/**
Hyperbolic tangent of argument, which must be specified in radians. See
[`Math.tanh`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/tanh)
on MDN.
*/
@val @scope("Math")
external tanh: float => float = "tanh"

/**
Truncates its argument; i.e., removes fractional digits. This function may
return values not representable by `int`, whose range is -2147483648 to
2147483647. This is because, in JavaScript, there are only 64-bit floating
point numbers, which can represent integers in the range ±(2<sup>53</sup>-1)
exactly. See
[`Math.trunc`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc)
on MDN.
*/
@val @scope("Math")
external unsafe_trunc: float => int = "trunc"

/**
Truncates its argument; i.e., removes fractional digits. See
[`Math.trunc`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/trunc)
on MDN.
*/
@val @scope("Math")
external trunc: float => float = "trunc"
