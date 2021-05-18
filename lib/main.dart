import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// TODO: create list;
// TODO: add data form map;
// TODO: add data form json;
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
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });
  }
}
