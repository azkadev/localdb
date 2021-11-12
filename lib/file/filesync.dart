part of localdb;

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
  bool create(value) {
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

  Map<dynamic, dynamic> info() {
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

  int length() {
    return io.File(pathFile).lengthSync();
  }

  List<String> readLine() {
    return io.File(pathFile).readAsLinesSync();
  }

  readBytes() {
    return io.File(pathFile).readAsBytesSync();
  }

  String readString() {
    return io.File(pathFile).readAsStringSync();
  }

  io.RandomAccessFile open() {
    return io.File(pathFile).openSync();
  }

  Stream<io.FileSystemEvent> watch() {
    return io.File(pathFile).watch();
  }

  writeString(String value) {
    return io.File(pathFile).writeAsStringSync(value);
  }

  writeBytes(List<int> bytes) {
    return io.File(pathFile).writeAsBytesSync(bytes);
  }

  bool checkExist(pathData){
    return io.File(pathData).existsSync();
  }

}
