part of localdb;

// ignore: prefer_typing_uninitialized_variables
var stateDataFile;
// ignore: prefer_typing_uninitialized_variables
var stateDataDefault;
// ignore: prefer_typing_uninitialized_variables
var stateDataGet;
// ignore: prefer_typing_uninitialized_variables
var stateFromGet;
// ignore: prefer_typing_uninitialized_variables
var stateDataValue;
// ignore: prefer_typing_uninitialized_variables
var stateDataFind;

// ignore: prefer_typing_uninitialized_variables
var stateSearchFind;

var boolFromGet = false;
var boolFromPush = false;
var boolFromFind = false;
var boolFromAssign = false;

// ignore: camel_case_types
class jsondb {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _data;
  jsondb(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }

  //--! Complete 100%
  _lastwrite defaults(value) {
    if (switchscript.ifjs(value)) {
      Map json = {};
      if (switchscript.typeof(value) == "string") {
        for (var i = 0; i < value.toString().length; i++) {
          var loopData = value[i];
          json[i.toString()] = loopData;
        }
      } else if (switchscript.typeof(value) == "list") {
        for (var i = 0; i < value.length; i++) {
          var loopData = value[i];
          json[i.toString()] = loopData;
        }
      } else if (switchscript.typeof(value) == "object") {
        json = value;
      }
      if (switchscript.ifjs(_data)) {
        json.forEach((key, value) {
          if (!_data.containsKey(key)) {
            _data[key] = value;
          }
        });
        stateDataFile = _data;
      } else {
        stateDataFile = json;
      }
    } else {
      if (switchscript.ifjs(_data)) {
        stateDataFile = _data;
      } else {
        stateDataFile = {};
      }
    }
    return _lastwrite(_db);
  }

  //--! Complete 100%
  _gets get(datas) {
    if (!switchscript.ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (switchscript.ifjs(datas) && switchscript.typeof(datas) == "string") {
      var getData = stateDataFile[datas.toString()];
      if (switchscript.RegxExp("string|list|int|double|int|num|bool", "i")
          .exec(switchscript.typeof(getData))) {
        stateDataGet = datas;
        stateDataValue = getData;
      } else if (switchscript.ifjs(getData)) {
        stateDataGet = datas;
        stateDataValue = getData;
      } else {
        stateDataGet = false;
        stateDataValue = null;
      }
    } else {
      stateDataGet = false;
      stateDataValue = null;
    }
    stateFromGet = true;
    boolFromGet = true;
    return _gets(_db);
  }

  //--! Complete 50% because manual
  _lastwrite set(keyData, valueData) {
    if (!switchscript.ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (switchscript.ifjs(keyData) &&
        switchscript.ifjs(valueData) &&
        switchscript.typeof(keyData) == "string") {
      var keyDatas = keyData.toString().split(".");
      if (keyDatas.length == 1) {
        stateDataFile[keyData.toString()] = valueData;
      } else if (keyDatas.length == 2) {
        stateDataFile[keyDatas[0].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()] =
            valueData;
      } else if (keyDatas.length == 3) {
        stateDataFile[keyDatas[0].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = valueData;
      } else if (keyDatas.length == 4) {
        stateDataFile[keyDatas[0].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = valueData;
      } else if (keyDatas.length == 5) {
        stateDataFile[keyDatas[0].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
                [keyDatas[2].toString()][keyDatas[3].toString()]
            [keyDatas[4].toString()] = valueData;
      } else if (keyDatas.length == 6) {
        stateDataFile[keyDatas[0].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = valueData;
      } else if (keyDatas.length == 5) {
        stateDataFile[keyDatas[0].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
                [keyDatas[2].toString()][keyDatas[3].toString()]
            [keyDatas[4].toString()] = {};
        stateDataFile[keyDatas[0].toString()][keyDatas[1].toString()]
                [keyDatas[2].toString()][keyDatas[3].toString()]
            [keyDatas[4].toString()][keyDatas[4].toString()] = valueData;
      }
    }
    return _lastwrite(_db);
  }

  value() {
    if (switchscript.ifjs(_data)) {
      return _data;
    } else {
      return null;
    }
  }
}

class _gets {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _data;
  _gets(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }

  //--! Complete 100%
  _lastwrite push(datas) {
    if (!switchscript.ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (switchscript.ifjs(datas) && switchscript.ifjs(stateDataGet)) {
      var getData = stateDataValue;
      if (switchscript.typeof(getData) == "list") {
        getData.add(datas);
        stateDataFile[stateDataGet.toString()] == getData;
      }
    }
    boolFromPush = true;
    return _lastwrite(_db);
  }

  _finds find(dataFind) {
    if (!switchscript.ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (switchscript.ifjs(stateDataValue)) {
      if (switchscript.ifjs(dataFind) &&
          switchscript.typeof(dataFind) == "object") {
        boolFromFind = true;
        if (switchscript.typeof(stateDataValue) == "list") {
          stateDataFind = stateDataValue;
          stateSearchFind = dataFind;
          var getData = _findObjectinArray(stateDataValue, dataFind);
          stateDataValue = getData;
        } else {
          stateDataValue = null;
        }
      } else {
        stateDataValue = null;
      }
    } else {
      stateDataFile = null;
    }
    return _finds(_db);
  }

  _lastwrite remove(dataFind) {
    if (!switchscript.ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (switchscript.ifjs(stateDataValue)) {
      if (switchscript.ifjs(dataFind) &&
          switchscript.typeof(dataFind) == "object") {
        if (switchscript.typeof(stateDataValue) == "list" &&
            stateDataGet != null) {
          stateDataFile[stateDataGet.toString()] =
              _unsetObjectInArray(stateDataValue, dataFind);
        }
      } else {
        stateDataValue = null;
      }
    } else {
      stateDataFile = null;
    }
    return _lastwrite(_db);
  }

  value() {
    return stateDataValue;
  }
}

class _finds {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _data;
  _finds(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }
  //--! Complete 10%
  _lastwrite assign(dataAssign) {
    if (!switchscript.ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (switchscript.typeof(stateDataValue) == "object" && switchscript.typeof(dataAssign) == "object") {
      if (switchscript.typeof(stateDataFind) == "list" && stateDataGet != null) {
        stateDataFile[stateDataGet.toString()] =
            _replaceObjectInArray(stateDataFind, stateSearchFind, dataAssign);
      }
    }
    boolFromAssign = true;
    return _lastwrite(_db);
  }

  value() {
    if (boolFromFind) {
      return stateDataValue;
    } else {
      return null;
    }
  }
}

// ignore: camel_case_types
class _lastwrite {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables
  var _data;
  _lastwrite(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }
  write() {
    if (!switchscript.ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    return _db.create(switchscript.JSON.stringify(stateDataFile, null, 2));
  }
}

_replaceObjectInArray(array, object, newobject) {
  object.forEach((keyIndex, value) {
    var loopValue = object[keyIndex];
    var typeValue = switchscript.typeof(loopValue);
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

_findObjectinArray(array, object) {
  var data;
  object.forEach((keyIndex, value) {
    var loopValue = object[keyIndex];
    var typeValue = switchscript.typeof(loopValue);
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

_unsetObjectInArray(array, object) {
  object.forEach((keyIndex, value) {
    var loopValue = object[keyIndex];
    var typeValue = switchscript.typeof(loopValue);
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
