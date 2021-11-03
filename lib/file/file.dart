import 'dart:io';
import '../javascript/javascript.dart';
import '../javascript/other.dart';
import '../javascript/tanggal.dart';

var listExtensionSupport = ["json", "yaml", "txt", "text"];

checkExtenstion(text) {
  if (text.toString().isNotEmpty) {
    if (acces_data(listExtensionSupport, text.toString().toLowerCase())) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}

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
        throw ("PLease Add extension in last text");
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
      var splitText = pathFile.toString().split(".");
      if (splitText.length > 1) {
        if (checkExtenstion(splitText.last.toString().toLowerCase())) {
          if (File(pathFile).existsSync()) {
            var getFile = File(pathFile).readAsStringSync();
            if (ifjs(getFile)) {
              return getFile;
            } else {
              return false;
            }
          } else {
            File(pathFile).createSync();
            return false;
          }
        } else {
          throw ("sorry curently library does not support ${splitText.last.toString()} extension format");
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
          File(pathFile).writeAsStringSync(value);
          return true;
        } else {
          File(pathFile).createSync();
          File(pathFile).writeAsStringSync(value);
          return true;
        }
      } else {
        throw ("PLease Add json in last text");
      }
    } else {
      throw ("PLease Add correct path file");
    }
  }

  info() {
    Map json = {};
    if (RegExp(".*\/", caseSensitive: false).hasMatch(pathFile)) {
      if (pathFile.toString().split(".").length > 1) {
        if (File(pathFile).existsSync()) {
          var dateCreated =
              tanggal(File(pathFile).lastAccessedSync().millisecondsSinceEpoch);
          var dateUpdate =
              tanggal(File(pathFile).lastModifiedSync().millisecondsSinceEpoch);
          var stat = File(pathFile).statSync();
          json["date_created"] = dateCreated;
          json["date_update"] = dateUpdate;
          json["detail"] = {
            "accessed": stat.accessed.toString(),
            "changed": stat.changed.toString(),
            "mode": stat.modeString().toString(),
            "modified": stat.modified.toString(),
            "size": stat.size.toInt(),
            "type": stat.type.toString()
          };
          return json;
        } else {
          File(pathFile).createSync();
          var dateCreated =
              tanggal(File(pathFile).lastAccessedSync().millisecondsSinceEpoch);
          var dateUpdate =
              tanggal(File(pathFile).lastModifiedSync().millisecondsSinceEpoch);
          var stat = File(pathFile).statSync();
          json["date_created"] = dateCreated;
          json["date_update"] = dateUpdate;
          json["detail"] = {
            "accessed": stat.accessed.toString(),
            "changed": stat.changed.toString(),
            "mode": stat.modeString().toString(),
            "modified": stat.modified.toString(),
            "size": stat.size.toInt(),
            "type": stat.type.toString()
          };
          return json;
        }
      } else {
        throw ("PLease Add json in last text");
      }
    } else {
      throw ("PLease Add correct path file");
    }
  }

  rename(newPathFile) {
    if (newPathFile.toString().isNotEmpty) {
      File(pathFile).renameSync(newPathFile);
      return true;
    } else {
      return false;
    }
  }

  copy(newPathFile) {
    if (newPathFile.toString().isNotEmpty) {
      File(pathFile).copySync(newPathFile);
      return true;
    } else {
      return false;
    }
  }

  delete() {
    File(pathFile).deleteSync();
    return true;
  }

}
