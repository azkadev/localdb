import 'dart:io';
import 'package:localdb/jsondb.dart';
import "package:localdb/jsondb.dart";
import 'package:localdb/db.dart';
import 'package:localdb/javascript/javascript.dart';

void main() {
  var pathFile = "${Directory.current.path}/testkok.yaml";
  jsondb(FileSync(pathFile)).valueprintPretty();
}
