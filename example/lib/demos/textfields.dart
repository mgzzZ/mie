import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

///
/// Created by zgm on 2022/1/13
/// Describe:
///

class TextFields extends StatefulWidget {
  const TextFields({Key? key}) : super(key: key);

  @override
  _TextFieldsState createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFields'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MTextField(
            text: '123',
          ),
        ],
      ),
    );
  }
}
