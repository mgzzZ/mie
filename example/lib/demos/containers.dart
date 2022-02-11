import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

///
/// Created by zgm on 2022/1/14
/// Describe:
///

class Containers extends StatefulWidget {
  const Containers({Key? key}) : super(key: key);

  @override
  _ContainersState createState() => _ContainersState();
}

class _ContainersState extends State<Containers> {
  String text = '123';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contains'),
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MItemContainers(
              color: Colors.red,
              child: Text(text),
            ),
            MTextField(
              controller: controller,
              text: text,
              onChanged: (_) => setState(() => text = _),
            ),
          ],
        ),
      ),
    );
  }
}
