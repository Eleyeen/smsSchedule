import 'dart:async';

import 'package:flutter/material.dart';
import 'package:msgschedule_2/pages/schedule/SchedulePage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;


  _SplashScreenState(){

    new Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SchedulePage(title: "Smooches",)), (route) => false);
      });
    });

    new Timer(
        Duration(milliseconds: 10),(){
      setState(() {
        _isVisible = true; // Now it is showing fade effect and navigating to Login page
      });
    }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        // decoration: new BoxDecoration(
        //   gradient: new LinearGradient(
        //     colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
        //     begin: const FractionalOffset(0, 0),
        //     end: const FractionalOffset(1.0, 0.0),
        //     stops: [0.0, 1.0],
        //     tileMode: TileMode.clamp,
        //   ),
        // ),
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0,
          duration: Duration(milliseconds: 1200),
          child: Image.asset("Assets/splash_screen.jpeg", fit: BoxFit.cover,),
        ),
      ),
    );
  }
}