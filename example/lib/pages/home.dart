import 'dart:io';

import 'package:example/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';
import 'package:localdb/javascript/javascript.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.dataAccount}) : super(key: key);
  final Map dataAccount;
  @override
  FlutterDemoState createState() => FlutterDemoState();
}

class FlutterDemoState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hey ${widget.dataAccount["first_name"].toString()}'),
      ),
      body: Center(
        child: Text("Hey ${widget.dataAccount["first_name"].toString()}"),
      ),
    );
  }
}
