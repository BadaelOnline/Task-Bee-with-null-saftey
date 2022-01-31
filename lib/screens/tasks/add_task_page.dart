// ignore_for_file: unused_local_variable
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:taskBee/widget/Tasks/List_Courses/list_courses.dart';
import 'package:taskBee/widget/Tasks/MoreOpstions/chekbox_addaleart.dart';
import 'package:taskBee/widget/Tasks/card_of_visible_add_task.dart';
import 'package:taskBee/widget/Tasks/custom_appbar_add_task.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final controller = ValueNotifier<bool>(false);
  TextEditingController title = TextEditingController();
  String? type;
  String? image;
  bool isSwitched = false;
  bool visibile = false;
  bool visibile1 = false;
  double h = 15.0;
  var startdate;
  var secanddate;
  var pickdatetime;
  final DateFormat workerHistoryDateTimeFormat =
      DateFormat('dd MMMM yyyy - h:mm a');

  void addImportant() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              height: 335,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      checkbox_Aleart(
                        title: 'At the same time',
                      ),
                      checkbox_Aleart(
                        title: 'Before 15 minutes',
                      ),
                      checkbox_Aleart(
                        title: 'Before 30 minutes',
                      ),
                      checkbox_Aleart(
                        title: 'Before one hour',
                      ),
                      checkbox_Aleart(
                        title: 'A day ago',
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Add',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff494949)),
                          ),
                          Container(
                            height: 30,
                            child: VerticalDivider(
                              color: Color(0xff949494),
                              thickness: 1,
                            ),
                          ),
                          Text('Cancel',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff494949))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void addAleart() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              height: 335,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      checkbox_Aleart(
                        title: 'At the same time',
                      ),
                      checkbox_Aleart(
                        title: 'Before 15 minutes',
                      ),
                      checkbox_Aleart(
                        title: 'Before 30 minutes',
                      ),
                      checkbox_Aleart(
                        title: 'Before one hour',
                      ),
                      checkbox_Aleart(
                        title: 'A day ago',
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Add',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff494949)),
                          ),
                          Container(
                            height: 30,
                            child: VerticalDivider(
                              color: Color(0xff949494),
                              thickness: 1,
                            ),
                          ),
                          Text('Cancel',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff494949))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  selctedFirstDateTime(BuildContext context) async {
    pickdatetime = (await showOmniDateTimePicker(
        context: context,
        primaryColor: Colors.cyan,
        backgroundColor: Colors.white,
        calendarTextColor: Colors.black,
        tabTextColor: Colors.white,
        unselectedTabBackgroundColor: Colors.grey[700],
        buttonTextColor: Colors.black,
        timeSpinnerTextStyle:
            const TextStyle(color: Colors.black, fontSize: 15),
        timeSpinnerHighlightedTextStyle:
            const TextStyle(color: Colors.black, fontSize: 24),
        is24HourMode: false,
        isShowSeconds: false,
        startInitialDate: DateTime.now(),
        startFirstDate: startdate,
        borderRadius: const Radius.circular(10)));
    if (pickdatetime != null) {
      setState(() {
        startdate = pickdatetime;
        startdate =
            DateFormat('EEEE dd/MM/yyyy - hh:mm a').format(pickdatetime);
      });
    }
  }

  selctedSecandDateTime(BuildContext context) async {
    pickdatetime = (await showOmniDateTimePicker(
      context: context,
      primaryColor: Colors.cyan,
      backgroundColor: Colors.white,
      calendarTextColor: Colors.black,
      tabTextColor: Colors.white,
      unselectedTabBackgroundColor: Colors.grey[700],
      buttonTextColor: Colors.black,
      timeSpinnerTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
      timeSpinnerHighlightedTextStyle:
          const TextStyle(color: Colors.black, fontSize: 24),
      is24HourMode: false,
      isShowSeconds: false,
      startInitialDate: DateTime.now(),
      startFirstDate: secanddate,
      borderRadius: const Radius.circular(10),
    ));
    if (pickdatetime != null) {
      setState(() {
        secanddate = pickdatetime;
        secanddate =
            DateFormat('EEEE dd/MM/yyyy - hh:mm a').format(pickdatetime);
      });
    }
  }

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
                  ),
                  type == 'Lectures'
                      ? SimpleAccountMenu(
                          course: ['Programming', 'Mathmatical', 'Analaysies'],
                          onChange: (index) {
                            print(index);
                          },
                        )
                      : SizedBox(
                          width: 1,
                        )
                ]),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    bottom: 25,
                    left: 25,
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              child: Image.asset('assets/Tasks/clock.png'))
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Start'),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    startdate = null;
                                    selctedFirstDateTime(context);
                                  });
                                },
                                child: Text(
                                  startdate != null
                                      ? startdate
                                      : DateFormat('EEEE dd/MM/yyyy - hh:mm a')
                                          .format(DateTime.now())
                                          .toString(),
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Text(' End '),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    secanddate = null;
                                    selctedSecandDateTime(context);
                                  });
                                },
                                child: Text(
                                  secanddate != null
                                      ? secanddate
                                      : DateFormat('EEEE dd/MM/yyyy - hh:mm a')
                                          .format(DateTime.now())
                                          .toString(),
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                  child: Row(
                    children: [
                      AdvancedSwitch(
                        width: 40,
                        height: 20,
                        controller: controller,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('All Day'),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      visibile = !visibile;
                    });
                  },
                  child: Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          visibile == false ? 'More Options' : 'Less Opstions',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Transform.rotate(
                          angle: visibile == false
                              ? 90 * pi / 180
                              : -90 * pi / 180,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: visibile,
                  child: Column(
                    children: [
                      CardOfVisibibleAddTask(
                          ontap: addAleart,
                          title: 'add alert',
                          image: 'assets/Tasks/bell.png'),
                      SizedBox(
                        height: h,
                      ),
                      CardOfVisibibleAddTask(
                          title: 'repetition',
                          image: 'assets/Tasks/repeat.png'),
                      SizedBox(
                        height: h,
                      ),
                      CardOfVisibibleAddTask(
                          title: 'importance',
                          image: 'assets/Tasks/danger.png'),
                      SizedBox(
                        height: h,
                      ),
                      CardOfVisibibleAddTask(
                          title: 'notes - sub items',
                          image: 'assets/Tasks/details.png'),
                      SizedBox(
                        height: h,
                      ),
                      CardOfVisibibleAddTask(
                          title: 'contact',
                          image: 'assets/homepage/person.png'),
                      SizedBox(
                        height: h,
                      ),
                      CardOfVisibibleAddTask(
                          title: 'place', image: 'assets/Tasks/gbs.png'),
                      SizedBox(
                        height: h,
                      ),
                      CardOfVisibibleAddTask(
                          title: 'attachments',
                          image: 'assets/Tasks/attachment.png'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
    ;
  }
}
