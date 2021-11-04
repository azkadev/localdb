import 'dart:io';
import 'package:localdb/javascript/javascript.dart';
import 'package:localdb/javascript/tanggal.dart';
import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';
import "package:localdb/javascript/other.dart";
import 'package:localdb/localdb.dart';

class _baru {
  _baru();

  oke() {
    print("assa");
  }
}

void main() async {
  var pathFile = "${Directory.current.path}/bin/json.json";
  var db = jsondb(FileSync(pathFile));
  db.defaults({"azka": "oke", "array": [], "json": {}}).write();
  db.get("array").find("ok");
}
