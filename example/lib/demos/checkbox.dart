import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

///
/// Created by zgm on 2022/3/7
/// Describe:
///

class MChcekBoxDemoPage extends StatefulWidget {
  const MChcekBoxDemoPage({Key? key}) : super(key: key);

  @override
  _MChcekBoxDemoPageState createState() => _MChcekBoxDemoPageState();
}

class _MChcekBoxDemoPageState extends State<MChcekBoxDemoPage> {
  List<String> list = ['1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCheckBox Demo '),
      ),
      body: Center(
        child: MCheckBox(
          selected: list,
          values: ['1', '2'],
          onChanged: (List<String> values) {
            print(values);
            setState(() {
              list = values;
            });
          },
        ),
      ),
    );
  }
}
