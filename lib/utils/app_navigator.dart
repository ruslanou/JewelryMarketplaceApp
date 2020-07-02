import 'package:flutter/material.dart';

class AppNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }
}