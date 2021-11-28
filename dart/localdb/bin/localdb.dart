import 'dart:io';
import 'package:localdb/localdb.dart';

void main() async {
  var pathFile = "${Directory.current.path}/data.json";
  var db = JsonDbSync(FileSync(pathFile));
  print(Platform.localHostname);
}
