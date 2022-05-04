import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mie/mie.dart';

///
/// Created by zgm on 2022/4/28
/// Describe:
///
class MSwitchDemoPage extends StatefulWidget {
  @override
  State<MSwitchDemoPage> createState() => _MSwitchDemoPageState();
}

class _MSwitchDemoPageState extends State<MSwitchDemoPage> {
  late bool switchState = true;
  @override
  void initState() {
    super.initState();
    switchState = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Demo'),
      ),
      body: MSwitch(
          value: switchState,
          onChanged: (val) {
            setState(() {
              switchState = val;
            });
          }),
    );
  }
}
