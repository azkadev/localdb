import 'dart:io';
import 'package:localdb/javascript/javascript.dart';
import 'package:localdb/javascript/tanggal.dart';
import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';
import "package:localdb/javascript/other.dart";
import 'package:localdb/localdb.dart';

void main() async {
  var pathFile = "${Directory.current.path}/data.json";
  var db = jsondb(FileSync(pathFile));

  db.defaults({"azka": "oke", "array": [], "json": {}}).write();
  print(db.get("array").find({"key": "lupa"}).assign({
    "azka": "gantengt",
    "oksa": ["skaoaskoksoa"]
  }).write());
}
