import 'package:flutter/material.dart';
import 'package:todo_app/appColor/color_scheme.dart';
import 'package:todo_app/database_helper.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/floating_button.dart';
import 'package:todo_app/widgets/task_checkbox.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 6),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              print("The Title is :$value");

                              if (value != "") {
                                DatabaseHelper _dbHelper = DatabaseHelper();

                                TaskModel _newTask = TaskModel(
                                    id: 1, title: value, description: "desc");

                                await _dbHelper.insertTask(_newTask);
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "Enter Task Title...",
                                border: InputBorder.none),
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: purple),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter description for task...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24),
                      ),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: lightDark),
                    ),
                  ),
                  TaskCheckBox(
                    text: "Design Page 1",
                    isDone: true,
                  ),
                  TaskCheckBox(
                    text: "Design Page 1",
                    isDone: false,
                  ),
                  TaskCheckBox(
                    text: "Design Page 1",
                    isDone: true,
                  ),
                ],
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: () {},
                  child: Floatingbutton(
                      color: Colors.redAccent, ico: Icons.delete_forever),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
