import 'dart:io';

import "package:localdb/localdb.dart";
import 'package:path_provider/path_provider.dart';

class Database {
  // ignore: prefer_typing_uninitialized_variables
  var nameFile;
  Database(this.nameFile);

  pathFile() async {
    if (Platform.isAndroid || Platform.isIOS) {
      var getDir = await getApplicationDocumentsDirectory();
      return getDir.path.toString();
    } else {
      var getDir = await getApplicationSupportDirectory();
      return getDir.path.toString();
    }
  }

  // ignore: non_constant_identifier_names
  Future<JsonDbSync> get JsonDb async {
    var dir = await pathFile();
    return JsonDbSync(FileSync("$dir${nameFile.toString()}"));
  }
}
