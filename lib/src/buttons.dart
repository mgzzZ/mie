



import 'package:flutter/material.dart';

class MButton extends TextButton{
  final String text;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;
  final ButtonStyle? style;
  MButton(this.text,{required this.onTap,this.backgroundColor, this.textColor, this.textSize, this.style}) : super(child:Text(text),onPressed: onTap,style:style ?? TextButton.styleFrom(backgroundColor: backgroundColor));

}