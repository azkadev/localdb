part of localdb;

var listExtensionSupport = ["json", "yaml", "txt", "text"];

// ignore: non_constant_identifier_names
acces_data(data, checkUser) {
  if (data.indexOf(checkUser) > -1) {
    return true;
  } else {
    return false;
  }
}

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
        if (await io.File(pathFile).exists()) {
          var getFile = await io.File(pathFile).readAsString();
          if (switchscript.ifjs(getFile)) {
            return switchscript.JSON.parse(getFile);
          } else {
            return {};
          }
        } else {
          io.File(pathFile).create();
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
        if (await io.File(pathFile).exists()) {
          await io.File(pathFile)
              .writeAsString(switchscript.JSON.stringify(value, null, 1));
          return true;
        } else {
          io.File(pathFile).create();
          await io.File(pathFile)
              .writeAsString(switchscript.JSON.stringify(value, null, 1));
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
          if (io.File(pathFile).existsSync()) {
            var getFile = io.File(pathFile).readAsStringSync();
            if (switchscript.ifjs(getFile)) {
              return getFile;
            } else {
              return false;
            }
          } else {
            io.File(pathFile).createSync();
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
        if (io.File(pathFile).existsSync()) {
          io.File(pathFile).writeAsStringSync(value);
          return true;
        } else {
          io.File(pathFile).createSync();
          io.File(pathFile).writeAsStringSync(value);
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
        if (io.File(pathFile).existsSync()) {
          var dateCreated = switchscript
              .date(io.File(pathFile).lastAccessedSync().millisecondsSinceEpoch)
              .toJson();
          var dateUpdate = switchscript
              .date(io.File(pathFile).lastModifiedSync().millisecondsSinceEpoch)
              .toJson();
          var stat = io.File(pathFile).statSync();
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
          io.File(pathFile).createSync();
          var dateCreated = switchscript
              .date(io.File(pathFile).lastAccessedSync().millisecondsSinceEpoch)
              .toJson();
          var dateUpdate = switchscript
              .date(io.File(pathFile).lastModifiedSync().millisecondsSinceEpoch)
              .toJson();
          var stat = io.File(pathFile).statSync();
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
      io.File(pathFile).renameSync(newPathFile);
      return true;
    } else {
      return false;
    }
  }

  copy(newPathFile) {
    if (newPathFile.toString().isNotEmpty) {
      io.File(pathFile).copySync(newPathFile);
      return true;
    } else {
      return false;
    }
  }

  delete() {
    io.File(pathFile).deleteSync();
    return true;
  }

  length() {
    return io.File(pathFile).openSync();
  }
}
