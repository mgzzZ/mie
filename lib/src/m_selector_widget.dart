import 'package:flutter/material.dart';

///
/// Created by zgm on 2022/6/14
/// Describe:
///

enum MSelectorType { solid_color, wireframe }

enum MSelectorWidgetType { normal, tips }

class MSelectorWidget extends StatelessWidget {
  const MSelectorWidget(
      {Key? key,
      required this.child,
      this.onTap,
      this.selected,
      this.type = MSelectorType.solid_color,
      this.widgetType = MSelectorWidgetType.normal,
      this.onChanged})
      : super(key: key);
  final Widget child;
  final VoidCallback? onTap;
  final bool? selected;
  final MSelectorType? type;
  final MSelectorWidgetType? widgetType;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    bool _enable = onTap == null;
    bool _selected = selected ?? false;
    bool hasTips = widgetType == MSelectorWidgetType.tips;
    bool fulColor = type == MSelectorType.solid_color;
    double _radius = 0;
    Color _getBackGroundColor() {
      Color _color;
      if (!hasTips) {
        if (fulColor) {
          if (_selected && !_enable) {
            _color = Theme.of(context).primaryColor;
          } else if (_selected && _enable) {
            _color = Theme.of(context).primaryColor.withOpacity(0.04);
          } else if (!_selected && !_enable) {
            _color =
                (Theme.of(context).textTheme.bodyText1?.color ?? Colors.black).withOpacity(0.04);
          } else {
            _color =
                (Theme.of(context).textTheme.bodyText1?.color ?? Colors.black).withOpacity(0.02);
          }
        } else {
          _color = Theme.of(context).scaffoldBackgroundColor;
        }
      } else {
        if (fulColor) {
          if (_selected && !_enable) {
            _color = Theme.of(context).primaryColor.withOpacity(0.1);
          } else if (_selected && _enable) {
            _color = Theme.of(context).primaryColor.withOpacity(0.04);
          } else if (!_selected && !_enable) {
            _color =
                (Theme.of(context).textTheme.bodyText1?.color ?? Colors.black).withOpacity(0.04);
          } else {
            _color =
                (Theme.of(context).textTheme.bodyText1?.color ?? Colors.black).withOpacity(0.02);
          }
        } else {
          _color = Theme.of(context).scaffoldBackgroundColor;
        }
      }

      return _color;
    }

    Color _getBorderColor() {
      Color? _color;
      if (_selected) {
        _color = Theme.of(context).primaryColor;
      }
      if (_color != null && _enable) {
        _color = _color.withOpacity(0.4);
      }
      return _color ?? Colors.transparent;
    }

    return GestureDetector(
      onTap: () {
        onTap?.call();
        onChanged?.call(!_selected);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: _getBackGroundColor(),
            borderRadius: BorderRadius.circular(_radius),
            border: fulColor ? null : Border.all(color: _getBorderColor(), width: 1)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: child,
            ),
            if (hasTips && _selected) ...[
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.add,
                    size: 12,
                  )),
            ]
          ],
        ),
      ),
    );
  }
}

class MSelectorTag extends MSelectorWidget {
  final VoidCallback? onTap;
  final bool? selected;
  final MSelectorType? type;
  final MSelectorWidgetType? widgetType;
  MSelectorTag({
    required String text,
    ValueChanged<bool>? onChanged,
    this.onTap,
    this.selected,
    this.type = MSelectorType.solid_color,
    this.widgetType = MSelectorWidgetType.normal,
  }) : super(
          child: _Text(
            text: text,
            selected: selected,
            type: type,
            widgetType: widgetType,
          ),
          onChanged: onChanged,
          onTap: onTap,
          selected: selected,
          type: type,
          widgetType: widgetType,
        );
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.text,
    this.selected = false,
    this.type = MSelectorType.solid_color,
    this.widgetType = MSelectorWidgetType.normal,
  }) : super(key: key);
  final String text;
  final bool? selected;
  final MSelectorType? type;
  final MSelectorWidgetType? widgetType;
  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    bool hasTips = widgetType == MSelectorWidgetType.tips;
    bool fulColor = type == MSelectorType.solid_color;

    Color getTextColor() {
      if (!_selected) {
        return Colors.black;
      } else {
        if (hasTips) {
          return Theme.of(context).primaryColor;
        } else {
          if (fulColor) {
            return Colors.white;
          } else {
            return Theme.of(context).primaryColor;
          }
        }
      }
    }

    return Text(
      text,
      style: TextStyle(fontSize: 12, color: getTextColor()),
    );
  }
}
