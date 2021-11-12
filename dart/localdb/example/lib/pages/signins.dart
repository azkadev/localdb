import 'dart:io';

import 'package:example/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import "package:localdb/localdb.dart";

class Signins extends StatefulWidget {
  const Signins({Key? key, required this.dataAccounts}) : super(key: key);
  final List dataAccounts;
  @override
  FlutterDemoState createState() => FlutterDemoState();
}

class FlutterDemoState extends State<Signins> {
  var selectAccount = "";
  @override
  void initState() {
    super.initState();
    setState(() {
      for (var i = 0; i < widget.dataAccounts.length; i++) {
        var loopData = widget.dataAccounts[i];
        selectAccount += "\n\nName: ${loopData["first_name"].toString()}\nUsername: ${loopData["username"].toString()}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Account'),
      ),
      body: Center(
        child: Text("Total Account\n\n$selectAccount"),
      ),
    );
  }
}
