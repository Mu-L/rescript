// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Mt from "./mt.mjs";
import * as Stdlib_Lazy from "rescript/lib/es6/Stdlib_Lazy.js";

let u = {
  contents: 3
};

let v = Stdlib_Lazy.make(() => {
  u.contents = 32;
});

function lazy_test() {
  let h = u.contents;
  Stdlib_Lazy.get(v);
  let g = u.contents;
  return [
    h,
    g
  ];
}

let u_v = {
  contents: 0
};

let u$1 = Stdlib_Lazy.make(() => {
  u_v.contents = 2;
});

Stdlib_Lazy.get(u$1);

let exotic = Stdlib_Lazy.get;

let l_from_fun = Stdlib_Lazy.make(() => 3);

let forward_test = Stdlib_Lazy.make(() => {
  let u = 3;
  u = u + 1 | 0;
  return u;
});

let f005 = Stdlib_Lazy.make(() => 6);

let f006 = Stdlib_Lazy.make(() => (() => 3));

let f007 = Stdlib_Lazy.make(() => {
  throw {
    RE_EXN_ID: "Not_found",
    Error: new Error()
  };
});

let f008 = Stdlib_Lazy.make(() => {
  console.log("hi");
  throw {
    RE_EXN_ID: "Not_found",
    Error: new Error()
  };
});

let a2 = Stdlib_Lazy.from_val;

let a3 = Stdlib_Lazy.from_val(3);

let a4 = Stdlib_Lazy.from_val(3);

let a5 = Stdlib_Lazy.from_val(undefined);

let a6 = Stdlib_Lazy.from_val();

let a7 = Stdlib_Lazy.get(a5);

let a8 = Stdlib_Lazy.get(a6);

Mt.from_pair_suites("Lazy_test", {
  hd: [
    "simple",
    () => ({
      TAG: "Eq",
      _0: lazy_test(),
      _1: [
        3,
        32
      ]
    })
  ],
  tl: {
    hd: [
      "lazy_force",
      () => ({
        TAG: "Eq",
        _0: u_v.contents,
        _1: 2
      })
    ],
    tl: {
      hd: [
        "lazy_from_fun",
        () => ({
          TAG: "Eq",
          _0: Stdlib_Lazy.get(l_from_fun),
          _1: 3
        })
      ],
      tl: {
        hd: [
          "lazy_from_val",
          () => ({
            TAG: "Eq",
            _0: Stdlib_Lazy.get(Stdlib_Lazy.from_val(3)),
            _1: 3
          })
        ],
        tl: {
          hd: [
            "lazy_from_val2",
            () => ({
              TAG: "Eq",
              _0: Stdlib_Lazy.get(Stdlib_Lazy.get(Stdlib_Lazy.from_val(Stdlib_Lazy.make(() => 3)))),
              _1: 3
            })
          ],
          tl: {
            hd: [
              "lazy_from_val3",
              () => {
                debugger;
                return {
                  TAG: "Eq",
                  _0: Stdlib_Lazy.get(Stdlib_Lazy.get(Stdlib_Lazy.make(() => forward_test))),
                  _1: 4
                };
              }
            ],
            tl: {
              hd: [
                "lazy_test.res",
                () => ({
                  TAG: "Eq",
                  _0: a3,
                  _1: a4
                })
              ],
              tl: {
                hd: [
                  "lazy_test.res",
                  () => ({
                    TAG: "Eq",
                    _0: a7,
                    _1: undefined
                  })
                ],
                tl: {
                  hd: [
                    "lazy_test.res",
                    () => ({
                      TAG: "Eq",
                      _0: a8,
                      _1: undefined
                    })
                  ],
                  tl: {
                    hd: [
                      "File \"lazy_test.res\", line 95, characters 7-14",
                      () => ({
                        TAG: "Ok",
                        _0: Stdlib_Lazy.isEvaluated(Stdlib_Lazy.from_val(3))
                      })
                    ],
                    tl: {
                      hd: [
                        "File \"lazy_test.res\", line 96, characters 7-14",
                        () => ({
                          TAG: "Ok",
                          _0: !Stdlib_Lazy.isEvaluated(Stdlib_Lazy.make(() => {
                            throw {
                              RE_EXN_ID: "Not_found",
                              Error: new Error()
                            };
                          }))
                        })
                      ],
                      tl: /* [] */0
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
});

export {
  v,
  lazy_test,
  u_v,
  u$1 as u,
  exotic,
  l_from_fun,
  forward_test,
  f005,
  f006,
  f007,
  f008,
  a2,
  a3,
  a4,
  a5,
  a6,
  a7,
  a8,
}
/* v Not a pure module */
