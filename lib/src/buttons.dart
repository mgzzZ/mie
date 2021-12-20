import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

class MButton extends TextButton {
  final String text;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;
  final ButtonStyle? style;
  MButton(this.text,
      {required this.onTap, this.backgroundColor, this.textColor, this.textSize, this.style})
      : super(
            child: Text(text),
            onPressed: onTap,
            style: style ?? TextButton.styleFrom(backgroundColor: backgroundColor));

  static Widget main(String text, {VoidCallback? onTap}) {
    return Builder(builder: (context) {
      MButtonThemeData theme = context.ofMieTheme().buttonThemeData;
      ButtonStyle style = TextButton.styleFrom(
          backgroundColor: theme.mainBackGroundColor, primary: theme.mainTextColor);
      return MButton(
        text,
        onTap: onTap,
        style: style,
      );
    });
  }

  static Widget secondary(String text, {VoidCallback? onTap}) {
    return Builder(builder: (context) {
      MButtonThemeData theme = context.ofMieTheme().buttonThemeData;
      ButtonStyle style = TextButton.styleFrom(
          backgroundColor: theme.secondaryBackGroundColor, primary: theme.secondaryTextColor);
      return MButton(
        text,
        onTap: onTap,
        style: style,
      );
    });
  }
}
