import 'dart:convert';

import 'package:localdb/javascript/javascript.dart';

void main() async {
  var array = [
    {"key": "azka"},
    {"key": "ok"}
  ];
  print(unsetObjectInArray(array, {"key": "ok"}));
}

unsetObjectInArray(array, object) {
  object.forEach((keyIndex, value) {
    var loopValue = object[keyIndex];
    var typeValue = typeof(loopValue);
    var index = (typeValue == "regexp")
        ? () {
            for (var i = 0; i < array.length; i++) {
              if (loopValue.hasMatch(array[i][keyIndex])) {
                return i;
              }
            }
          }.call()
        : () {
            for (var i = 0; i < array.length; i++) {
              if (array[i][keyIndex] == loopValue) {
                return i;
              }
            }
          }.call();
    if (index != null) {
      array.removeAt(index);
    }
  });
  return array;
}
