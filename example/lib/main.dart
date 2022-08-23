import 'package:example/demos/buttons.dart';
import 'package:example/demos/checkbox.dart';
import 'package:example/demos/containers.dart';
import 'package:example/demos/radio.dart';
import 'package:example/demos/switch.dart';
import 'package:example/demos/textfields.dart';
import 'package:example/demos/texts.dart';
import 'package:example/demos/tips.dart';
import 'package:flutter/material.dart';
import 'package:mie/mie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mie Flutter Demo',
      darkTheme: ThemeData.from(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Color(0xFF2654FF), brightness: Brightness.dark))
          .copyWith(
        extensions: [
          MButtonThemeEtx(
              mainBackGroundColor: Colors.blue,
              mainTextColor: Colors.white,
              secondaryBackGroundColor: Colors.white,
              secondaryTextColor: Colors.blue,
              mainRadius: 0,
              secondaryRadius: 0),
          MTextThemeEtx(textColor: Colors.white),
          MPrimaryColorThemeEtx(color: Color(0xFF2654FF)),
          MEmotionalColorThemeEtx(
            orangeColor: Color(0XFFED640C),
            yellowColor: Color(0XFFFFCA0D),
            redColor: Color(0XFFC93C33),
            greenColor: Color(0X31AF84),
          ),
        ],
      ),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF2654FF),
        ),
      ).copyWith(extensions: [
        MButtonThemeEtx(
            mainBackGroundColor: Colors.blue,
            mainTextColor: Colors.white,
            secondaryBackGroundColor: Colors.white,
            secondaryTextColor: Colors.blue,
            mainRadius: 0,
            secondaryRadius: 0),
        MColorThemeEtx(
          appBackGroundColor: Color(0xFFF5F5F5),
          errorColor: Colors.red,
          cardColor: Colors.white70,
          // textColor: Color(0x29303D),
        ),
        MTextThemeEtx(textColor: Color(0xFF29303D)),
        MPrimaryColorThemeEtx(color: Color(0xFF2654FF)),
        MEmotionalColorThemeEtx(
          orangeColor: Color(0XFFED640C),
          yellowColor: Color(0XFFFFCA0D),
          redColor: Color(0XFFC93C33),
          greenColor: Color(0X31AF84),
        ),
      ]),
      home: MyHomePage(title: 'Mie Demo List Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> data = [
    'Texts',
    'Buttons',
    'TextFields',
    'Containers',
    'Tips',
    'CheckBox',
    'Radio',
    'Switch'
  ];

  void pushPage(String name) {
    switch (name) {
      case 'Texts':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Texts()));
        break;
      case 'Buttons':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Buttons()));
        break;
      case 'TextFields':
        Navigator.push(context, MaterialPageRoute(builder: (context) => TextFields()));
        break;
      case 'Containers':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Containers()));
        break;
      case 'Tips':
        Navigator.push(context, MaterialPageRoute(builder: (context) => TipsDemoPage()));
        break;
      case 'CheckBox':
        Navigator.push(context, MaterialPageRoute(builder: (context) => MChcekBoxDemoPage()));
        break;
      case 'Radio':
        Navigator.push(context, MaterialPageRoute(builder: (context) => MRadioDemoPage()));
        break;
      case 'Switch':
        Navigator.push(context, MaterialPageRoute(builder: (context) => MSwitchDemoPage()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => pushPage(data[index]),
            child: Container(
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(12).copyWith(bottom: 0),
                height: 49,
                child: Center(child: Text(data[index]))),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
