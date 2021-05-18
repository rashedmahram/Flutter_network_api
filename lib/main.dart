import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// TODO: create list; [DONE]
// TODO: add data form map; [DONE]
// TODO: add data form json; [DONE]
// TODO: create data by json;
// TODO: update data by json;
// TODO: search data by json;
// TODO: delete data by json;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netwrok App',
      home: Scaffold(
        body: SafeArea(
          child: ListViewFromList(),
        ),
      ),
    );
  }
}

class ListViewFromList extends StatelessWidget {
  const ListViewFromList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // what is the FutureBuilder ???
      future: DefaultAssetBundle.of(context).loadString("assets/data.json"),

      builder: (context, snapshot) {
        var showData = json.decode(snapshot.data.toString());
        return ListView.builder(
          itemCount: showData.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(showData[index]["name"]),
              subtitle: Text(showData[index]["city"]),
            );
          },
        );
      },
    );
  }
}
