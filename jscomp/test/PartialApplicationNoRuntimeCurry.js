// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';


function add(x) {
  return function (y, z) {
    return (x + y | 0) + z | 0;
  };
}

function f(u) {
  let f$1 = add(u);
  return function (extra) {
    return f$1(1, extra);
  };
}

exports.add = add;
exports.f = f;
/* No side effect */
