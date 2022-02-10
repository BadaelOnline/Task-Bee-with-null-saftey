import 'package:flutter/material.dart';
import '../../card_of_visible_add_task.dart';

// ignore: camel_case_types
class AddContact_Tasks extends StatefulWidget {
  const AddContact_Tasks({Key? key}) : super(key: key);

  @override
  _AddContact_TasksState createState() => _AddContact_TasksState();
}

// ignore: camel_case_types
class _AddContact_TasksState extends State<AddContact_Tasks> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/chooseContactTask'),
      child: CardOfVisibibleAddTask(
          title: Text('contact',
              style: TextStyle(
                  color: Color(0xff5A5A5A),
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          image: 'assets/homepage/person.png'),
    );
  }
}
