// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

let Bytes = require("../../lib/js/bytes.js");
let Caml_external_polyfill = require("../../lib/js/caml_external_polyfill.js");

function to_buffer(buff, ofs, len, v, flags) {
  if (!(ofs < 0 || len < 0 || ofs > (buff.length - len | 0))) {
    return Caml_external_polyfill.resolve("output_value_to_buffer")(buff, ofs, len, v, flags);
  }
  throw new Error("Invalid_argument", {
        cause: {
          RE_EXN_ID: "Invalid_argument",
          _1: "Marshal.to_buffer: substring out of bounds"
        }
      });
}

function data_size(buff, ofs) {
  if (!(ofs < 0 || ofs > (buff.length - 20 | 0))) {
    return Caml_external_polyfill.resolve("marshal_data_size")(buff, ofs);
  }
  throw new Error("Invalid_argument", {
        cause: {
          RE_EXN_ID: "Invalid_argument",
          _1: "Marshal.data_size"
        }
      });
}

function total_size(buff, ofs) {
  return 20 + data_size(buff, ofs) | 0;
}

function from_bytes(buff, ofs) {
  if (ofs < 0 || ofs > (buff.length - 20 | 0)) {
    throw new Error("Invalid_argument", {
          cause: {
            RE_EXN_ID: "Invalid_argument",
            _1: "Marshal.from_bytes"
          }
        });
  }
  let len = Caml_external_polyfill.resolve("marshal_data_size")(buff, ofs);
  if (ofs <= (buff.length - (20 + len | 0) | 0)) {
    return Caml_external_polyfill.resolve("input_value_from_string")(buff, ofs);
  }
  throw new Error("Invalid_argument", {
        cause: {
          RE_EXN_ID: "Invalid_argument",
          _1: "Marshal.from_bytes"
        }
      });
}

function from_string(buff, ofs) {
  return from_bytes(Bytes.unsafe_of_string(buff), ofs);
}

let header_size = 20;

exports.to_buffer = to_buffer;
exports.header_size = header_size;
exports.data_size = data_size;
exports.total_size = total_size;
exports.from_bytes = from_bytes;
exports.from_string = from_string;
/* No side effect */
