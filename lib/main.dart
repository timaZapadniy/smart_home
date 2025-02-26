import 'package:flutter/material.dart';
import 'package:gamepads/gamepads.dart';

void main() {
  runApp(SmartHomeApp());
}

class SmartHomeApp extends StatefulWidget {
  const SmartHomeApp({super.key});

  @override
  _SmartHomeAppState createState() => _SmartHomeAppState();
}

class _SmartHomeAppState extends State<SmartHomeApp> {
  String lastButtonPressed = "";

  @override
  void initState() {
    super.initState();
    Gamepads.events.listen((event) {
      setState(() {
        lastButtonPressed = event.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            """
  +------------------+
  |  SMART HOME UI  |
  +------------------+
  |  Lights: OFF    |
  |  Temp: 22°C     |
  |  Door: Locked   |
  +------------------+

  Last Button Pressed: $lastButtonPressed
  """,
            style: const TextStyle(
                fontFamily: 'Courier', color: Colors.green, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
