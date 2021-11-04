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
  const Home({Key? key}) : super(key: key);
  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<Home> {
  bool hashAccount = false;
  bool hashSign = false;

  Map dataAccount = {};
  List dataAccounts = [];
  @override
  void initState() {
    super.initState();
    Database("/data.json").JsonDb.then((db) {
      var dataDefault = {"account": []};
      db.defaults(dataDefault).write();
      var getAccounts = db.get("account").value();
      setState(() {
        if (getAccounts.length == 0) {
          hashAccount = false;
        } else {
          var getAccountSigned =
              db.get("account").find({"status": "signed"}).value();
          if (ifjs(getAccountSigned)) {
            dataAccount = {
              "user_id": 1,
              "first_name": "Gibran",
              "last_name": "",
              "photo": "",
              "username": "azkadev",
              "email": "gatau@gmail.com",
              "password": "azkatampan"
            };
            hashSign = true;
          } else {
            dataAccounts = [];
            hashSign = false;
          }
          hashAccount = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hey ${dataAccount["first_name"].toString()}'),
      ),
      body: const Center(
        child: Text("Hey Selamat Datang Kembali di applikasi"),
      ),
    );
  }
}
