import 'package:flutter/material.dart';

class MText extends StatelessWidget {
  final String data;
  final String? fontName;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final bool? softWrap;
  final int? maxLines;

  const MText({
    Key? key,
    required this.data,
    this.fontName,
    this.fontSize,
    this.textColor,
    this.textStyle,
    this.fontWeight,
    this.textAlign,
    this.textOverflow,
    this.softWrap,
    this.maxLines,
  }) : super(key: key);

  /// Extremely large text.
  static Widget h1(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.headline1;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  /// Very, very large text.
  ///
  /// Used for the date in the dialog shown by [showDatePicker].
  static Widget h2(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.headline2;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  /// Very large text.
  static Widget h3(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.headline3;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  /// Large text.
  static Widget h4(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.headline4;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  /// Used for large text in dialogs (e.g., the month and year in the dialog
  /// shown by [showDatePicker]).
  static Widget h5(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.headline5;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  /// Used for the primary text in app bars and dialogs (e.g., [AppBar.title]
  /// and [AlertDialog.title]).
  static Widget h6(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.headline6;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  /// Used for emphasizing text that would otherwise be [bodyText2].
  static Widget body1(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  /// The default text style for [Material].
  static Widget body2(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.bodyText2;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  /// Used for the primary text in lists (e.g., [ListTile.title]).
  static Widget subTitle1(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  /// For medium emphasis text that's a little smaller than [subtitle1].
  static Widget subTitle2(
    String data, {
    Color? textColor,
    double? fontSize,
    String? fontName,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    int? maxLines,
  }) {
    return Builder(builder: (context) {
      TextStyle? textStyle = Theme.of(context).textTheme.subtitle2;
      return MText(
        data: data,
        textStyle: textStyle?.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontFamily: fontName,
            fontSize: fontSize),
        textAlign: textAlign,
        maxLines: maxLines,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = textStyle ??
        TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: fontName,
            fontWeight: fontWeight);

    return Text(
      data,
      style: style,
      textAlign: textAlign,
      overflow: textOverflow,
      softWrap: softWrap,
      maxLines: maxLines,
    );
  }
}
