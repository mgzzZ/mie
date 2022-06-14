import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

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
      body: Container(
        child: MSelectorTag(
          text: '111',
          selected: true,
          type: MSelectorType.wireframe,
          widgetType: MSelectorWidgetType.tips,
          onTap: () {},
          onChanged: (selected) {},
        ),
      ),
    );
  }
}
