import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:profileapp/main.dart';
import 'package:profileapp/screens/widgets/homepage/homepage.dart';
import 'package:profileapp/screens/widgets/searchpage/searchpage.dart';

class MyRootPage extends StatefulWidget {
  final parent;

  const MyRootPage({Key key, this.parent}) : super(key: key);
  @override
  _MyRootPageState createState() => _MyRootPageState();
}

class _MyRootPageState extends State<MyRootPage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int page = 0;

  TabController _controller;

  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    FloatingActionButton fab;
    if (page == 0) {
      fab = FloatingActionButton(child: Icon(OMIcons.add), onPressed: () {});
    } else if (page == 1) {
      fab = FloatingActionButton(
        child: Icon(OMIcons.add),
        onPressed: () {},
      );
    } else if (page == 2) {
      fab = FloatingActionButton(
        child: Icon(OMIcons.add),
        onPressed: () {},
      );
    } else if (page == 3) {
      fab = FloatingActionButton(
        child: Icon(OMIcons.send),
        onPressed: () {},
      );
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            child: Stack(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).accentColor,
                  child: Text(
                    "J",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).accentColor,
                )
              ],
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/profilepic.jpg")),
              accountEmail: Text("@TheRealPykee"),
              accountName: Text("Jacob Pyke"),
            ),
            Positioned(
              bottom: 16,
              left: 8,
              child: FlatButton(
                onPressed: () {
                  widget.parent.setState(() {
                    if (widget.parent.brightness == AppBrightness.light) {
                      widget.parent.brightness = AppBrightness.dark;
                    } else {
                      widget.parent.brightness = AppBrightness.light;
                    }
                  });
                },
                child: Icon(Icons.brightness_2,
                    color: Theme.of(context).accentColor),
              ),
            )
          ],
        )),
        appBar: AppBar(
          title: Text(""),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTapUp: (tap) {
                _scaffoldKey.currentState.openDrawer();
              },
              child: CircleAvatar(
                  backgroundImage: AssetImage("assets/profilepic.jpg")),
            ),
          ),
          actions: <Widget>[
            Container(
              child: FlatButton(
                child: Icon(
                  OMIcons.starBorder,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: <Widget>[
            HomePage(),
            SearchPage(),
            Container(),
            Container(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.blue,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: page,
          onTap: (int) {
            _controller.animateTo(int);
            setState(() {
              page = int;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(OMIcons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
                icon: Icon(OMIcons.search), title: Text("Search")),
            BottomNavigationBarItem(
                icon: Icon(OMIcons.notifications),
                title: Text("Notifications")),
            BottomNavigationBarItem(
                icon: Icon(OMIcons.mail), title: Text("Inbox")),
          ],
        ),
        floatingActionButton: fab,
      ),
    );
  }
}
