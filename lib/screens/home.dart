import 'package:flutter/material.dart';
import 'package:todo_app/appColor/color_scheme.dart';
import 'package:todo_app/database_helper.dart';
import 'package:todo_app/screens/task.dart';
import 'package:todo_app/widgets/floating_button.dart';
import 'package:todo_app/widgets/task_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          color: bgcolor,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/todo.png',
                          height: 60,
                          width: 60,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          "TODO App",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: FutureBuilder(
                    initialData: [],
                    future: _dbHelper.getTask(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      print(snapshot.data);
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return TaskCard(
                            title: '',
                            desc: '',
                          );
                        },
                      );
                    },
                  )),
                ],
              ),
              Positioned(
                bottom: 24,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Task()),
                    ).then((value) {
                      setState(() {});
                    });
                  },
                  child: Floatingbutton(
                    color: purple,
                    ico: Icons.add,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
