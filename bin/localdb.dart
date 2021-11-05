import 'dart:io';
import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';

void main() async {
  var pathFile = "${Directory.current.path}/data.json";
  var db = jsondb(FileSync(pathFile));
  db.defaults({
    "azka": "oke",
    "array": [
      {"key": "azka"},
      {"key": "kunci"},
      {"key": "bagus"}
    ],
    "json": {}
  }).write();

  db.get("array").find({"key": "kunci"}).assign(
      {"key": "kuncibaru", "post": "5", "data": "oke"}).write();

  db.get("array").remove({"key": "bagus"}).write();

  db.set("info.links.youtube", "youtube.com").write();

  db.get("array").push({"key": "asaooaoao"}).write();

  print(db.get("array").find({"post": "5"}).value());

  print(db.get("array").value());

  print(db.value());
}
