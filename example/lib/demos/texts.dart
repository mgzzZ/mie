import 'package:flutter/material.dart';

///
/// Created by zgm on 2022/1/13
/// Describe:
///

class Texts extends StatefulWidget {
  const Texts({Key? key}) : super(key: key);

  @override
  _TextsState createState() => _TextsState();
}

class _TextsState extends State<Texts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Texts'),
      ),
      body: Container(),
    );
  }
}
