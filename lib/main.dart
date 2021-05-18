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
    final List<int> colorCodes = <int>[600, 500, 100, 100];
    final Map<String, String> users = {
      'name': 'rashee',
      'surname': 'muharram',
      'countery': 'yemen',
      'job': 'developer',
    };
    // get key lis and users["key item"],
    List values = users.values.toList();
    List keys = users.keys.toList();
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('${keys[index].toString().toUpperCase()}: ${values[index]}')),
          );
        });
  }
}
