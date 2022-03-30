import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

///
/// Created by zgm on 2022/3/7
/// Describe:
///

class MRadioDemoPage extends StatefulWidget {
  const MRadioDemoPage({Key? key}) : super(key: key);

  @override
  _MRadioDemoPageState createState() => _MRadioDemoPageState();
}

class _MRadioDemoPageState extends State<MRadioDemoPage> {
  String str = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MTips Demo '),
      ),
      body: Center(
        child: MRadio(
          selected: str,
          values: ['1', '2', '3'],
          direction: Axis.vertical,
          onChanged: (String value) {
            print(value);
            setState(() {
              str = value;
            });
          },
        ),
      ),
    );
  }
}
