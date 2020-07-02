import 'package:flutter/material.dart';
import 'package:passion_jewelry/screen/login_screen.dart';
import 'package:passion_jewelry/screen/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  // "home": (BuildContext context) => 
  "/login": (BuildContext context) => LoginScreen()
};
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.pinkAccent
      ),
      home: SplashScreen(),
      routes: routes,

    );
  }
}