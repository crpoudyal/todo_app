import 'package:flutter/material.dart';
import 'package:todo_app/screens/appColor/color_scheme.dart';
import 'package:todo_app/screens/widgets/floating_button.dart';
import 'package:todo_app/screens/widgets/task_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    child: ListView(
                      children: [
                        TaskCard(
                          title: "Get Started",
                          desc:
                              "This is the description of the following tasks so if you have any dout please talk to me ok dont hegitate to talk",
                        ),
                        TaskCard(
                          title: "Do this project",
                          desc:
                              "This is the description of the following tasks so if you have any dout please talk to me ok dont hegitate to talk",
                        ),
                        TaskCard(
                          title: "Now is Now",
                          desc:
                              "This is the description of the following tasks so if you have any dout please talk to me ok dont hegitate to talk",
                        ),
                        TaskCard(
                          title: "Get Started",
                          desc:
                              "This is the description of the following tasks so if you have any dout please talk to me ok dont hegitate to talk",
                        ),
                        TaskCard(
                          title: "Do this project",
                          desc:
                              "This is the description of the following tasks so if you have any dout please talk to me ok dont hegitate to talk",
                        ),
                        TaskCard(
                          title: "Now is Now",
                          desc:
                              "This is the description of the following tasks so if you have any dout please talk to me ok dont hegitate to talk",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(bottom: 24, right: 0, child: Floatingbutton())
            ],
          ),
        ),
      ),
    );
  }
}
