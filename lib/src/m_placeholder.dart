import 'dart:math';

import 'package:flutter/material.dart';

///
/// Created by zgm on 2022/3/23
/// Describe:
///

class MPlaceholder extends StatelessWidget {
  const MPlaceholder({Key? key, this.asset, this.width = 120, this.height = 120, this.widget})
      : super(key: key);
  final String? asset;
  final double width;
  final double height;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).backgroundColor;
    return LayoutBuilder(builder: (context, constraints) {
      double minSize = min(constraints.maxHeight, constraints.maxWidth);
      double parentSize = min(width, height);
      double iconSize = 120;
      double size = minSize == double.infinity ? parentSize : minSize;
      if (size <= iconSize) {
        return Container(
          width: size,
          height: size,
          child: widget,
        );
      }

      return IntrinsicHeight(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                child: Container(
              color: backgroundColor,
            )),
            Container(
              width: iconSize,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      child: Container(
                    color: backgroundColor,
                  )),
                  Container(
                    width: iconSize,
                    height: iconSize,
                    child: widget,
                  ),
                  Expanded(
                      child: Container(
                    color: backgroundColor,
                  )),
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: backgroundColor,
            )),
          ],
        ),
      );
    });
  }
}
