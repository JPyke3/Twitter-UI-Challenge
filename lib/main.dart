import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:profileapp/widgets/homepage.dart';

void main() => runApp(MyApp());

enum AppBrightness { light, dark }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF1b2737),
        accentColor: Colors.blue,
        canvasColor: Color(0xFF151e29),
      ),
      home: MyRootPage(),
    );
  }
}

class MyRootPage extends StatefulWidget {
  @override
  _MyRootPageState createState() => _MyRootPageState();
}

class _MyRootPageState extends State<MyRootPage> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (page == 0) {
      child = HomePage();
    } else if (page == 1) {
      child = Text("Hello $page");
    } else if (page == 2) {
      child = Text("Hello $page");
    } else if (page == 3) {
      child = Text("Hello $page");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundImage: AssetImage("assets/profilepic.jpg")),
        ),
        actions: <Widget>[
          Container(
            child: FlatButton(
              child: Icon(Icons.star),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Container(child: child),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: page,
        onTap: (int) {
          setState(() {
            page = int;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.getIconData("home-outline")),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.getIconData("search")), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.getIconData("bell-outline")), title: Text("Notifications")),
          BottomNavigationBarItem(icon: Icon(Ionicons.getIconData("email-outline")), title: Text("Inbox")),
        ],
      ),
    );
  }
}
