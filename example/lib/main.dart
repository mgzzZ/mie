import 'package:example/demos/buttons.dart';
import 'package:example/demos/checkbox.dart';
import 'package:example/demos/containers.dart';
import 'package:example/demos/radio.dart';
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
    final theme = Theme.of(context);
    return MieWrapWidget(
      theme: MieDefaultTheme(),
      child: MaterialApp(
        title: 'Mie Flutter Demo',
        theme: context.ofMieTheme().copyWithThemeData(theme),
        home: MyHomePage(title: 'Mie Demo List Page'),
      ),
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
  List<String> data = ['Texts', 'Buttons', 'TextFields', 'Containers', 'Tips', 'CheckBox', 'Radio'];

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
