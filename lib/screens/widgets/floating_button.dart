import 'package:flutter/material.dart';
import 'package:todo_app/screens/appColor/color_scheme.dart';

class Floatingbutton extends StatelessWidget {
  const Floatingbutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration:
          BoxDecoration(color: purple, borderRadius: BorderRadius.circular(20)),
      child: Icon(
        Icons.add,
        size: 32,
        color: Colors.white,
      ),
    );
  }
}
