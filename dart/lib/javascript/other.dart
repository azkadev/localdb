import 'javascript.dart';

import 'data.dart';

// ignore: non_constant_identifier_names
hide_data([String mystring = "Hello World", int start = 2, int end = 2]) {
  var message = "";
  var numStart = start;
  var numEnd = mystring.length - end;
  for (int i = 0; i < mystring.length; i++) {
    var loopData = mystring[i];
    if (i == numEnd) {
      numEnd--;
      message += loopData;
    } else if (i == numStart) {
      numStart++;
      message += "*";
    } else {
      message += loopData;
    }
  }
  return message;
}

getCountry([value = "id", typedData = "code"]) {
  var json = {"status": "bad"};
  var type = typedData.toString().toLowerCase();
  for (var i = 0; i < country.length; i++) {
    var loopData = country[i];
    if (type == "code") {
      var code = loopData["code"].toString().toLowerCase();
      if (code == value) {
        loopData["status"] = "ok";
        return loopData;
      }
    } else if (type == "flag") {
      var flag = loopData["flag"];
      if (flag == value) {
        loopData["status"] = "ok";
        return loopData;
      }
    } else if (type == "name") {
      var flag = loopData["name"].toString().toLowerCase();
      if (flag == value) {
        loopData["status"] = "ok";
        return loopData;
      }
    } else if (type == "phone_number") {
      var flag = loopData["dial_code"];
      if (flag == value) {
        loopData["status"] = "ok";
        return loopData;
      }
    } else {
      return "Saya Tidak type data tersebut";
    }
  }
  json["description"] = "No Data $type $value";
  return json;
}

validemail(text) {
  var json = {"status": "ok"};
  if (ifjs(text)) {
    if (RegxExp("@", "i").exec(text)) {
      if (RegxExp("@[A-Za-z0-9]\.", "i").exec(text)) {
        if (RegxExp("\.[A-Za-z0-9]", "i").exec(text)) {
          json["status"] = "ok";
          json["description"] = "PLease Fill domain after . in text";
          return json;
        } else {
          json["status"] = "bad";
          json["description"] = "PLease Fill domain after . in text";
          return json;
        }
      } else {
        json["status"] = "bad";
        json["description"] = "PLease Fill . in text";
        return json;
      }
    } else {
      json["status"] = "bad";
      json["description"] = "PLease Fill @ in text";
      return json;
    }
  } else {
    json["status"] = "bad";
    json["description"] = "PLease Fill text in parameters";
    return json;
  }
}

// ignore: non_constant_identifier_names
acces_data(data, checkUser) {
    if (data.indexOf(checkUser) > -1) {
        return true;
    } else {
        return false;
    }
}