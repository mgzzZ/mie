import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

///
/// Created by zgm on 2022/2/16
/// Describe:
///

class TipsDemoPage extends StatefulWidget {
  const TipsDemoPage({Key? key}) : super(key: key);

  @override
  _TipsDemoPageState createState() => _TipsDemoPageState();
}

class _TipsDemoPageState extends State<TipsDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MTips Demo '),
      ),
      body: Container(
        child: Column(
          children: [
            MTips(
              count: 2,
              child: Text('我测试一下呢'),
            ),
            MTips(),
            MIcon.icons(
              icon: Icons.add,
            ),
          ],
        ),
      ),
    );
  }
}
