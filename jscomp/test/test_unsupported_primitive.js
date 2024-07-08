// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

let Caml_external_polyfill = require("../../lib/js/caml_external_polyfill.js");

function to_buffer(buff, ofs, len, v, flags) {
  if (!(ofs < 0 || len < 0 || ofs > (buff.length - len | 0))) {
    return Caml_external_polyfill.resolve("caml_output_value_to_buffer")(buff, ofs, len, v, flags);
  }
  throw new Error("Invalid_argument", {
        cause: {
          RE_EXN_ID: "Invalid_argument",
          _1: "Marshal.to_buffer: substring out of bounds"
        }
      });
}

exports.to_buffer = to_buffer;
/* No side effect */
