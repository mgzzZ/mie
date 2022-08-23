import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

/// 情景色
@immutable
class MColorThemeEtx extends ThemeExtension<MColorThemeEtx> {
  final Color? appBackGroundColor;
  final Color? errorColor;
  final Color? cardColor;

  MColorThemeEtx({
    required this.appBackGroundColor,
    required this.errorColor,
    required this.cardColor,
  });

  @override
  ThemeExtension<MColorThemeEtx> copyWith({
    Color? appBackGroundColor,
    Color? errorColor,
    Color? cardColor,
  }) {
    return MColorThemeEtx(
      appBackGroundColor: appBackGroundColor ?? this.appBackGroundColor,
      errorColor: errorColor ?? this.errorColor,
      cardColor: cardColor ?? this.cardColor,
    );
  }

  @override
  ThemeExtension<MColorThemeEtx> lerp(ThemeExtension<MColorThemeEtx>? other, double t) {
    if (other is! MColorThemeEtx) {
      return this;
    }
    return MColorThemeEtx(
      appBackGroundColor: Color.lerp(appBackGroundColor, other.appBackGroundColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      cardColor: Color.lerp(cardColor, other.cardColor, t),
    );
  }

  @override
  String toString() {
    return 'MColorThemeEtx('
        'appBackGroundColor: $appBackGroundColor,'
        'errorColor: $errorColor, '
        'cardColor: $cardColor'
        ')';
  }
}

/// 按钮色
@immutable
class MButtonThemeEtx extends ThemeExtension<MButtonThemeEtx> {
  final Color? mainBackGroundColor;
  final Color? mainTextColor;
  final Color? secondaryBackGroundColor;
  final Color? secondaryTextColor;

  /// 圆角
  final double? mainRadius;
  final double? secondaryRadius;
  const MButtonThemeEtx({
    required this.mainBackGroundColor,
    required this.mainTextColor,
    required this.secondaryBackGroundColor,
    required this.secondaryTextColor,
    required this.mainRadius,
    required this.secondaryRadius,
  });

  @override
  ThemeExtension<MButtonThemeEtx> copyWith({
    Color? mainBackGroundColor,
    Color? mainTextColor,
    Color? secondaryBackGroundColor,
    Color? secondaryTextColor,
    double? mainRadius,
    double? secondaryRadius,
  }) {
    return MButtonThemeEtx(
        mainBackGroundColor: mainBackGroundColor ?? this.mainBackGroundColor,
        mainTextColor: mainTextColor ?? this.mainTextColor,
        secondaryBackGroundColor: secondaryBackGroundColor ?? this.secondaryBackGroundColor,
        secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
        mainRadius: mainRadius ?? this.mainRadius,
        secondaryRadius: secondaryRadius ?? this.secondaryRadius);
  }

  @override
  ThemeExtension<MButtonThemeEtx> lerp(ThemeExtension<MButtonThemeEtx>? other, double t) {
    if (other is! MButtonThemeEtx) {
      return this;
    }
    return MButtonThemeEtx(
      mainBackGroundColor: Color.lerp(mainBackGroundColor, other.mainBackGroundColor, t),
      mainTextColor: Color.lerp(mainTextColor, other.mainTextColor, t),
      secondaryBackGroundColor:
          Color.lerp(secondaryBackGroundColor, other.secondaryBackGroundColor, t),
      secondaryTextColor: Color.lerp(secondaryTextColor, other.secondaryTextColor, t),
      mainRadius: lerpDouble(mainRadius, other.mainRadius, t),
      secondaryRadius: lerpDouble(secondaryRadius, other.secondaryRadius, t),
    );
  }

  @override
  String toString() {
    return 'MButtonThemeEtx('
        'mainBackGroundColor:$mainBackGroundColor,'
        'mainTextColor:$mainTextColor,'
        'secondaryBackGroundColor:$secondaryBackGroundColor,'
        'secondaryTextColor:$secondaryTextColor,'
        'mainRadius:$mainRadius,'
        'secondaryRadius:$secondaryRadius'
        ')';
  }
}

/// 文本色
class MTextThemeEtx extends ThemeExtension<MTextThemeEtx> {
  final Color? textColor;
  Color n1;
  Color n2;
  Color n3;
  Color n4;
  Color n5;
  Color n6;
  Color n7;
  Color n8;
  MTextThemeEtx({
    required this.textColor,
  })  : n8 = textColor ?? Colors.black,
        n7 = (textColor ?? Colors.black).withOpacity(0.8),
        n6 = (textColor ?? Colors.black).withOpacity(0.56),
        n5 = (textColor ?? Colors.black).withOpacity(0.32),
        n4 = (textColor ?? Colors.black).withOpacity(0.2),
        n3 = (textColor ?? Colors.black).withOpacity(0.12),
        n2 = (textColor ?? Colors.black).withOpacity(0.08),
        n1 = (textColor ?? Colors.black).withOpacity(0.04);

