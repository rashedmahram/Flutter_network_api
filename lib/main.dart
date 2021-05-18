import 'package:earth_quake_app/shared_prefrences/shared_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// [TODO: create list; [DONE]]
// [TODO: add data form map; [DONE]
// [TODO: add data form json; [DONE]
// TODO: create data by json;
// TODO: update data by json;
// TODO: search data by json;
// TODO: delete data by json;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netwrok App',
      initialRoute: '/shared',
      routes: {
        '/shared': (context) => SharedView(),
      },
    );
  }
}
