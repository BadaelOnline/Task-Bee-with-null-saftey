import 'package:flutter/material.dart';
import '../../card_of_visible_add_task.dart';

class AddImportant extends StatefulWidget {
  const AddImportant({Key? key}) : super(key: key);

  @override
  _AddImportantState createState() => _AddImportantState();
}

class _AddImportantState extends State<AddImportant> {
  String importantCard = 'Important';
  String importantImage = 'assets/Tasks/danger.png';
  List<String> images = [
    'assets/Tasks/A.png',
    'assets/Tasks/B.png',
    'assets/Tasks/C.png',
    'assets/Tasks/D.png',
    'assets/Tasks/E.png'
  ];
  List<String> important = [
    'very important',
    'important',
    'medium importance',
    'low importance',
    'not important'
  ];

  @override
  Widget build(BuildContext context) {
    return CardOfVisibibleAddTask(
        ontap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  color: Color(0xFF737373),
                  child: Container(
                    height: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      importantCard = important[index];
                                      importantImage = images[index];
                                      Navigator.of(context).pop();
                                    });
                                  },
                                  child: Container(
                                    height: 60,
                                    child: Row(children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          child: Image.asset(images[index]),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        important[index],
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff494949)),
                                      )
                                    ]),
                                  ),
                                );
                              }),
                        )),
                      ],
                    ),
                  ),
                );
              });
        },
        title: importantImage == 'assets/Tasks/danger.png'
            ? Text(importantCard,
                style: TextStyle(
                    color: Color(0xff5A5A5A),
                    fontWeight: FontWeight.bold,
                    fontSize: 15))
            : Text(importantCard,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
        image: importantImage);
  }
}
