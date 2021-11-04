import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';
import 'package:localdb/javascript/javascript.dart';

class Database {
  var db;
  var base;
  Database(this.base) {
    base.then((value) {
      db = jsondb(FileSync(value.path));
    });
  }

  defaults() {}
}
