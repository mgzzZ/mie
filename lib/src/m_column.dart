import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

///
/// Created by zgm on 2022/2/15
/// Describe:
///

class MPosition {
  int? zoom;
  int? left;
  int? right;
  int? top;
  int? bottom;
  MPosition();

  static MPosition zero() {
    return MPosition()
      ..left = 0
      ..bottom = 0
      ..top = 0;
  }
}

class MColumn extends MultiChildRenderObjectWidget {
  final bool invert;
  final Alignment alignment;
  final Widget? separator;
  final bool separatorOnTop;
  final List<MPosition>? childrenPosition;
  final bool removeChildrenWithNoHeight;

  MColumn({
    Key? key,
    required List<Widget?> children,
    required this.childrenPosition,
    this.invert = false,
    this.alignment = Alignment.center,
    this.separator,
    this.separatorOnTop = true,
    this.removeChildrenWithNoHeight = false,
  }) : super(key: key, children: _childrenPlusSeparator(children, separator));

  static List<Widget> _childrenPlusSeparator(List<Widget?> children, Widget? separator) {
    List<Widget> list = List.of(children.where((child) => child != null).cast());
    if (separator != null && children.isNotEmpty) list.add(separator);
    return list;
  }

  @override
  _RenderMColumnBox createRenderObject(BuildContext context) => _RenderMColumnBox(
        invert: invert,
        alignment: alignment,
        hasSeparator: separator != null && children.isNotEmpty,
        separatorOnTop: separatorOnTop,
        removeChildrenWithNoHeight: removeChildrenWithNoHeight,
        childrenPosition: childrenPosition,
      );

  @override
  void updateRenderObject(BuildContext context, _RenderMColumnBox renderObject) {
    renderObject
      ..invert = invert
      ..alignment = alignment
      ..hasSeparator = separator != null && children.isNotEmpty
      ..separatorOnTop = separatorOnTop
      ..positions = childrenPosition
      ..removeChildrenWithNoHeight = removeChildrenWithNoHeight;
  }
}

class _RenderMColumnBox extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, MultiChildLayoutParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, MultiChildLayoutParentData> {
  //
  _RenderMColumnBox({
    required bool invert,
    required Alignment alignment,
    required bool hasSeparator,
    required bool separatorOnTop,
    required bool removeChildrenWithNoHeight,
    required List<MPosition>? childrenPosition,
  })  : _invert = invert,
        _alignment = alignment,
        _hasSeparator = hasSeparator,
        _separatorOnTop = separatorOnTop,
        _removeChildrenWithNoHeight = removeChildrenWithNoHeight,
        _positions = childrenPosition,
        super();

  List<MPosition>? _positions;
  bool _invert;
  Alignment _alignment;
  bool _hasSeparator;
  bool _separatorOnTop;
  bool _removeChildrenWithNoHeight;

  bool get invert => _invert;

  Alignment get alignment => _alignment;

  bool get hasSeparator => _hasSeparator;

  bool get separatorOnTop => _separatorOnTop;

  bool get removeChildrenWithNoHeight => _removeChildrenWithNoHeight;

  List<MPosition>? get positions => _positions;

  set positions(List<MPosition>? value) {
    if (_positions == value) {
      return;
    }
    _positions = value;
    markNeedsLayout();
  }

  set invert(bool value) {
    if (_invert == value) return;
    _invert = value;
    markNeedsLayout();
  }

  set alignment(Alignment value) {
    if (_alignment == value) return;
    _alignment = value;
    markNeedsLayout();
  }

  set hasSeparator(bool value) {
    if (_hasSeparator == value) return;
    _hasSeparator = value;
    markNeedsLayout();
  }

  set separatorOnTop(bool value) {
    if (_separatorOnTop == value) return;
    _separatorOnTop = value;
    markNeedsLayout();
  }

