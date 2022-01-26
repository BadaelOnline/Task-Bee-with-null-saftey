import 'package:flutter/material.dart';
import 'package:taskBee/widget/Tasks/custom_appbar_add_task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController title = TextEditingController();
  String? type;
  String? image;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    type = arguments['type'];
    image = arguments['image'];
    return Scaffold(
        appBar: CustomAppBarTask(
            Image.asset("assets/Tasks/iconTask.png"), 'Add Task'),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  Container(
                      width: 80,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(image.toString()),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              type.toString(),
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        decoration: new InputDecoration(hintText: 'Title'),
                        controller: title,
                      ),
                    ),
                  )
                ]),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 25,
                            height: 25,
                            child: Image.asset('assets/Tasks/clock.png'))
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [Text('From:')],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [Text('To:')],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
