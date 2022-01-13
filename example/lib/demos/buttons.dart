import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

///
/// Created by zgm on 2022/1/13
/// Describe:
///

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MButton('这是一个button', onTap: () => print('点击方法')),
          MButton.main('这是主按钮', onTap: () {}),
          MButton.secondary('这是次按钮', onTap: () {}),
          MStateButton(
            '这是又状态的按钮',
            padding: const EdgeInsets.all(0),
            onTap: () => Future.delayed(Duration(seconds: 2), () => print("我是从互联网上获取的数据")),
          ),
          MStateButton.main('这是有状态的主按钮',
              onTap: () => Future.delayed(Duration(seconds: 2), () => print("我是从互联网上获取的数据"))),
        ],
      ),
    );
  }
}
