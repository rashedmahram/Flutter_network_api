import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedDataScreen extends StatefulWidget {
  @override
  _SharedDataScreenState createState() => _SharedDataScreenState();
}

class _SharedDataScreenState extends State<SharedDataScreen> {
  final keyController = TextEditingController();
  final valueController = TextEditingController();
  String _myKey = "";
  String _myValue = "";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> saveData(String key, var value) async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.setString(key, value.toString());
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    valueController.dispose();
    keyController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputText(myController: keyController, label: "Key"),
                InputText(myController: valueController, label: "Value"),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        // save data
                        saveData(keyController.text, valueController.text);
                        // clean data from controller
                        setState(() {
                          _myKey = keyController.text;
                          _myValue = valueController.text;
                        });
                      keyController.text = "";
                        valueController.text = "";
                      },
                      child: Icon(Icons.save_rounded),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        
                      },
                      child: Icon(Icons.download_rounded),
                    ),
                  ],
                ),
                Text(_myKey),
                Text(_myValue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  const InputText({
    Key key,
    @required this.myController,
    this.label,
  }) : super(key: key);

  final TextEditingController myController;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      autofocus: false,
      textAlign: TextAlign.center,
      decoration: new InputDecoration(
        labelText: label,
        labelStyle: new TextStyle(color: const Color(0xFF424242)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent.withOpacity(0.5)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
