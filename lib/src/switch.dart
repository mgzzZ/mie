import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Created by zgm on 2022/4/28
/// Describe:
///

class MSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  const MSwitch({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
      trackColor: Color(0xFFB9BFC9),
    );
  }
}
