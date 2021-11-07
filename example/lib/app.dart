// ignore_for_file: unused_local_variable, duplicate_ignore

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Azka Dev",
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<App> {
  late String quote;
  @override
  void initState() {
    super.initState();
    setState(() {
      // ignore: unused_local_variable
      var quotes = ["hay kamu", "hay aku"];
      quote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  // ignore: duplicate_ignore, duplicate_ignore
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // ignore: unused_local_variable
    final getHeight = mediaQuery.size.height;
    final getWidth = mediaQuery.size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Home",
      home: Center(
        child: Text("quote: ${quote.toString()}"),
      ),
    );
  }
}
