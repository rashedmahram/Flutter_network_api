import 'package:earth_quake_app/shared_prefrences/shared_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String data = "";
  Future<String> sharedData;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    sharedData = SharedPreferences.getInstance().then((value) => value.getString("data"));
    print("object");
    print(sharedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.emoji_flags,
              size: 90,
              color: Colors.red[800],
            ),
            Text("Istanbul\n"),
            Text("$data"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SharedView(),
                  ),
                );
              },
              child: Text("Home"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  data = sharedData.toString();
                });
              },
              child: Text("Load data"),
            ),
            
          ],
        ),
      ),
    );
  }
}
