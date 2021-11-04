import 'dart:io';

import 'package:example/database/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';
import 'package:localdb/javascript/javascript.dart';
import 'widget/header_widget.dart.txt';
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Azka Dev",
      home: SplashSreen(),
    ),
  );
}

class SplashSreen extends StatefulWidget {
  const SplashSreen({Key? key}) : super(key: key);
  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<SplashSreen> {
  bool hashAccount = false;
  @override
  void initState() {
    super.initState();
    Database("/data.json").JsonDb.then((db) {
      var dataDefault = {"account": []};
      db.defaults(dataDefault).write();
      var getAccount = db.get("account").value();
      print(getAccount.length);
      setState(() {
        if (getAccount.length == 0) {
          hashAccount = false;
        } else {
          hashAccount = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (hashAccount) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Anda Linux'),
        ),
        body: Center(
          child:
              Text((hashAccount) ? "Ada Account" : "Tidak Ada Account satupun"),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: const [
            SizedBox(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
          ],
        ),
      ),
      );
    }
  }
}
