import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(1, 0),
      padding: EdgeInsets.only(top: 15, left: 20),
      child: InkWell(
        child: Text(
          'Forgot Password?',
          style: TextStyle(
              color: Colors.pink,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
