import 'package:flutter/material.dart';
import 'package:mie/src/check_able.dart';

///
/// Created by zgm on 2022/3/7
/// Describe:
///

class MCheckBox extends StatefulWidget {
  final List<String>? selected;
  final List<String> values;
  final ValueChanged<List<String>> onChanged;
  final Widget? selectedWidget;
  final Widget? normalWidget;
  final Axis direction;
  final double runSpacing;
  final double spacing;
  const MCheckBox({
    Key? key,
    this.selected,
    required this.values,
    required this.onChanged,
    this.selectedWidget,
    this.normalWidget,
    this.direction = Axis.horizontal,
    this.runSpacing = 0.0,
    this.spacing = 0.0,
  }) : super(key: key);

  @override
  _MCheckBoxState createState() => _MCheckBoxState();
}

class _MCheckBoxState extends State<MCheckBox> with MCheckAble<String> {
  List<String> _list = [];

  Widget get _selectedWidget =>
      widget.selectedWidget ??
      Icon(
        Icons.check_box,
        size: 16,
      );
  Widget get _normalWidget =>
      widget.normalWidget ??
      Icon(
        Icons.check_box_outline_blank,
        size: 16,
      );

  @override
  void initState() {
    super.initState();
    initAction(widget.selected ?? []);
    updateValue();
  }

  void updateValue() {
    if (widget.selected != null && widget.selected!.length != 0) {
      _list = widget.selected!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    updateValue();
    List<Widget> list = widget.values.map((e) {
      bool selected = _list.contains(e);
      return GestureDetector(
        onTap: () {
          var list = selectedAction(e);
          widget.onChanged(list);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            selected ? _selectedWidget : _normalWidget,
            Text(
              e.toString(),
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      );
    }).toList();
    return Wrap(
      direction: widget.direction,
      children: list,
      runSpacing: widget.runSpacing,
      spacing: widget.spacing,
    );
  }
}
