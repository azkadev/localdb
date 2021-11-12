part of localdb;

// ignore: prefer_typing_uninitialized_variables
var stateDataFileAsync;
// ignore: prefer_typing_uninitialized_variables
var stateDataDefaultAsync;
// ignore: prefer_typing_uninitialized_variables
var stateDataGetAsync;
// ignore: prefer_typing_uninitialized_variables
var stateFromGetAsync;
// ignore: prefer_typing_uninitialized_variables
var stateDataValueAsync;
// ignore: prefer_typing_uninitialized_variables
var stateDataFindAsync;

// ignore: prefer_typing_uninitialized_variables
var stateSearchFindAsync;

var boolFromGetAsync = false;
var boolFromPushAsync = false;
var boolFromFindAsync = false;
var boolFromAssignAsync = false;

// ignore: camel_case_types
class JsonDbAsync {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _dbAsync;
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _dataAsync;
  JsonDbAsync(this._dbAsync) {
    if (switchscript.ifjs(_dbAsync.data())) {
      _dataAsync = switchscript.JSON.parse(_dbAsync.data());
    } else {
      _dataAsync = {};
    }
  }

  //--! Complete 100%
  _lastwriteAsync defaults(value) {
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
      if (switchscript.ifjs(_dataAsync)) {
        json.forEach((key, value) {
          if (!_dataAsync.containsKey(key)) {
            _dataAsync[key] = value;
          }
        });
        stateDataFileAsync = _dataAsync;
      } else {
        stateDataFileAsync = json;
      }
    } else {
      if (switchscript.ifjs(_dataAsync)) {
        stateDataFileAsync = _dataAsync;
      } else {
        stateDataFileAsync = {};
      }
    }
    return _lastwriteAsync(_dbAsync);
  }

  //--! Complete 100%
  _getsAsync get(datas) {
    if (!switchscript.ifjs(stateDataFileAsync)) {
      stateDataFileAsync = _dataAsync ?? {};
    }
    if (switchscript.ifjs(datas) && switchscript.typeof(datas) == "string") {
      var getData = stateDataFileAsync[datas.toString()];
      if (switchscript.RegxExp("string|list|int|double|int|num|bool", "i")
          .exec(switchscript.typeof(getData))) {
        stateDataGetAsync = datas;
        stateDataValueAsync = getData;
      } else if (switchscript.ifjs(getData)) {
        stateDataGetAsync = datas;
        stateDataValueAsync = getData;
      } else {
        stateDataGetAsync = false;
        stateDataValueAsync = null;
      }
    } else {
      stateDataGetAsync = false;
      stateDataValueAsync = null;
    }
    stateFromGetAsync = true;
    boolFromGetAsync = true;
    return _getsAsync(_dbAsync);
  }

  //--! Complete 50% because manual
  _lastwriteAsync set(keyData, valueData) {
    if (!switchscript.ifjs(stateDataFileAsync)) {
      stateDataFileAsync = _dataAsync ?? {};
    }
    if (switchscript.ifjs(keyData) &&
        switchscript.ifjs(valueData) &&
        switchscript.typeof(keyData) == "string") {
      var keyDatas = keyData.toString().split(".");
      if (keyDatas.length == 1) {
        stateDataFileAsync[keyData.toString()] = valueData;
      } else if (keyDatas.length == 2) {
        stateDataFileAsync[keyDatas[0].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()] =
            valueData;
      } else if (keyDatas.length == 3) {
        stateDataFileAsync[keyDatas[0].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = valueData;
      } else if (keyDatas.length == 4) {
        stateDataFileAsync[keyDatas[0].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = valueData;
      } else if (keyDatas.length == 5) {
        stateDataFileAsync[keyDatas[0].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
                [keyDatas[2].toString()][keyDatas[3].toString()]
            [keyDatas[4].toString()] = valueData;
      } else if (keyDatas.length == 6) {
        stateDataFileAsync[keyDatas[0].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = valueData;
      } else if (keyDatas.length == 5) {
        stateDataFileAsync[keyDatas[0].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
            [keyDatas[2].toString()][keyDatas[3].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
                [keyDatas[2].toString()][keyDatas[3].toString()]
            [keyDatas[4].toString()] = {};
        stateDataFileAsync[keyDatas[0].toString()][keyDatas[1].toString()]
                [keyDatas[2].toString()][keyDatas[3].toString()]
            [keyDatas[4].toString()][keyDatas[4].toString()] = valueData;
      }
    }
    return _lastwriteAsync(_dbAsync);
  }

  value() {
    if (switchscript.ifjs(_dataAsync)) {
      return _dataAsync;
    } else {
      return null;
    }
  }
}

// ignore: camel_case_types
class _getsAsync {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _data;
  _getsAsync(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }

  //--! Complete 100%
  _lastwriteAsync push(datas) {
    if (!switchscript.ifjs(stateDataFileAsync)) {
      stateDataFileAsync = _data ?? {};
    }
    if (switchscript.ifjs(datas) && switchscript.ifjs(stateDataGetAsync)) {
      var getData = stateDataValueAsync;
      if (switchscript.typeof(getData) == "list") {
        getData.add(datas);
        stateDataFileAsync[stateDataGetAsync.toString()] == getData;
      }
    }
    boolFromPushAsync = true;
    return _lastwriteAsync(_db);
  }

  _findsAsync find(dataFind) {
    if (!switchscript.ifjs(stateDataFileAsync)) {
      stateDataFileAsync = _data ?? {};
    }
    if (switchscript.ifjs(stateDataValueAsync)) {
      if (switchscript.ifjs(dataFind) &&
          switchscript.typeof(dataFind) == "object") {
        boolFromFindAsync = true;
        if (switchscript.typeof(stateDataValueAsync) == "list") {
          stateDataFindAsync = stateDataValueAsync;
          stateSearchFindAsync = dataFind;
          var getData = _findObjectinArrayAsync(stateDataValueAsync, dataFind);
          stateDataValueAsync = getData;
        } else {
          stateDataValueAsync = null;
        }
      } else {
        stateDataValueAsync = null;
      }
    } else {
      stateDataFileAsync = null;
    }
    return _findsAsync(_db);
  }

  _lastwriteAsync remove(dataFind) {
    if (!switchscript.ifjs(stateDataFileAsync)) {
      stateDataFileAsync = _data ?? {};
    }
    if (switchscript.ifjs(stateDataValueAsync)) {
      if (switchscript.ifjs(dataFind) &&
          switchscript.typeof(dataFind) == "object") {
        if (switchscript.typeof(stateDataValueAsync) == "list" &&
            stateDataGetAsync != null) {
          stateDataFileAsync[stateDataGetAsync.toString()] =
              _unsetObjectInArrayAsync(stateDataValueAsync, dataFind);
        }
      } else {
        stateDataValueAsync = null;
      }
    } else {
      stateDataFileAsync = null;
    }
    return _lastwriteAsync(_db);
  }

  value() {
    return stateDataValueAsync;
  }
}

// ignore: camel_case_types
class _findsAsync {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables, unused_field
  var _data;
  _findsAsync(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }
  //--! Complete 10%
  _lastwriteAsync assign(dataAssign) {
    if (!switchscript.ifjs(stateDataFileAsync)) {
      stateDataFileAsync = _data ?? {};
    }
    if (switchscript.typeof(stateDataValueAsync) == "object" && switchscript.typeof(dataAssign) == "object") {
      if (switchscript.typeof(stateDataFindAsync) == "list" && stateDataGetAsync != null) {
        stateDataFileAsync[stateDataGetAsync.toString()] =
            _replaceObjectInArrayAsync(stateDataFindAsync, stateSearchFindAsync, dataAssign);
      }
    }
    boolFromAssignAsync = true;
    return _lastwriteAsync(_db);
  }

  value() {
    if (boolFromFindAsync) {
      return stateDataValueAsync;
    } else {
      return null;
    }
  }
}

// ignore: camel_case_types
class _lastwriteAsync {
  // ignore: prefer_typing_uninitialized_variables, prefer_final_fields
  var _db;
  // ignore: prefer_typing_uninitialized_variables
  var _data;
  _lastwriteAsync(this._db) {
    if (switchscript.ifjs(_db.data())) {
      _data = switchscript.JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }
  write() {
    if (!switchscript.ifjs(stateDataFileAsync)) {
      stateDataFileAsync = _data ?? {};
    }
    return _db.create(switchscript.JSON.stringify(stateDataFileAsync, null, 2));
  }
}

_replaceObjectInArrayAsync(array, object, newobject) {
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

_findObjectinArrayAsync(array, object) {
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

_unsetObjectInArrayAsync(array, object) {
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
