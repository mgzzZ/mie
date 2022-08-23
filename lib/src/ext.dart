import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

///
/// Created by zgm on 2022/8/23
/// Describe:
///

extension MieContextEtx on BuildContext {
  Color get b1 =>
      Theme.of(this).extension<MPrimaryColorThemeEtx>()?.b1 ?? Colors.blue.withOpacity(0.1);
  Color get b2 =>
      Theme.of(this).extension<MPrimaryColorThemeEtx>()?.b2 ?? Colors.blue.withOpacity(0.5);
  Color get b3 =>
      Theme.of(this).extension<MPrimaryColorThemeEtx>()?.b3 ?? Colors.blue.withOpacity(0.8);
  Color get b4 => Theme.of(this).extension<MPrimaryColorThemeEtx>()?.b4 ?? Colors.blue;
  Color get b5 =>
      Theme.of(this).extension<MPrimaryColorThemeEtx>()?.b5 ??
      Color.alphaBlend(Colors.black.withOpacity(0.2), Colors.blue);
  Color get b6 =>
      Theme.of(this).extension<MPrimaryColorThemeEtx>()?.b6 ??
      Color.alphaBlend(Colors.black.withOpacity(0.4), Colors.blue);
  Color get y1 =>
      Theme.of(this).extension<MEmotionalColorThemeEtx>()?.y1 ?? Colors.yellow.withOpacity(0.1);
  Color get y4 =>
      Theme.of(this).extension<MEmotionalColorThemeEtx>()?.y4 ?? Colors.yellow.withOpacity(0.4);
  Color get o1 =>
      Theme.of(this).extension<MEmotionalColorThemeEtx>()?.o1 ?? Colors.orange.withOpacity(0.1);
  Color get o4 =>
      Theme.of(this).extension<MEmotionalColorThemeEtx>()?.o4 ?? Colors.orange.withOpacity(0.4);
  Color get r1 =>
      Theme.of(this).extension<MEmotionalColorThemeEtx>()?.r1 ?? Colors.red.withOpacity(0.1);
  Color get r4 =>
      Theme.of(this).extension<MEmotionalColorThemeEtx>()?.r4 ?? Colors.red.withOpacity(0.4);
  Color get g1 =>
      Theme.of(this).extension<MEmotionalColorThemeEtx>()?.g1 ?? Colors.green.withOpacity(0.1);
  Color get g4 =>
      Theme.of(this).extension<MEmotionalColorThemeEtx>()?.g4 ?? Colors.green.withOpacity(0.4);
  Color get n1 => Theme.of(this).extension<MTextThemeEtx>()?.n1 ?? Colors.blue.withOpacity(0.04);
  Color get n2 => Theme.of(this).extension<MTextThemeEtx>()?.n2 ?? Colors.blue.withOpacity(0.08);
  Color get n3 => Theme.of(this).extension<MTextThemeEtx>()?.n3 ?? Colors.blue.withOpacity(0.12);
  Color get n4 => Theme.of(this).extension<MTextThemeEtx>()?.n4 ?? Colors.blue.withOpacity(0.2);
  Color get n5 => Theme.of(this).extension<MTextThemeEtx>()?.n5 ?? Colors.blue.withOpacity(0.32);
  Color get n6 => Theme.of(this).extension<MTextThemeEtx>()?.n6 ?? Colors.blue.withOpacity(0.56);
  Color get n7 => Theme.of(this).extension<MTextThemeEtx>()?.n7 ?? Colors.blue.withOpacity(0.8);
  Color get n8 => Theme.of(this).extension<MTextThemeEtx>()?.n8 ?? Colors.black;
  Color get bgColor =>
      Theme.of(this).extension<MColorThemeEtx>()?.appBackGroundColor ?? Color(0xfff7f7f5);
  Color get cardColor => Theme.of(this).extension<MColorThemeEtx>()?.cardColor ?? Colors.white;
  Color get mainBackgroundButtonColor =>
      Theme.of(this).extension<MButtonThemeEtx>()?.mainBackGroundColor ?? b4;
  Color get mainTextButtonColor =>
      Theme.of(this).extension<MButtonThemeEtx>()?.mainTextColor ?? Colors.white;
  Color get secondaryBackGroundColor =>
      Theme.of(this).extension<MButtonThemeEtx>()?.secondaryBackGroundColor ?? cardColor;
  Color get secondaryTextColor =>
      Theme.of(this).extension<MButtonThemeEtx>()?.secondaryTextColor ?? n8;
}
