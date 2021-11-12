part of localdb;

// ignore: prefer_typing_uninitialized_variables
var stateDataFileSync;
// ignore: prefer_typing_uninitialized_variables
var stateDataDefaultSync;
// ignore: prefer_typing_uninitialized_variables
var stateDataGetSync;
// ignore: prefer_typing_uninitialized_variables
var stateFromGetSync;
// ignore: prefer_typing_uninitialized_variables
var stateDataValueSync;
// ignore: prefer_typing_uninitialized_variables
var stateDataFindSync;

// ignore: prefer_typing_uninitialized_variables
var stateSearchFindSync;

var boolFromGetSync = false;
var boolFromPushSync = false;
var boolFromFindSync = false;
var boolFromAssignSync = false;

// ignore: camel_case_types
class JsonDbSync {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _dbSync;
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _dataSync;
  JsonDbSync(this._dbSync) {
    if (switchscript.ifjs(_dbSync.data())) {
      _dataSync = switchscript.JSON.parse(_dbSync.data());
    } else {
      _dataSync = {};
    }
  }

  //--! Complete 100%
  _lastwriteSync defaults(value) {
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
      if (switchscript.ifjs(_dataSync)) {
        json.forEach((key, value) {
          if (!_dataSync.containsKey(key)) {
            _dataSync[key] = value;
          }
        });
        stateDataFileSync = _dataSync;
      } else {
        stateDataFileSync = json;
      }
    } else {
      if (switchscript.ifjs(_dataSync)) {
        stateDataFileSync = _dataSync;
      } else {
        stateDataFileSync = {};
      }
    }
    return _lastwriteSync(_dbSync);
  }

  //--! Complete 100%
  _getsSync get(datas) {
    if (!switchscript.ifjs(stateDataFileSync)) {
      stateDataFileSync = _dataSync ?? {};
    }
    if (switchscript.ifjs(datas) && switchscript.typeof(datas) == "string") {
      var getData = stateDataFileSync[datas.toString()];
      if (switchscript.RegxExp("string|list|int|double|int|num|bool", "i")
          .exec(switchscript.typeof(getData))) {
        stateDataGetSync = datas;
        stateDataValueSync = getData;
      } else if (switchscript.ifjs(getData)) {
        stateDataGetSync = datas;
        stateDataValueSync = getData;
      } else {
        stateDataGetSync = false;
        stateDataValueSync = null;
      }
    } else {
      stateDataGetSync = false;
      stateDataValueSync = null;
    }
    stateFromGetSync = true;
    boolFromGetSync = true;
    return _getsSync(_dbSync);
  }

  //--! Complete 50% because manual
  _lastwriteSync set(keyData, valueData) {
    if (!switchscript.ifjs(stateDataFileSync)) {
      stateDataFileSync = _dataSync ?? {};
    }
    if (switchscript.ifjs(keyData) &&
        switchscript.ifjs(valueData) &&
        switchscript.typeof(keyData) == "string") {
      var keyDatas = keyData.toString().split(".");
      if (keyDatas.length == 1) {
        stateDataFileSync[keyData.toString()] = valueData;
      } else if (keyDatas.length == 2) {
        stateDataFileSync[keyDatas[0].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()] =
            valueData;
      } else if (keyDatas.length == 3) {
        stateDataFileSync[keyDatas[0].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = valueData;
      } else if (keyDatas.length == 4) {
        stateDataFileSync[keyDatas[0].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = valueData;
      } else if (keyDatas.length == 5) {
        stateDataFileSync[keyDatas[0].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
                [keyDatas[2].toString()][keyDatas[3].toString()]
            [keyDatas[4].toString()] = valueData;
      } else if (keyDatas.length == 6) {
        stateDataFileSync[keyDatas[0].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = valueData;
      } else if (keyDatas.length == 5) {
        stateDataFileSync[keyDatas[0].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
                [keyDatas[2].toString()][keyDatas[3].toString()]
            [keyDatas[4].toString()] = {};
        stateDataFileSync[keyDatas[0].toString()][keyDatas[1].toString()]
                [keyDatas[2].toString()][keyDatas[3].toString()]
            [keyDatas[4].toString()][keyDatas[4].toString()] = valueData;
      }
    }
    return _lastwriteSync(_dbSync);
  }

  value() {
    if (switchscript.ifjs(_dataSync)) {
      return _dataSync;
    } else {
      return null;
    }
  }
}

// ignore: camel_case_types
class _getsSync {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _data;
  _getsSync(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }

  //--! Complete 100%
  _lastwriteSync push(datas) {
    if (!switchscript.ifjs(stateDataFileSync)) {
      stateDataFileSync = _data ?? {};
    }
    if (switchscript.ifjs(datas) && switchscript.ifjs(stateDataGetSync)) {
      var getData = stateDataValueSync;
      if (switchscript.typeof(getData) == "list") {
        getData.add(datas);
        stateDataFileSync[stateDataGetSync.toString()] == getData;
      }
    }
    boolFromPushSync = true;
    return _lastwriteSync(_db);
  }

  _findsSync find(dataFind) {
    if (!switchscript.ifjs(stateDataFileSync)) {
      stateDataFileSync = _data ?? {};
    }
    if (switchscript.ifjs(stateDataValueSync)) {
      if (switchscript.ifjs(dataFind) &&
          switchscript.typeof(dataFind) == "object") {
        boolFromFindSync = true;
        if (switchscript.typeof(stateDataValueSync) == "list") {
          stateDataFindSync = stateDataValueSync;
          stateSearchFindSync = dataFind;
          var getData = _findObjectinArraySync(stateDataValueSync, dataFind);
          stateDataValueSync = getData;
        } else {
          stateDataValueSync = null;
        }
      } else {
        stateDataValueSync = null;
      }
    } else {
      stateDataFileSync = null;
    }
    return _findsSync(_db);
  }

  _lastwriteSync remove(dataFind) {
    if (!switchscript.ifjs(stateDataFileSync)) {
      stateDataFileSync = _data ?? {};
    }
    if (switchscript.ifjs(stateDataValueSync)) {
      if (switchscript.ifjs(dataFind) &&
          switchscript.typeof(dataFind) == "object") {
        if (switchscript.typeof(stateDataValueSync) == "list" &&
            stateDataGetSync != null) {
          stateDataFileSync[stateDataGetSync.toString()] =
              _unsetObjectInArraySync(stateDataValueSync, dataFind);
        }
      } else {
        stateDataValueSync = null;
      }
    } else {
      stateDataFileSync = null;
    }
    return _lastwriteSync(_db);
  }

  value() {
    return stateDataValueSync;
  }
}

// ignore: camel_case_types
class _findsSync {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _data;
  _findsSync(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }
  //--! Complete 10%
  _lastwriteSync assign(dataAssign) {
    if (!switchscript.ifjs(stateDataFileSync)) {
      stateDataFileSync = _data ?? {};
    }
    if (switchscript.typeof(stateDataValueSync) == "object" && switchscript.typeof(dataAssign) == "object") {
      if (switchscript.typeof(stateDataFindSync) == "list" && stateDataGetSync != null) {
        stateDataFileSync[stateDataGetSync.toString()] =
            _replaceObjectInArraySync(stateDataFindSync, stateSearchFindSync, dataAssign);
      }
    }
    boolFromAssignSync = true;
    return _lastwriteSync(_db);
  }

  value() {
    if (boolFromFindSync) {
      return stateDataValueSync;
    } else {
      return null;
    }
  }
}

// ignore: camel_case_types
class _lastwriteSync {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables
  var _data;
  _lastwriteSync(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }
  write() {
    if (!switchscript.ifjs(stateDataFileSync)) {
      stateDataFileSync = _data ?? {};
    }
    return _db.create(switchscript.JSON.stringify(stateDataFileSync, null, 2));
  }
}

_replaceObjectInArraySync(array, object, newobject) {
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

_findObjectinArraySync(array, object) {
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

_unsetObjectInArraySync(array, object) {
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
