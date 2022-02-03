import 'package:flutter/material.dart';
import 'package:taskBee/widget/custom_appBar.dart';

class CategorayTask extends StatefulWidget {
  const CategorayTask({Key? key}) : super(key: key);

  @override
  _CategorayTaskState createState() => _CategorayTaskState();
}

class _CategorayTaskState extends State<CategorayTask> {
  final List image = [
    'assets/Tasks/work.png',
    'assets/Tasks/shopping.png',
    'assets/Tasks/calls.png',
    'assets/Tasks/doctor.png',
    'assets/Tasks/suitable.png',
    'assets/Tasks/travile.png',
    'assets/Tasks/personal.png',
    'assets/Tasks/entertainment.png',
    'assets/Tasks/sport.png',
    'assets/Tasks/exam.png',
    'assets/Tasks/homework.png',
    'assets/Tasks/lectures.png',
    'assets/Tasks/studytimes.png',
    'assets/Tasks/special lesson.png',
    'assets/Tasks/other.png',
  ];
  final List name = [
    'Work',
    'Shopping',
    'Calls',
    'Treatment',
    'Suitable',
    'Travile',
    'Personal',
    'Entertainment',
    'Sport',
    'Exam',
    'Homework',
    'Lectures',
    'Study Times',
    'Special Lesson',
    'Other'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(Image.asset("assets/Tasks/iconTask.png"), 'Tasks Type'),
      body: GridView.builder(
          padding: EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 112,
              childAspectRatio: 3 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: image.length,
          itemBuilder: (BuildContext ctx, index) {
            return InkWell(
              onTap: () => Navigator.of(context).pushNamed('/AddTask',
                  arguments: {
                    'type': name[index].toString(),
                    'image': image[index].toString()
                  }),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      child: Image.asset(image[index].toString()),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        name[index].toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
