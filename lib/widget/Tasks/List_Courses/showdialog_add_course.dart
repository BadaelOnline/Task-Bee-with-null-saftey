import 'package:flutter/material.dart';

import 'list_color.dart';

class ShowDialog_AddCourse extends StatefulWidget {
  Function()? submitMethod;
  Function()? cancelMethod;
  ShowDialog_AddCourse({
    Key? key,
    this.cancelMethod,
    this.submitMethod,
  }) : super(key: key);

  @override
  State<ShowDialog_AddCourse> createState() => _ShowDialog_AddCourseState();
}

class _ShowDialog_AddCourseState extends State<ShowDialog_AddCourse> {
  TextEditingController namecourse = TextEditingController();

  double height = 170.0;

  int itemnumber = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(10),
      child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: height,
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
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: itemnumber,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              ListColor(
                                top: 335.0,
                                course: [
                                  Color(0xffFF2424),
                                  Color(0xff62960E),
                                  Color(0xff03FEC2),
                                  Color(0xff108AA8),
                                  Color(0xff43FF24),
                                  Color(0xff9F24FF),
                                  Color(0xffFF44D6),
                                  Color(0xffFF8D24),
                                  Color(0xffFFDB24),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                  child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Course Name',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                                cursorHeight: 25,
                                controller: namecourse,
                              )),
                              index == 0
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          itemnumber = itemnumber + 1;
                                          height = height + 50;
                                        });
                                      },
                                      child: Icon(
                                        Icons.add,
                                        size: 30,
                                        color: Color(0xff6F6F6F),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          itemnumber = itemnumber - 1;
                                          height = height - 50;
                                        });
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 30,
                                        color: Color(0xff6F6F6F),
                                      ),
                                    )
                            ],
                          ),
                          Container(
                            height: 2,
                            child: Divider(
                              thickness: 1,
                              color: Color(0xffDADADA),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 60,
              ),
              IntrinsicHeight(
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
            ],
          )),
    );
  }
}
