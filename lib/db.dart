import 'dart:io';

import 'javascript/javascript.dart';


class FileAsync {
  // ignore: prefer_typing_uninitialized_variables
  var pathFile;
  FileAsync(this.pathFile);
   // ignore: non_constant_identifier_names
  data() async {
    if (RegExp(".*\/", caseSensitive: false).hasMatch(pathFile)) {
      if (pathFile.toString().split(".").length > 1) {
        if (await File(pathFile).exists()) {
          var getFile = await File(pathFile).readAsString();
          if (ifjs(getFile)) {
            return JSON.parse(getFile);
          } else {
            return {};
          }
        } else {
          File(pathFile).create();
          return {};
        }
      } else {
        throw ("PLease Add json in last text");
      }
    } else {
      throw ("PLease Add correct path file");
    }
  }

  // ignore: non_constant_identifier_names
  create(value) async {
    if (RegExp(".*\/", caseSensitive: false).hasMatch(pathFile)) {
      if (pathFile.toString().split(".").length > 1) {
        if (await File(pathFile).exists()) {
          await File(pathFile).writeAsString(JSON.stringify(value, null, 1));
          return true;
        } else {
          File(pathFile).create();
          await File(pathFile).writeAsString(JSON.stringify(value, null, 1));
          return true;
        }
      } else {
        throw ("PLease Add json in last text");
      }
    } else {
      throw ("PLease Add correct path file");
    }
  }
}

class FileSync {
  // ignore: prefer_typing_uninitialized_variables
  var pathFile;
  FileSync(this.pathFile);
   // ignore: non_constant_identifier_names
  data() {
    if (RegExp(".*\/", caseSensitive: false).hasMatch(pathFile)) {
      if (pathFile.toString().split(".").length > 1) {
        if (File(pathFile).existsSync()) {
          var getFile = File(pathFile).readAsStringSync();
          if (ifjs(getFile)) {
            return JSON.parse(getFile);
          } else {
            return {};
          }
        } else {
          File(pathFile).createSync();
          return {};
        }
      } else {
        throw ("PLease Add Format in last text\neg: path/azkadev.json");
      }
    } else {
      throw ("PLease Add correct path file");
    }
  }

  // ignore: non_constant_identifier_names
  create(value) {
    if (RegExp(".*\/", caseSensitive: false).hasMatch(pathFile)) {
      if (pathFile.toString().split(".").length > 1) {
        if (File(pathFile).existsSync()) {
          File(pathFile).writeAsStringSync(JSON.stringify(value, null, 1));
          return true;
        } else {
          File(pathFile).createSync();
          File(pathFile).writeAsStringSync(JSON.stringify(value, null, 1));
          return true;
        }
      } else {
        throw ("PLease Add json in last text");
      }
    } else {
      throw ("PLease Add correct path file");
    }
  }
}
