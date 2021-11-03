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
    var loop_data = country[i];
    if (type == "code") {
      var code = loop_data["code"].toString().toLowerCase();
      if (code == value) {
        loop_data["status"] = "ok";
        return loop_data;
      }
    } else if (type == "flag") {
      var flag = loop_data["flag"];
      if (flag == value) {
        loop_data["status"] = "ok";
        return loop_data;
      }
    } else if (type == "name") {
      var flag = loop_data["name"].toString().toLowerCase();
      if (flag == value) {
        loop_data["status"] = "ok";
        return loop_data;
      }
    } else if (type == "phone_number") {
      var flag = loop_data["dial_code"];
      if (flag == value) {
        loop_data["status"] = "ok";
        return loop_data;
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
