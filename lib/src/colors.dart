import 'package:flutter/material.dart';

///
/// Created by zgm on 2022/3/8
/// Describe:
///

class MColor {
  static Color add(Color first, Color second) {
    var r1 = first.red;
    var g1 = first.green;
    var b1 = first.blue;
    var a1 = first.opacity;

    var r2 = second.red;
    var g2 = second.green;
    var b2 = second.blue;
    var a2 = second.opacity;

    double a = a1 + a2 - (a1 * a2);

    double r = (r1 * a1 + r2 * a2 - r1 * a1 * a2) / a;
    double g = (g1 * a1 + g2 * a2 - g1 * a1 * a2) / a;
    double b = (b1 * a1 + b2 * a2 - b1 * a1 * a2) / a;

    return Color.fromRGBO(r.toInt(), g.toInt(), b.toInt(), a);
  }
}
