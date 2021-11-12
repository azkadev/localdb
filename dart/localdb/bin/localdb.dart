import 'dart:io';
import 'package:localdb/localdb.dart';

void main() async {
  var pathFile = "${Directory.current.path}/data.json";
  var db = FileSync(pathFile);
  print(db.writeString("assa"));
}
