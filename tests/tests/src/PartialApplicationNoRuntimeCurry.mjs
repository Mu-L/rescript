// Generated by ReScript, PLEASE EDIT WITH CARE


function add(x) {
  return (y, z) => (x + y | 0) + z | 0;
}

function f(u) {
  let f$1 = add(u);
  return extra => f$1(1, extra);
}

export {
  add,
  f,
}
/* No side effect */
