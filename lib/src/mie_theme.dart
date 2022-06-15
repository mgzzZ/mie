import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

@immutable
class MColorThemeEtx extends ThemeExtension<MColorThemeEtx> {
  final Color? appBackGroundColor;
  final Color? accentColor;
  final Color? errorColor;
  final Color? cardColor;

  const MColorThemeEtx({
    required this.appBackGroundColor,
    required this.accentColor,
    required this.errorColor,
    required this.cardColor,
  });

  @override
  ThemeExtension<MColorThemeEtx> copyWith({
    Color? appBackGroundColor,
    Color? accentColor,
    Color? errorColor,
    Color? cardColor,
  }) {
    return MColorThemeEtx(
      appBackGroundColor: appBackGroundColor ?? this.appBackGroundColor,
      accentColor: accentColor ?? this.accentColor,
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
      accentColor: Color.lerp(accentColor, other.accentColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      cardColor: Color.lerp(cardColor, other.cardColor, t),
    );
  }

  @override
  String toString() {
    return 'MColorThemeEtx('
        'appBackGroundColor: $appBackGroundColor,'
        ' accentColor: $accentColor, '
        'errorColor: $errorColor, '
        'cardColor: $cardColor'
        ')';
  }
}

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
        'mainBackGroundColor:$mainBackGroundColor,mainTextColor:$mainTextColor,secondaryBackGroundColor:$secondaryBackGroundColor,secondaryTextColor:$secondaryTextColor,mainRadius:$mainRadius,secondaryRadius:$secondaryRadius'
        ')';
  }
}
