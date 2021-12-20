import 'package:flutter/material.dart';
import 'package:mie/mie.dart';
import 'package:mie/src/min_map.dart';

class MButton extends TextButton{
  final String text;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? textSize;
  final ButtonStyle? style;
  MButton(this.text,
      {required this.onTap, this.backgroundColor, this.textColor, this.textSize, this.style,this.padding,})
      : super(
            child: Text(text),
            onPressed: onTap,
            style: style ?? TextButton.styleFrom(backgroundColor: backgroundColor,minimumSize: Size(0,0),padding: padding,shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),),),);

  static Widget main(String text, {VoidCallback? onTap}) {
    return Builder(builder: (context) {
      MButtonThemeData theme = context.ofMieTheme().buttonThemeData;
      ButtonStyle style = TextButton.styleFrom(
          backgroundColor: theme.mainBackGroundColor, primary: theme.mainTextColor,padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),minimumSize: Size(0,0),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(theme.mainCor)),),
      );
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
          backgroundColor: theme.secondaryBackGroundColor, primary: theme.secondaryTextColor,padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),minimumSize: Size(0,0),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(theme.secondaryCor)),));
      return MButton(
        text,
        onTap: onTap,
        style: style,
      );
    });
  }
}

class MStateButton extends StatefulWidget {
  const MStateButton(this.text,{Key? key, this.onTap, this.backgroundColor, this.textColor, this.padding, this.textSize, this.style, this.loadingWidget}) : super(key: key);
  final String text;
  final Future Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? textSize;
  final Widget? loadingWidget;
  final ButtonStyle? style;

  @override
  _MStateButtonState createState() => _MStateButtonState();

  static Widget main(String text, {Future Function()? onTap}){
    return Builder(builder: (context){
      MButtonThemeData theme = context.ofMieTheme().buttonThemeData;
      ButtonStyle style = TextButton.styleFrom(
        backgroundColor: theme.mainBackGroundColor, primary: theme.mainTextColor,padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),minimumSize: Size(0,0),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(theme.mainCor)),),
      );
      return MStateButton(text,onTap: onTap,style: style,);
    });
  }

  static Widget secondary(String text, {Future Function()? onTap}){
    return Builder(builder: (context){
      MButtonThemeData theme = context.ofMieTheme().buttonThemeData;
      ButtonStyle style = TextButton.styleFrom(
          backgroundColor: theme.secondaryBackGroundColor, primary: theme.secondaryTextColor,padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),minimumSize: Size(0,0),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(theme.secondaryCor)),));
      return MStateButton(text,onTap: onTap,style: style,);
    });
  }

}

class _MStateButtonState extends State<MStateButton> {

  late bool _loading = false;
  double width = 0;
  double height = 0;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {

    final Widget indicator =widget.loadingWidget ?? CircularProgressIndicator(
      strokeWidth: 3,
      valueColor: AlwaysStoppedAnimation(context.ofMieTheme().colorThemeData.accentColor),
    );
    ButtonStyle _style = widget.style??TextButton.styleFrom(backgroundColor: widget.backgroundColor,minimumSize: Size(0,0),padding: widget.padding,shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0)),),);
    Widget child = _loading? TextButton(onPressed: null, child: Container(width: 16,height: 16,child: indicator),style: _style,): MButton(widget.text, style: _style,textSize: widget.textSize,onTap: widget.onTap != null? ()async{
      if (_loading) return;
      setState(() => _loading = true);
      await widget.onTap!.call().whenComplete(()=> setState(() => _loading = false));

    }:null);

    return AnimatedSwitcher(duration: Duration(milliseconds: 200),child: child,);
  }



}
