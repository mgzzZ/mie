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
      body: GestureDetector(
        onTap: () {
          print('最外层');
        },
        child: Container(
          color: Colors.white,
          child: MColumn(
            invert: true,
            alignment: Alignment.centerLeft,
            children: [
              GestureDetector(
                onTap: () {
                  print('红');
                },
                child: Container(
                  color: Colors.red[200],
                  width: 200,
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('绿');
                },
                child: Container(
                  color: context.b4,
                  width: 320,
                  height: 120,
                ),
              ),
            ],
            childrenPosition: [
              MPosition()
                ..top = 10
                ..left = 10
                ..bottom = 10,
              MPosition()
                ..top = -20
                ..bottom = 10,
            ],
          ),
        ),
      ),
    );
  }
}
