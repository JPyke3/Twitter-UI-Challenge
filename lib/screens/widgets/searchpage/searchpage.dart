import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final Widget child;

  SearchPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: Container(
              height: 30,
              color: Color(0x33000000),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextField(
                    decoration: InputDecoration.collapsed(hintText: "Search"),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
