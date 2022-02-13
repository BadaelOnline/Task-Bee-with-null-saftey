import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SectionTasks extends StatefulWidget {
  const SectionTasks({Key? key}) : super(key: key);

  @override
  _SectionTasksState createState() => _SectionTasksState();
}

class _SectionTasksState extends State<SectionTasks> {
  DateTime dateTime = DateTime.now();
  String formattedDate = DateFormat("MMMM").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      child: Text(dateTime.day.toString()),
                    ),
                    Text(formattedDate)
                  ],
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/HomeTask'),
                  child: Row(
                    children: [
                      Text(
                        '2',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Task',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed('/CategoraysTask'),
                  child: Icon(
                    Icons.add_circle_outline_sharp,
                    size: 35,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
