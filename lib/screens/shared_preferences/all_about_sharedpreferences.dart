import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shared(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Shared extends StatefulWidget {
  const Shared({
    Key key,
  }) : super(key: key);

  @override
  _SharedState createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  SharedPreferences prefs;
  // save data
  String shKey = "name";
  String shValue = "Rasheed";

  getSharedFiles() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    getSharedFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
// installed Shared_Preferences DONE

// Fixit: Save Data
      child: TextButton(
        onPressed: () {
          setState(() {
            prefs.setString("$shKey", "$shValue");
            var p = prefs.getString("$shKey") ?? "null";
            print(p);
            prefs.remove("$shKey");
            p = prefs.getString("$shKey") ?? "removed";
            print(p);
          });
        },
        child: Text("Save"),
      ),
    );
  }
}
