import 'dart:async';

import 'package:app/home_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  splash createState() => splash();
}

class splash extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Center(
            child: Text(
              "YOLO",
              style: TextStyle(
                  fontSize: 60, color: Colors.red, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}
