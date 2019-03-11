import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class Tweets {
  final String name;
  final String username;
  final String time;
  final String body;
  final AssetImage profilePicutre;

  Tweets(this.name, this.username, this.time, this.body, this.profilePicutre);
}

class _HomePageState extends State<HomePage> {
  Future<List<Tweets>> tweetData() async {
    List<Tweets> data = [];
    data = [
      Tweets(
          "Jacob Pyke",
          "@TheRealPykee",
          "4m",
          "This is my first tweet! It is really long and i really like faking this twitter app to see if i can do it",
          AssetImage("assets/profilepic.jpg")),
      Tweets("Jacob Pyke", "@TheRealPykee", "4m", "This is my first tweet!",
          AssetImage("assets/profilepic.jpg")),
      Tweets("Jacob Pyke", "@TheRealPykee", "4m", "This is my first tweet!",
          AssetImage("assets/profilepic.jpg")),
      Tweets("Jacob Pyke", "@TheRealPykee", "4m", "This is my first tweet!",
          AssetImage("assets/profilepic.jpg")),
      Tweets("Jacob Pyke", "@TheRealPykee", "4m", "This is my first tweet!",
          AssetImage("assets/profilepic.jpg")),
      Tweets("Jacob Pyke", "@TheRealPykee", "4m", "This is my first tweet!",
          AssetImage("assets/profilepic.jpg")),
    ];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Container(
        child: FutureBuilder<List<Tweets>>(
          future: tweetData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Tweets>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            minRadius: 30,
                            backgroundImage: snapshot.data[i].profilePicutre,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    snapshot.data[i].name,
                                    style: Theme.of(context).textTheme.body2,
                                  ),
                                ),
                                Text(snapshot.data[i].username),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("|"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(snapshot.data[i].time),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                              child: Container(
                                
                                width: width - 110,
                                child: Text(snapshot.data[i].body),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
