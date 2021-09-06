import 'package:flutter/material.dart';

class Floatingbutton extends StatelessWidget {
  final Color color;
  final IconData ico;
  Floatingbutton({required this.color, required this.ico});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Icon(
        ico,
        size: 32,
        color: Colors.white,
      ),
    );
  }
}
