import 'package:flutter/material.dart';
import 'package:taskBee/widget/custom_appBar.dart';

class ChooseContactTasks extends StatefulWidget {
  const ChooseContactTasks({Key? key}) : super(key: key);

  @override
  _ChooseContactTasksState createState() => _ChooseContactTasksState();
}

class _ChooseContactTasksState extends State<ChooseContactTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image.asset("assets/Tasks/iconTask.png"), 'Select Contact'),
      body: null,
    );
  }
}
