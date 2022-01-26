import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskBee/widget/Tasks/ButtonContainerFilterTaskHome.dart';
import 'package:taskBee/widget/Tasks/ButtonDate.dart';
import 'package:taskBee/widget/Tasks/CardTask.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_floating_action_button.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({Key? key}) : super(key: key);

  @override
  _TasksHomeState createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  String month = DateFormat("yyyy MMMM DD EEEE").format(DateTime.now());
  String year = DateFormat("yyyy").format(DateTime.now());
  int? x;

  String yearr = DateFormat("yyyy").format(DateTime.now().add(Duration(
    days: -365,
  )));
  String nextyear = DateFormat("yyyy").format(DateTime.now().add(Duration(
    days: 365,
  )));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            Image.asset("assets/Tasks/iconTask.png"), 'Appointments and tasks'),
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.01,
              child: Column(
                children: [
                  Container(
                      height: 61,
                      width: MediaQuery.of(context).size.width,
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
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, right: 24, left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ButtonContainerFilterTaskHome(
                                  title: 'Month',
                                  icon: Image.asset(
                                      'assets/Tasks/calendaerYear.png'),
                                  ontap: () {
                                    setState(() {
                                      x = 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                ButtonContainerFilterTaskHome(
                                  title: 'Year',
                                  icon: Image.asset(
                                      'assets/Tasks/calendarMonth.png'),
                                  ontap: () {
                                    setState(() {
                                      x = 2;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                ButtonContainerFilterTaskHome(
                                  title: 'Done',
                                  icon: Image.asset('assets/Tasks/yes.png'),
                                  ontap: () {},
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 2, bottom: 1),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 23,
                                        width: 21,
                                        child: Image.asset(
                                            'assets/Tasks/filter.png'),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'filter',
                                        style: TextStyle(fontSize: 11),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Positioned(
              top: 90,
              left: 59,
              right: 59,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ButtonDate(
                        ontap: () {
                          setState(() {
                            year = yearr.toString();
                          });
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          x == 1
                              ? month
                              : x == 2
                                  ? year
                                  : month,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ButtonDate(
                        ontap: () {
                          setState(() {
                            year = nextyear.toString();
                          });
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: 90,
                right: 24,
                child: Container(
                    height: 25,
                    width: 21,
                    child: Image.asset('assets/Tasks/trash.png'))),
            Padding(
              padding: EdgeInsets.only(top: 140, left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CardTask(
                      image: 'assets/Tasks/shopping.png',
                      type: 'Shopping',
                      title: 'Alreem Center',
                      repate: 'assets/homepage/repeat.png',
                      importance: 'assets/Tasks/A.png',
                      from: '10:00 PM',
                      to: '11:00 PM',
                      allday: '',
                    ),
                    CardTask(
                      image: 'assets/Tasks/doctor.png',
                      type: 'Doctooor',
                      title: 'Wisam kahel',
                      importance: 'assets/Tasks/B.png',
                      repate: '',
                      from: '02:30 PM',
                      to: '02:45 PM',
                      allday: '',
                    ),
                    CardTask(
                      image: 'assets/Tasks/travile.png',
                      type: 'Travilling',
                      title: 'Syrian',
                      importance: 'assets/Tasks/A.png',
                      repate: '',
                      from: '',
                      to: '',
                      allday: '  All Day   ',
                    ),
                    CardTask(
                      image: 'assets/Tasks/sport.png',
                      type: 'Spoooort',
                      title: 'Gyam Master',
                      importance: '',
                      repate: '',
                      from: '05:00 PM',
                      to: '07:00 PM',
                      allday: '',
                    ),
                    CardTask(
                      image: 'assets/Tasks/personal.png',
                      type: 'Presonal',
                      title: 'Birthday Hammam',
                      importance: 'assets/Tasks/D.png',
                      repate: '',
                      from: '',
                      to: '',
                      allday: '  All Day   ',
                    ),
                    CardTask(
                      image: 'assets/Tasks/exam.png',
                      type: 'Exaaaam',
                      title: 'Programming',
                      importance: '',
                      repate: '',
                      from: '11:30 AM',
                      to: '12:45 PM',
                      allday: '',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/CategoraysTask'),
        ));
  }
}
