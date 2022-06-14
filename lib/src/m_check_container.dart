import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

///
/// Created by zgm on 2022/6/14
/// Describe:
///

class MCheckContainer extends StatefulWidget {
  const MCheckContainer(
      {Key? key,
      this.selected,
      required this.values,
      required this.onChanged,
      required this.direction,
      this.type,
      this.widgetType})
      : super(key: key);
  final List<String>? selected;
  final List<String> values;
  final ValueChanged<List<String>> onChanged;
  final Axis direction;
  final MSelectorType? type;
  final MSelectorWidgetType? widgetType;
  @override
  _MCheckContainerState createState() => _MCheckContainerState();
}

class _MCheckContainerState extends State<MCheckContainer> with MCheckAble<String> {
  List<String> _list = [];
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
      return MSelectorTag(
        text: e,
        selected: selected,
        type: widget.type,
        widgetType: widget.widgetType,
        onTap: () {
          var list = selectedAction(e);
          widget.onChanged(list);
        },
      );
    }).toList();
    return Wrap(
      direction: widget.direction,
      children: list,
      runSpacing: 5,
      spacing: 10,
    );
  }
}
