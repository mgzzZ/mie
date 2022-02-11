import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Created by zgm on 2022/1/13
/// Describe:
///

/// TODO: 卡片,叠加容器,

/// 自带边距的containers
class MItemContainers extends StatelessWidget {
  final Widget? child;

  final AlignmentGeometry? alignment;

  final EdgeInsetsGeometry? padding;

  final Color? color;

  final Decoration? decoration;

  final Decoration? foregroundDecoration;

  final BoxConstraints? constraints;

  final EdgeInsetsGeometry? margin;

  final Matrix4? transform;

  final AlignmentGeometry? transformAlignment;

  final Clip clipBehavior;

  final double? width;

  final double? height;

  MItemContainers({
    Key? key,
    this.child,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: child,
      alignment: alignment,
      width: width,
      height: height,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      constraints: constraints,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      margin: margin ?? const EdgeInsets.all(16),
      padding: padding ?? const EdgeInsets.all(16),
    );
  }
}

class MCard extends Card {}