  @override
  ThemeExtension<MTextThemeEtx> copyWith({
    Color? textColor,
  }) {
    return MTextThemeEtx(
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<MTextThemeEtx> lerp(ThemeExtension<MTextThemeEtx>? other, double t) {
    if (other is! MTextThemeEtx) {
      return this;
    }
    return MTextThemeEtx(
      textColor: Color.lerp(textColor, other.textColor, t),
    );
  }

  @override
  String toString() {
    return 'MTextThemeEtx('
        'textColor:$textColor,'
        ')';
  }
}

/// 主色

class MPrimaryColorThemeEtx extends ThemeExtension<MPrimaryColorThemeEtx> {
  final Color? color;
  Color b1;
  Color b2;
  Color b3;
  Color b4;
  Color b5;
  Color b6;
  MPrimaryColorThemeEtx({
    required this.color,
  })  : b6 = Color.alphaBlend(Colors.black.withOpacity(0.4), (color ?? Colors.blue)),
        b5 = Color.alphaBlend(Colors.black.withOpacity(0.2), (color ?? Colors.blue)),
        b4 = (color ?? Colors.blue),
        b3 = (color ?? Colors.blue).withOpacity(0.8),
        b2 = (color ?? Colors.blue).withOpacity(0.5),
        b1 = (color ?? Colors.blue).withOpacity(0.1);

  @override
  ThemeExtension<MPrimaryColorThemeEtx> copyWith({
    Color? textColor,
  }) {
    return MPrimaryColorThemeEtx(
      color: color ?? this.color,
    );
  }

  @override
  ThemeExtension<MPrimaryColorThemeEtx> lerp(
      ThemeExtension<MPrimaryColorThemeEtx>? other, double t) {
    if (other is! MPrimaryColorThemeEtx) {
      return this;
    }
    return MPrimaryColorThemeEtx(
      color: Color.lerp(color, other.color, t),
    );
  }

  @override
  String toString() {
    return 'MPrimaryColorThemeEtx('
        'color:$color,'
        ')';
  }
}

/// 情绪色
/// Emotional color

class MEmotionalColorThemeEtx extends ThemeExtension<MEmotionalColorThemeEtx> {
  final Color? yellowColor;
  final Color? orangeColor;
  final Color? redColor;
  final Color? greenColor;
  Color y1;
  Color y4;
  Color o1;
  Color o4;
  Color r1;
  Color r4;
  Color g1;
  Color g4;
  MEmotionalColorThemeEtx({
    required this.yellowColor,
    required this.orangeColor,
    required this.redColor,
    required this.greenColor,
  })  : y1 = (yellowColor ?? Colors.yellow).withOpacity(0.1),
        y4 = (yellowColor ?? Colors.yellow).withOpacity(0.4),
        o1 = (orangeColor ?? Colors.orange).withOpacity(0.1),
        o4 = (orangeColor ?? Colors.orange).withOpacity(0.4),
        r1 = (redColor ?? Colors.red).withOpacity(0.1),
        r4 = (redColor ?? Colors.red).withOpacity(0.4),
        g1 = (greenColor ?? Colors.green).withOpacity(0.1),
        g4 = (greenColor ?? Colors.green).withOpacity(0.4);

  @override
  ThemeExtension<MEmotionalColorThemeEtx> copyWith({
    Color? textColor,
  }) {
    return MEmotionalColorThemeEtx(
      yellowColor: yellowColor ?? this.yellowColor,
      orangeColor: orangeColor ?? this.orangeColor,
      redColor: redColor ?? this.redColor,
      greenColor: greenColor ?? this.greenColor,
    );
  }

  @override
  ThemeExtension<MEmotionalColorThemeEtx> lerp(
      ThemeExtension<MEmotionalColorThemeEtx>? other, double t) {
    if (other is! MEmotionalColorThemeEtx) {
      return this;
    }
    return MEmotionalColorThemeEtx(
      yellowColor: Color.lerp(yellowColor, other.yellowColor, t),
      orangeColor: Color.lerp(orangeColor, other.orangeColor, t),
      redColor: Color.lerp(redColor, other.redColor, t),
      greenColor: Color.lerp(greenColor, other.greenColor, t),
    );
  }

  @override
  String toString() {
    return 'MEmotionalColorThemeEtx('
        'yellowColor:$yellowColor,'
        'orangeColor:$orangeColor,'
        'redColor:$redColor,'
        'greenColor:$greenColor,'
        ')';
  }
}
