//-------------------------------------imports file -------------------------

import 'package:flutter/material.dart'; //the main include
import 'dart:async'; //timer and other functions for splash screen
import 'dart:ui';
import './loading.dart';
import 'game.dart';

//------------------------------------------------------------------------------//

//-------------- Main Functions -------------------------------------------------//
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

//--------------------------------------------------------------------------------//

//------------Splash Screen Loading time and other Configurations ----------------//

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  //----------Code for Splash Screen Design ------------------------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 59, 112, 1),
      body: Loading(),
    );
  }
}

//------------------HomePage Widget---------------------------------//
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Game(),
    );
  }
}
