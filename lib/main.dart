import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:profileapp/screens/rootpage.dart';

void main() => runApp(MyApp());

enum AppBrightness { light, dark }

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppBrightness brightness = AppBrightness.light;
  @override
  Widget build(BuildContext context) {
    ThemeData theme;
    if (brightness == AppBrightness.dark) {
      theme = ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF1b2737),
        accentColor: Colors.blue,
        canvasColor: Color(0xFF151e29),
      );
    } else {
      theme = ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFFFFFFFF),
        accentColor: Colors.blue,
      );
    }
    return MaterialApp(
      routes: {
        "/Home": (context) => MyRootPage(),
      },
      theme: theme,
      home: MyRootPage(
        parent: this,
      ),
    );
  }
}
