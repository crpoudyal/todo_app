import 'package:flutter/material.dart';
import 'package:todo_app/appColor/color_scheme.dart';

class TaskCheckBox extends StatelessWidget {
  final String text;
  final bool isDone;
  TaskCheckBox({required this.text, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
                color: isDone ? purple : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: isDone ? null : Border.all(color: purple)),
            child: Icon(
              Icons.check,
              size: 18,
              color: isDone ? Colors.white : Colors.transparent,
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: isDone ? purple : lightDark,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
