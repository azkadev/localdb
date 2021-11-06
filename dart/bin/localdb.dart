import 'dart:io';
import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';

void main() async {
  var pathFile = "${Directory.current.path}/data.json";
  var db = jsondb(FileSync(pathFile));
  ok("sasa", {"azk": "aa"}).test();
}

class ok {
  var data;
  var optionde = {"azka": "ganteng"};
  var option;
  ok(this.data, this.option) {
    option.forEach((key, value) {
      optionde[key.toString()] = value;
    });
  }

  test() {
    print(optionde);
  }
}
