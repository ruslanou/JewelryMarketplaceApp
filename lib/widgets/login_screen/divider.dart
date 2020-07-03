import 'package:flutter/material.dart';

class Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        "-OR-",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
