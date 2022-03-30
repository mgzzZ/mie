import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    Color a = Color.alphaBlend(Color(0xFF010000).withOpacity(0.75), Color(0xFFF44336));
    Color b = Color(0xFFB71C1C);
    print('--1-${a.value}');
    print('--2-${b.value}');
    print('a--red${a.red}--green${a.green}--blue${a.blue}--alpha${a.alpha}');
    print('b--red${b.red}--green${b.green}--blue${b.blue}--alpha${b.alpha}');
  });
}
