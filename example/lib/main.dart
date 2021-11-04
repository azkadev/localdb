import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';
import 'package:localdb/javascript/javascript.dart';

void main() async {
  var pathApp = await PathStorage().appSupportPath;
  runApp(
    MaterialApp(
      title: 'Reading and Writing Files',
      home: FlutterDemo(
        database: jsondb(FileSync("$pathApp/db.json")),
      ),
    ),
  );
}

class PathStorage {
  Future get appSupportPath async {
    final directory = await getApplicationSupportDirectory();
    return directory.path;
  }
}

class FlutterDemo extends StatefulWidget {
  const FlutterDemo({Key? key, required this.database}) : super(key: key);

  final jsondb database;

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    widget.database.defaults({"counter": 0 }).write();
    setState(() {
      try {
        _counter = widget.database.get("counter").value() ?? 0;
      } catch (e) {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
      ),
      body: Center(
        child: Text(
          'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
          widget.database.set("counter", _counter).write();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
