import 'dart:convert';

import 'package:flutter/material.dart';

class ListViewJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListViewFromList(),
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
