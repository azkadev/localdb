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

var boolFromAssign = false;

// ignore: camel_case_types
class jsondb {
  // ignore: prefer_typing_uninitialized_variables
  var defaultsdata;
  // ignore: prefer_typing_uninitialized_variables
  var db;
  // ignore: prefer_typing_uninitialized_variables
  var data;
  // ignore: prefer_typing_uninitialized_variables
  var states;
  jsondb(this.db) {
    data = JSON.parse(db.data());
  }

  //--! Complete 100%
  jsondb defaults(value) {
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
      if (ifjs(data)) {
        json.forEach((key, value) {
          if (!data.containsKey(key)) {
            data[key] = value;
          }
        });
        stateDataFile = data;
      } else {
        stateDataFile = json;
      }
    } else {
      if (ifjs(data)) {
        stateDataFile = data;
      } else {
        stateDataFile = {};
      }
    }
    return jsondb(db);
  }

  //--! Complete 100%
  jsondb get(datas) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = data ?? {};
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
    return jsondb(db);
  }

  //--! Complete 10%
  jsondb assign(dataAssign) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = data ?? {};
    }
    if (typeof(stateDataValue) == "object" && typeof(dataAssign) == "object") {}
    boolFromAssign = true;
    return jsondb(db);
  }

  //--! Complete 100%
  jsondb push(datas) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = data ?? {};
    }
    if (ifjs(datas) && ifjs(stateDataGet)) {
      var getData = stateDataValue;
      if (typeof(getData) == "list") {
        getData.add(datas);
        stateDataFile[stateDataGet.toString()] == getData;
      }
    }
    boolFromPush = true;
    return jsondb(db);
  }

  //--! Complete 10%
  jsondb find(dataFind) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = data ?? {};
    }
    if (ifjs(stateDataValue) || ifjs(stateDataGet)) {
      if (ifjs(dataFind) && typeof(dataFind) == "object") {
        stateDataValue = "oke";
      } else {
        stateDataValue = null;
      }
    } else {
      stateDataFile = null;
    }
    return jsondb(db);
  }

  //--! Complete 40%
  jsondb set(keyData, valueData) {
    if (!ifjs(stateDataFile)) {
      stateDataFile = data ?? {};
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
    return jsondb(db);
  }

  value() {
    if (!ifjs(stateDataFile)) {
      stateDataFile = data ?? {};
    }
    if (ifjs(stateDataValue) || ifjs(stateDataGet)) {
      if ((boolFromPush || boolFromAssign) && !boolFromGet) {
        return stateDataFile;
      } else {
        return stateDataValue;
      }
    } else {
      if (ifjs(data) && typeof(stateFromGet) == "null") {
        return data;
      } else {
        return null;
      }
    }
  }

  write() {
    if (!ifjs(stateDataFile)) {
      stateDataFile = data ?? {};
    }
    return db.create(JSON.stringify(stateDataFile, null, 2));
  }

  valueprintPretty() {
    if (!ifjs(stateDataFile)) {
      stateDataFile = data ?? {};
    }
    if (!boolFromPush && !boolFromAssign && !boolFromGet) {
      if (ifjs(data) && typeof(stateFromGet) == "null") {
        try {
          print(JSON.stringify(data, null, 2));
        } catch (e) {
          print(data);
        }
      } else {
        try {
          print(JSON.stringify(JSON.parse(db.data()), null, 2));
        } catch (e) {
          print(JSON.parse(db.data()));
        }
      }
    } else {
      if (boolFromGet) {
        if (boolFromPush) {
          print("sa");
        }
      }
    }
  }
}