  set removeChildrenWithNoHeight(bool value) {
    if (_removeChildrenWithNoHeight == value) return;
    _removeChildrenWithNoHeight = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! MultiChildLayoutParentData)
      child.parentData = MultiChildLayoutParentData();
  }

  RenderBox? _renderSeparator;

  RenderBox? get renderSeparator => _renderSeparator;

  late List<RenderBox> _children;

  List<RenderBox> get children => _children;

  void _findChildrenAndSeparator() {
    _children = <RenderBox>[];
    _renderSeparator = null;
    RenderBox? child = firstChild;

    while (child != null) {
      final childParentData = child.parentData as MultiChildLayoutParentData;
      var recentChild = child;
      child = childParentData.nextSibling;
      if (!hasSeparator || child != null) _children.add(recentChild);
    }

    if (hasSeparator) _renderSeparator = lastChild;
  }

  @override
  void performLayout() {
    //
    _findChildrenAndSeparator();

    final innerConstraints = BoxConstraints(maxWidth: constraints.maxWidth);

    for (RenderBox child in _children) {
      child.layout(innerConstraints, parentUsesSize: true);
    }

    if (removeChildrenWithNoHeight && _children.every((child) => child.size.height == 0)) {
      double width = 0;
      for (RenderBox child in _children) if (child.size.width > width) width = child.size.width;
      size = constraints.constrain(Size(width, 0.0));
      return;
    }

    if (_children.isEmpty) {
      size = constraints.constrain(const Size(0.0, 0.0));
      return;
    } else {
      double maxChildWidth = 0.0;
      double dy = 0;
      for (RenderBox child in _children) {
        maxChildWidth = max(maxChildWidth, child.size.width);
      }

      maxChildWidth = max(min(maxChildWidth, constraints.maxWidth), constraints.minWidth);

      for (int i = 0; i < childCount; i++) {
        RenderBox child = _children[i];
        MPosition position = _positions?[i] ?? MPosition.zero();
        dy += (position.top ?? 0) * 1.0;
        final MultiChildLayoutParentData childParentData =
            child.parentData as MultiChildLayoutParentData;
        child.layout(innerConstraints, parentUsesSize: true);
        childParentData.offset = Offset(dx(child, maxChildWidth, position), dy);

        if (child.size.height != 0 || !removeChildrenWithNoHeight)
          dy += child.size.height + (position.bottom ?? 0);
      }

      if (hasSeparator) {
        renderSeparator!.layout(innerConstraints, parentUsesSize: false);
      }

      size = constraints.constrain(Size(maxChildWidth, dy));
    }
  }

  double dx(RenderBox child, double width, MPosition position) {
    final parentWidth = width;
    final childWidth = child.size.width;
    final double centerX = (parentWidth - childWidth) / 2.0;
    return centerX + alignment.x * centerX + (position.left ?? 0) + (position.right ?? 0);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (invert)
      invertPaint(context, offset);
    else
      defaultPaint(context, offset);
  }

  @override
  void defaultPaint(PaintingContext context, Offset offset) {
    if (!separatorOnTop)
      for (int i = 0; i < _children.length; i++) {
        MPosition position = _positions?[i] ?? MPosition.zero();
        final MultiChildLayoutParentData? childParentData =
            _children[i].parentData as MultiChildLayoutParentData?;
        _paintSeparators(i, context, offset, childParentData, position);
      }

    for (int i = 0; i < _children.length; i++) {
      var child = _children[i];
      MPosition position = _positions?[i] ?? MPosition.zero();
      final MultiChildLayoutParentData childParentData =
          child.parentData as MultiChildLayoutParentData;
      context.paintChild(child, childParentData.offset + offset);
      if (separatorOnTop) _paintSeparators(i, context, offset, childParentData, position);
    }
  }

  void invertPaint(PaintingContext context, Offset offset) {
    var children = _children.reversed.toList();

    if (!separatorOnTop)
      for (int i = 0; i < children.length; i++) {
        MPosition position = _positions?[i] ?? MPosition.zero();
        final MultiChildLayoutParentData? childParentData =
            children[i].parentData as MultiChildLayoutParentData?;
        _paintSeparators(i, context, offset, childParentData, position);
      }

    for (int i = 0; i < children.length; i++) {
      var child = children[i];
      MPosition position = _positions?[i] ?? MPosition.zero();
      final MultiChildLayoutParentData childParentData =
          child.parentData as MultiChildLayoutParentData;
      context.paintChild(child, childParentData.offset + offset);
      if (separatorOnTop) _paintSeparators(i, context, offset, childParentData, position);
    }
  }

  void _paintSeparators(
    int i,
    PaintingContext context,
    Offset offset,
    MultiChildLayoutParentData? childParentData,
    MPosition position,
  ) {
    if (hasSeparator && (i > 0) && (i < _children.length)) {
      if (_children[i].size.height != 0 || !removeChildrenWithNoHeight)
        context.paintChild(
            renderSeparator!,
            offset +
                Offset(dx(renderSeparator!, size.width, position),
                    childParentData!.offset.dy - (renderSeparator!.size.height) / 2));
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    _findChildrenAndSeparator();

    double dx = 0.0;
    for (RenderBox child in _children) {
      final minIntrinsicWidth = child.computeMinIntrinsicWidth(height);
      dx = max(dx, minIntrinsicWidth);
    }
    return dx;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    _findChildrenAndSeparator();

    double dx = 0.0;
    for (RenderBox child in _children) {
      final maxIntrinsicWidth = child.computeMaxIntrinsicWidth(height);
      dx = max(dx, maxIntrinsicWidth);
    }
    return dx;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    _findChildrenAndSeparator();

    int removed = 0;
    double dy = 0.0;
    for (RenderBox child in _children) {
      final minIntrinsicHeight = child.computeMinIntrinsicHeight(width);
      if (removeChildrenWithNoHeight && minIntrinsicHeight == 0.0)
        removed++;
      else
        dy += minIntrinsicHeight;
    }

    if (_children.isNotEmpty && (_children.length != removed)) return dy;
    return dy;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    _findChildrenAndSeparator();

    int removed = 0;
    double dy = 0.0;
    for (RenderBox child in _children) {
      final maxIntrinsicHeight = child.computeMaxIntrinsicHeight(width);
      if (removeChildrenWithNoHeight && maxIntrinsicHeight == 0.0)
        removed++;
      else
        dy += maxIntrinsicHeight;
    }

    if (_children.isNotEmpty && (_children.length != removed)) return dy;
    return dy;
  }
}
