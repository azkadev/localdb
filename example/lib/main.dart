import 'dart:io';

import 'package:example/database/database.dart';
import 'package:example/pages/signins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:localdb/jsondb.dart';
import 'package:localdb/file/file.dart';
import 'package:localdb/javascript/javascript.dart';
import 'widget/header_widget.dart.txt';
import 'pages/home.dart';

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
          if (ifjs(false)) {
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
            dataAccounts = [
              {
                "user_id": 1,
                "first_name": "Gibran",
                "last_name": "",
                "photo": "",
                "username": "azkadev",
                "email": "gatau@gmail.com",
                "password": "azkatampan"
              },
              {
                "user_id": 2,
                "first_name": "Farel",
                "last_name": "Arr",
                "photo": "",
                "username": "farel",
                "email": "farel@gmail.com",
                "password": "farel12345"
              }
            ];
            hashSign = false;
          }
          hashAccount = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (hashAccount) {
      if (hashSign) {
        return MaterialApp(
          debugShowCheckedModeBanner: true,
          title: "Home",
          home: Home(dataAccount: dataAccount),
        );
      } else {
        return MaterialApp(
          debugShowCheckedModeBanner: true,
          title: "Home",
          home: Signins(dataAccounts: dataAccounts),
        );
      }
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
