// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

let Mt = require("./mt.js");
let Sexpm = require("./sexpm.js");

let suites = {
  contents: /* [] */0
};

let test_id = {
  contents: 0
};

function eq(loc, param) {
  let y = param[1];
  let x = param[0];
  test_id.contents = test_id.contents + 1 | 0;
  suites.contents = {
    hd: [
      loc + (" id " + String(test_id.contents)),
      (function () {
        return {
          TAG: "Eq",
          _0: x,
          _1: y
        };
      })
    ],
    tl: suites.contents
  };
}

function print_or_error(x) {
  if (x.NAME === "Error") {
    return "Error:" + x.VAL;
  } else {
    return "Ok:" + Sexpm.to_string(x.VAL);
  }
}

let a = Sexpm.parse_string("(x x gh 3 3)");

eq("File \"sexpm_test.res\", line 17, characters 5-12", [
  {
    NAME: "Ok",
    VAL: {
      NAME: "List",
      VAL: {
        hd: {
          NAME: "Atom",
          VAL: "x"
        },
        tl: {
          hd: {
            NAME: "Atom",
            VAL: "x"
          },
          tl: {
            hd: {
              NAME: "Atom",
              VAL: "gh"
            },
            tl: {
              hd: {
                NAME: "Atom",
                VAL: "3"
              },
              tl: {
                hd: {
                  NAME: "Atom",
                  VAL: "3"
                },
                tl: /* [] */0
              }
            }
          }
        }
      }
    }
  },
  a
]);

eq("File \"sexpm_test.res\", line 18, characters 5-12", [
  print_or_error(a).trim(),
  "Ok:(x x gh 3 3)\n".trim()
]);

Mt.from_pair_suites("Sexpm_test", suites.contents);

exports.suites = suites;
exports.test_id = test_id;
exports.eq = eq;
exports.print_or_error = print_or_error;
/* a Not a pure module */
