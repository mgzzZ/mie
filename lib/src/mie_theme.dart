import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MieWrapWidget extends InheritedWidget {
  final Widget child;
  final MieTheme theme;
  MieWrapWidget({required this.child, required this.theme}) : super(child: child);

  static MieTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MieWrapWidget>()?.theme ?? MieDefaultTheme();
  }

  @override
  bool updateShouldNotify(MieWrapWidget oldWidget) {
    return oldWidget.theme != this.theme;
  }
}

extension MieWrapWidgetExt on BuildContext {
  MieTheme ofMieTheme() {
    return MieWrapWidget.of(this);
  }
}

class MieTheme {
  MTextThemeData textThemeData;
  MButtonThemeData buttonThemeData;
  MIconThemeData iconThemeData;
  MCardThemeData cardThemeData;
  MColorThemeData colorThemeData;

  MieTheme({
    required this.textThemeData,
    required this.buttonThemeData,
    required this.iconThemeData,
    required this.cardThemeData,
    required this.colorThemeData,
  });

  ThemeData copyWithThemeData(ThemeData theme) {
    return theme.copyWith(
      colorScheme: ColorScheme.fromSwatch(
        accentColor: colorThemeData.accentColor,
        backgroundColor: colorThemeData.appBackGroundColor,
        errorColor: colorThemeData.errorColor,
        cardColor: colorThemeData.cardColor,
      ),
      canvasColor: Colors.transparent,
      accentColor: colorThemeData.accentColor,
      primaryColor: colorThemeData.accentColor,
      //待更换
      buttonColor: buttonThemeData.mainBackGroundColor,
      textSelectionTheme: theme.textSelectionTheme.copyWith(
        cursorColor: colorThemeData.accentColor,
        selectionColor: colorThemeData.accentColor,
      ),
      scaffoldBackgroundColor: colorThemeData.appBackGroundColor,
    );
  }

  MieTheme copyWith({
    MTextThemeData? textThemeData,
    MButtonThemeData? buttonThemeData,
    MIconThemeData? iconThemeData,
    MCardThemeData? cardThemeData,
    MColorThemeData? colorThemeData,
  }) {
    return MieTheme(
        textThemeData: textThemeData ?? this.textThemeData,
        buttonThemeData: buttonThemeData ?? this.buttonThemeData,
        iconThemeData: iconThemeData ?? this.iconThemeData,
        cardThemeData: cardThemeData ?? this.cardThemeData,
        colorThemeData: colorThemeData ?? this.colorThemeData);
  }
}

class MieDefaultTheme extends MieTheme {
  MieDefaultTheme()
      : super(
          textThemeData: MTextThemeData(),
          buttonThemeData: MButtonThemeData(
              mainBackGroundColor: Colors.green,
              mainTextColor: Colors.black,
              secondaryBackGroundColor: Colors.red,
              secondaryTextColor: Colors.white,
              mainCor: 0,
              secondaryCor: 4),
          cardThemeData: MCardThemeData(),
          colorThemeData: MColorThemeData(
            appBackGroundColor: Color(0xfff5f5f5),
            accentColor: Colors.yellow,
            cardColor: Color(0xfff5f5f5),
            errorColor: Colors.red,
          ),
          iconThemeData: MIconThemeData(),
        );
}

class MTextThemeData {}

class MButtonThemeData {
  Color mainBackGroundColor;
  Color mainTextColor;
  Color secondaryBackGroundColor;
  Color secondaryTextColor;

  /// 圆角
  double mainCor;
  double secondaryCor;

  MButtonThemeData({
    required this.mainBackGroundColor,
    required this.mainTextColor,
    required this.secondaryBackGroundColor,
    required this.secondaryTextColor,
    required this.mainCor,
    required this.secondaryCor,
  });
}

class MIconThemeData {}

class MCardThemeData {}

class MColorThemeData {
  Color appBackGroundColor;
  Color accentColor;
  Color errorColor;
  Color cardColor;

  MColorThemeData({
    required this.appBackGroundColor,
    required this.accentColor,
    required this.errorColor,
    required this.cardColor,
  });
}
