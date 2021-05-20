import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';

class HiveQuestions extends StatelessWidget {
  // call Hive
  // open box
  Future<void> hiveMe() async {
    await Hive.openBox('testBox');
    Box box = Hive.box('testBox');
    Map questionsList = {
      "how old are you?": ['21', '22', '32', '40'],
    };
    box.put("Questions", questionsList);
    print(box.get("Questions"));
    box.close();
    print("Closed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                hiveMe();
              },
              child: Text(
                "Open",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 32,
                  backgroundColor: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
