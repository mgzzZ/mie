import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

class MButton extends TextButton {
  final String text;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? textSize;
  final ButtonStyle? style;
  MButton(
    this.text, {
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.textSize,
    this.style,
    this.padding,
  }) : super(
          child: Text(text),
          onPressed: onTap,
          style: style ??
              TextButton.styleFrom(
                backgroundColor: backgroundColor,
                minimumSize: Size(64, 1),
                padding: padding,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
              ),
        );

  static Widget main(String text, {VoidCallback? onTap}) {
    return Builder(builder: (context) {
      final buttonThemeEtx = Theme.of(context).extension<MButtonThemeEtx>();
      ButtonStyle style = TextButton.styleFrom(
        backgroundColor: buttonThemeEtx?.mainBackGroundColor,
        primary: buttonThemeEtx?.mainTextColor,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        minimumSize: Size(64, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(buttonThemeEtx?.mainRadius ?? 0)),
        ),
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
      final buttonThemeEtx = Theme.of(context).extension<MButtonThemeEtx>();
      ButtonStyle style = TextButton.styleFrom(
          backgroundColor: buttonThemeEtx?.secondaryBackGroundColor,
          primary: buttonThemeEtx?.secondaryTextColor,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          minimumSize: Size(64, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(buttonThemeEtx?.secondaryRadius ?? 0)),
          ));
      return MButton(
        text,
        onTap: onTap,
        style: style,
      );
    });
  }
}

class MStateButton extends StatefulWidget {
  const MStateButton(this.text,
      {Key? key,
      this.onTap,
      this.backgroundColor,
      this.textColor,
      this.padding,
      this.textSize,
      this.style,
      this.loadingWidget})
      : super(key: key);
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

  static Widget main(String text, {Future Function()? onTap}) {
    return Builder(builder: (context) {
      final buttonThemeEtx = Theme.of(context).extension<MButtonThemeEtx>();
      ButtonStyle style = TextButton.styleFrom(
        backgroundColor: buttonThemeEtx?.mainBackGroundColor,
        primary: buttonThemeEtx?.mainTextColor,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        minimumSize: Size(64, 1),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(buttonThemeEtx?.mainRadius ?? 0)),
        ),
      );
      return MStateButton(
        text,
        onTap: onTap,
        style: style,
      );
    });
  }

  static Widget secondary(String text, {Future Function()? onTap}) {
    return Builder(builder: (context) {
      final buttonThemeEtx = Theme.of(context).extension<MButtonThemeEtx>();
      ButtonStyle style = TextButton.styleFrom(
          backgroundColor: buttonThemeEtx?.secondaryBackGroundColor,
          primary: buttonThemeEtx?.secondaryTextColor,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          minimumSize: Size(64, 1),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(buttonThemeEtx?.secondaryRadius ?? 0)),
          ));
      return MStateButton(
        text,
        onTap: onTap,
        style: style,
      );
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
    final colorThemeEtx = Theme.of(context).extension<MColorThemeEtx>();

    final Widget indicator = widget.loadingWidget ??
        CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation(colorThemeEtx?.accentColor),
        );
    ButtonStyle _style = widget.style ??
        TextButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          minimumSize: Size(64, 1),
          padding: widget.padding,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
        );
    Widget child = MButton(widget.text,
        style: _style,
        textSize: widget.textSize,
        padding: EdgeInsets.zero,
        onTap: widget.onTap != null
            ? () async {
                if (_loading) return;
                setState(() => _loading = true);
                await widget.onTap!.call().whenComplete(() => setState(() => _loading = false));
              }
            : null);
    var set = Set<MaterialState>();
    set.add(MaterialState.disabled);
    final color = _style.backgroundColor?.resolve(set);
    return Stack(
      children: [
        AnimatedOpacity(
            opacity: _loading ? 0 : 1, duration: Duration(milliseconds: 300), child: child),
        if (_loading) ...[
          Positioned.fill(
              child: Container(
                  color: color,
                  child: Center(child: Container(width: 16, height: 16, child: indicator)))),
        ],
      ],
    );
  }
}
