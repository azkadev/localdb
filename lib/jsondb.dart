import 'javascript/javascript.dart';
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
    if (ifjs(_db.data())) {
      _data = JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }

  //--! Complete 100%
  _lastwrite defaults(value) {
    if (ifjs(value)) {
      Map json = {};
      if (typeof(value) == "string") {
        for (var i = 0; i < value.toString().length; i++) {
          var loopData = value[i];
          json[i.toString()] = loopData;
        }
      } else if (typeof(value) == "list") {
        for (var i = 0; i < value.length; i++) {
          var loopData = value[i];
          json[i.toString()] = loopData;
        }
      } else if (typeof(value) == "object") {
        json = value;
      }
      if (ifjs(_data)) {
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
      if (ifjs(_data)) {
        stateDataFile = _data;
      } else {
        stateDataFile = {};
      }
    }
    return _lastwrite(_db);
  }

  //--! Complete 100%
  _gets get(datas) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (ifjs(datas) && typeof(datas) == "string") {
      var getData = stateDataFile[datas.toString()];
      if (RegxExp("string|list|int|double|int|num|bool", "i")
          .exec(typeof(getData))) {
        stateDataGet = datas;
        stateDataValue = getData;
      } else if (ifjs(getData)) {
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

  //--! Complete 40%
  _lastwrite set(keyData, valueData) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (ifjs(keyData) && ifjs(valueData) && typeof(keyData) == "string") {
      var keyDatas = keyData.toString().split(".");
      if (keyDatas.length == 1) {
        stateDataFile[keyData.toString()] = valueData;
      } else if (keyDatas.length > 1) {
        var json = {"sa": "As"};
        print(json.containsKey("sa"));
        print(json);
      }
    }
    return _lastwrite(_db);
  }

  value() {
    if (ifjs(_data)) {
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
    if (ifjs(_db.data())) {
      _data = JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }

  //--! Complete 100%
  _lastwrite push(datas) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (ifjs(datas) && ifjs(stateDataGet)) {
      var getData = stateDataValue;
      if (typeof(getData) == "list") {
        getData.add(datas);
        stateDataFile[stateDataGet.toString()] == getData;
      }
    }
    boolFromPush = true;
    return _lastwrite(_db);
  }

  _finds find(dataFind) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (ifjs(stateDataValue)) {
      if (ifjs(dataFind) && typeof(dataFind) == "object") {
        boolFromFind = true;
        stateDataValue = "oke";
      } else {
        stateDataValue = null;
      }
    } else {
      stateDataFile = null;
    }
    return _finds(_db);
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
    if (ifjs(_db.data())) {
      _data = JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }
  //--! Complete 10%
  _lastwrite assign(dataAssign) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    if (typeof(stateDataValue) == "object" && typeof(dataAssign) == "object") {}
    boolFromAssign = true;
    return _lastwrite(_db);
  }

  value() {
    if (boolFromFind) {
      return "oke bos";
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
    if (ifjs(_db.data())) {
      _data = JSON.parse(_db.data());
    } else {
      _data = {};
    }
  }
  write() {
    if (!ifjs(stateDataFile)) {
      stateDataFile = _data ?? {};
    }
    return _db.create(JSON.stringify(stateDataFile, null, 2));
  }
}
