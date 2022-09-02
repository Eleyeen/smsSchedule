import 'package:flutter/material.dart';
import 'package:msgschedule_2/pages/schedule/splash_screen.dart';
import 'package:msgschedule_2/providers/MessageProvider.dart';

import 'pages/schedule/SchedulePage.dart';



void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final String _appName = 'Smooches';
  Widget _home;

  _MyAppState();

  @override
  void initState() {
    super.initState();
    _home = SplashScreen(title: _appName);
  }

  @override
  void dispose() {
    super.dispose();

    _disposeSingletonProviders();
  }

  void _disposeSingletonProviders() {
    MessageProvider.getInstance().dispose();
  }

  @override
  didPopRoute() async {
    debugPrint('back button pressed.');
    return true;
  }

  

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      title: _appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.orange,
      ),
      home: _home,
    );
   }
}

