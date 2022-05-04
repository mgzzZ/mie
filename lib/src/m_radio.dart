import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mie/src/radio_able.dart';

///
/// Created by zgm on 2022/3/7
/// Describe:
///

class MRadio extends StatefulWidget {
  const MRadio({
    Key? key,
    this.selected,
    required this.values,
    required this.onChanged,
    this.direction = Axis.horizontal,
  }) : super(key: key);
  final String? selected;
  final List<String> values;
  final ValueChanged<String> onChanged;
  final Axis direction;
  @override
  _MRadioState createState() => _MRadioState();
}

class _MRadioState extends State<MRadio> with MRadioAble<String> {
  String _value = '';

  @override
  void initState() {
    super.initState();
    if (widget.selected != null && widget.selected!.length != 0) {
      initSelectedAction(widget.selected!);
    }
    updateValueAction();
  }

  void updateValueAction() {
    if (widget.selected != null && widget.selected!.length != 0 && _value != widget.selected!) {
      _value = widget.selected!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    updateValueAction();
    List<Widget> list = widget.values.map((e) {
      bool selected = e == _value;
      return GestureDetector(
        onTap: () {
          selectedAction(e);
          widget.onChanged(selectedValue);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            selected
                ? Icon(
                    Icons.radio_button_checked,
                    size: 16,
                  )
                : Icon(
                    Icons.radio_button_off,
                    size: 16,
                  ),
            Text(
              e,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      );
    }).toList();

    return Wrap(
      spacing: 10,
      runSpacing: 5,
      children: list,
      direction: widget.direction,
    );
  }
}
