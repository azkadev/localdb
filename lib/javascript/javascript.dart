library globals;

import 'dart:convert';

var dirname = 0;
var pwd = 9;

// ignore: camel_case_types
class console {
  static log([value]) {
    print(value ?? "");
  }
}

log([value]) {
  print(value ?? "");
}

class JSON {
  static stringify(jsons, anu, space) {
    var data =
        (jsons.runtimeType.toString() == "String") ? json.decode(jsons) : jsons;
    if (space == null) {
      return data;
    } else {
      var spaces = ' ' * space;
      var encoder = JsonEncoder.withIndent(spaces);
      return encoder.convert(data);
    }
  }

  static parse(value) {
    return json.decode(value);
  }
}

// Regex node javascript
class RegxExp {
  // ignore: prefer_typing_uninitialized_variables
  var value;
  // ignore: prefer_typing_uninitialized_variables
  var flags;
  RegxExp([this.value, this.flags]);
  exec(message) {
    if (ifjs(message)) {
      if (ifjs(value)) {
        if (ifjs(flags)) {
          if (flags.toString().length == 1) {
            var flag = flags.toString().toLowerCase();
            if (flag == "i") {
              return RegExp(value.toString(), caseSensitive: false)
                  .hasMatch(message.toString());
            } else if (flag == "m") {
              return RegExp(value.toString(), multiLine: true)
                  .hasMatch(message.toString());
            } else if (flag == "u") {
              return RegExp(value.toString(), unicode: true)
                  .hasMatch(message.toString());
            } else if (flag == "s") {
              return RegExp(value.toString(), dotAll: true)
                  .hasMatch(message.toString());
            } else {
              return false;
            }
          } else {
            var result = 0;
            for (var i = 0; i < flags.toString().length; i++) {
              // ignore: non_constant_identifier_names
              var loop_data = flags[i];
              var flag = loop_data.toString().toLowerCase();
              if (flag == "i") {
                RegExp(value.toString(), caseSensitive: false)
                        .hasMatch(message.toString())
                    ? result++
                    : "";
              } else if (flag == "m") {
                RegExp(value.toString(), multiLine: true)
                        .hasMatch(message.toString())
                    ? result++
                    : "";
              } else if (flag == "u") {
                RegExp(value.toString(), unicode: true)
                        .hasMatch(message.toString())
                    ? result++
                    : "";
              } else if (flag == "s") {
                RegExp(value.toString(), dotAll: true)
                        .hasMatch(message.toString())
                    ? result++
                    : "";
              }
            }
            if (result > 0) {
              return true;
            } else {
              return false;
            }
          }
        } else {
          return RegExp(value.toString()).hasMatch(message.toString());
        }
      } else {
        return false;
      }
    } else {
      return null;
    }
  }
}

ifjs(data) {
  var check = typeof(data);
  if (check == "string") {
    if (data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } else if (check == "object") {
    if (data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } else if (check == "list") {
    if (data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } else if (check == "int") {
    if (data < 0) {
      return true;
    } else if (data.isOdd) {
      return true;
    } else {
      return false;
    }
  } else if (check == "bool") {
    return data;
  } else {
    return false;
  }
}

// ignore: non_constant_identifier_names
string(data) {
  if (typeof(data) != "string") {
    return data.toString();
  } else {
    return data;
  }
}

typeof(data) {
  return data.runtimeType
      .toString()
      .toLowerCase()
      .replaceAll(RegExp(r"<.*"), "")
      .replaceAll(RegExp(r"_internallinkedhashmap"), "object");
}
