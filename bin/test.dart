import 'dart:convert';

import 'package:localdb/javascript/javascript.dart';

void main() async {
  print(findObjectinArray([
    {"key": "azka"},
    {"key": "ok"}
  ], {
    "key": "ok"
  }));
}

replaceObjectInArray(array, object, newobject) {
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
      newobject.forEach((newkeyIndex, newvalue) {
        var loopValue = newobject[newkeyIndex.toString()];
        array[index][newkeyIndex.toString()] = loopValue;
      });
    }
  });
  return array;
}

findObjectinArray(array, object) {
  var data;
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
      data = array[index];
    } else {
      data = null;
    }
  });
  return data;
}
