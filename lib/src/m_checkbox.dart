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
  const MCheckBox(
      {Key? key,
      this.selected,
      required this.values,
      required this.onChanged,
      this.selectedWidget,
      this.normalWidget})
      : super(key: key);

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
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var value = widget.values[index];
        bool selected = _list.contains(value);
        return GestureDetector(
          onTap: () {
            var list = selectedAction(value);
            widget.onChanged(list);
          },
          child: Row(
            children: [
              selected ? _selectedWidget : _normalWidget,
              Text(
                value.toString(),
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        );
      },
      itemCount: widget.values.length,
    );
  }
}
