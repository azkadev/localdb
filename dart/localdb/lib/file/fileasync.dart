part of localdb;

class FileAsync {
  // ignore: prefer_typing_uninitialized_variables
  var pathFile;
  FileAsync(this.pathFile);
  // ignore: non_constant_identifier_names
  data() async {
    if (RegExp(".*\/", caseSensitive: false).hasMatch(pathFile)) {
      var splitText = pathFile.toString().split(".");
      if (splitText.length > 1) {
        if (checkExtenstion(splitText.last.toString().toLowerCase())) {
          if (await io.File(pathFile).exists()) {
            var getFile = await io.File(pathFile).readAsString();
            if (switchscript.ifjs(getFile)) {
              return getFile;
            } else {
              return false;
            }
          } else {
            await io.File(pathFile).create();
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
  Future<bool> create(value) async {
    if (RegExp(".*\/", caseSensitive: false).hasMatch(pathFile)) {
      if (pathFile.toString().split(".").length > 1) {
        if (await io.File(pathFile).exists()) {
          await io.File(pathFile).writeAsString(value);
          return true;
        } else {
          await io.File(pathFile).create();
          await io.File(pathFile).writeAsString(value);
          return true;
        }
      } else {
        throw ("PLease Add json in last text");
      }
    } else {
      throw ("PLease Add correct path file");
    }
  }

  Future<Map> info() async {
    Map json = {};
    if (RegExp(".*\/", caseSensitive: false).hasMatch(pathFile)) {
      if (pathFile.toString().split(".").length > 1) {
        if (await io.File(pathFile).exists()) {
          var getTimeAcces = await io.File(pathFile).lastAccessed();
          var getTimeLastAcces = await io.File(pathFile).lastModified();
          var dateCreated = switchscript
              .date(getTimeAcces.millisecondsSinceEpoch)
              .toJson();
          var dateUpdate = switchscript
              .date(getTimeLastAcces.millisecondsSinceEpoch)
              .toJson();
          var stat = await io.File(pathFile).stat();
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
          await io.File(pathFile).create();
          var getTimeAcces = await io.File(pathFile).lastAccessed();
          var getTimeLastAcces = await io.File(pathFile).lastModified();
          var dateCreated = switchscript
              .date(getTimeAcces.millisecondsSinceEpoch)
              .toJson();
          var dateUpdate = switchscript
              .date(getTimeLastAcces.millisecondsSinceEpoch)
              .toJson();
          var stat = await io.File(pathFile).stat();
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

  rename(newPathFile) async {
    if (newPathFile.toString().isNotEmpty) {
      await io.File(pathFile).rename(newPathFile);
      return true;
    } else {
      return false;
    }
  }

  copy(newPathFile) async {
    if (newPathFile.toString().isNotEmpty) {
      await io.File(pathFile).copy(newPathFile);
      return true;
    } else {
      return false;
    }
  }

  delete() async {
    await io.File(pathFile).delete();
    return true;
  }

  Future<int> length()async {
    return await io.File(pathFile).length();
  }

  Future<List<String>> readLine() async {
    return await io.File(pathFile).readAsLines();
  }

  readBytes() async {
    return await io.File(pathFile).readAsBytes();
  }

  Future<String> readString() async {
    return await io.File(pathFile).readAsString();
  }

  Future<io.RandomAccessFile> open() async{
    return await io.File(pathFile).open();
  }

  Future<Stream<io.FileSystemEvent>> watch() async {
    return io.File(pathFile).watch();
  }

  writeString(String value) async{
    return await io.File(pathFile).writeAsString(value);
  }

  writeBytes(List<int> bytes) async{
    return await io.File(pathFile).writeAsBytes(bytes);
  }

  Future<bool> checkExist(pathData) async{
    return await io.File(pathData).exists();
  }

}
