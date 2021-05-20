import 'package:earth_quake_app/screens/city_screen.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedView extends StatefulWidget {
  @override
  _SharedViewState createState() => _SharedViewState();
}

class _SharedViewState extends State<SharedView> {
  String data = "test";
  SharedPreferences _preferences;

  Future<void> _getInstanceSharedView() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setString("key", "Ali");
  }

  @override
  void initState() {
    super.initState();
    _getInstanceSharedView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.android_rounded, size: 55, color: Colors.green),
          Text(this.data),
          FlatButton(
            onPressed: () {
              setState(() {
                data = _preferences.getString("data");
              });
            },
            color: Colors.amber,
            child: Text("Get Shared Prefrences"),
          ),
          FlatButton(
            onPressed: () {
              _preferences.setString("data", "Rasheed");
            },
            color: Colors.green,
            child: Text("Save Shared Prefrences"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => CityScreen(),
                ),
              );
            },
            child: Text("City Page"),
          )
        ],
      ),
    ));
  }
}
