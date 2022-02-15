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
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFields'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '普通默认无边框的输入框:',
            style: TextStyle(fontSize: 22),
          ),
          MTextField(
            text: text,
            group: true,
          ),
          Text(
            '有状态的输入框:',
            style: TextStyle(fontSize: 22),
          ),
          Builder(builder: (context) {
            String? error;
            if (text == '123') {
              error = '错误';
            } else {
              error = null;
            }
            return MStateTextField(
              errorText: error,
              labelText: '测试',
              onChanged: (str) {
                setState(() {
                  text = str;
                });
              },
            );
          }),
          Text(
            '固定高度的多行输入框:',
            style: TextStyle(fontSize: 22),
          ),
          MTextView(
            height: 150,
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
