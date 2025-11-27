import 'package:flutter/material.dart';
import 'ui/screens/temperature_screen.dart';
import 'ui/screens/welcome_screen.dart';
 
class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {

  bool _isWelcomeScreen = true;

  void showHomeScreen() {
    setState(() {
      _isWelcomeScreen = false;
    });
  }

  @override
  Widget build(context) {

    Widget activeScreen = _isWelcomeScreen
        ? WelcomeScreen(onStart: showHomeScreen)
        : TemperatureScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
