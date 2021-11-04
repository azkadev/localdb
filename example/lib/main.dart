// main.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'azka dev',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This will be displayed on the screen
  late String _content;

  // Find the Documents path
  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }

  // This function is triggered when the "Read" button is pressed
  Future<void> _readData() async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    final _data = await _myFile.readAsString(encoding: utf8);
    setState(() {
      _content = _data;
    });
  }

  // TextField controller
  final _textController = TextEditingController();
  // This function is triggered when the "Write" buttion is pressed
  Future<void> _writeData() async {
    final _dirPath = await _getDirPath();
    
    final _myFile = File('$_dirPath/data.txt');
    // If data.txt doesn't exist, it will be created automatically

    await _myFile.writeAsString(_textController.text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Enter your name'),
            ),
            ElevatedButton(
              child: const Text('Save to file'),
              onPressed: _writeData,
            ),
            const SizedBox(
              height: 150,
            ),
            Text(
                (_content.isNotEmpty)?_content:"Please Click",
                style: const TextStyle(fontSize: 24, color: Colors.pink)),
            ElevatedButton(
              child: const Text('Read my name from the file'),
              onPressed: _readData,
            )
          ],
        ),
      ),
    );
  }
}