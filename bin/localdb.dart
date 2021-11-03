import 'dart:io';
import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';

void main() {
  var pathFile = "${Directory.current.path}/azkadev.json";
  jsondb(FileSync(pathFile)).valueprintPretty();
}
