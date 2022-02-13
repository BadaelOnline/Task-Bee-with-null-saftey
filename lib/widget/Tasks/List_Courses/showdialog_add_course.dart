import 'package:flutter/material.dart';

class ShowDialog_AddCourse extends StatefulWidget {
  ShowDialog_AddCourse({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowDialog_AddCourse> createState() => _ShowDialog_AddCourseState();
}

class _ShowDialog_AddCourseState extends State<ShowDialog_AddCourse> {
  List<TextEditingController> namecourse = [
    for (int i = 1; i < 9; i++) TextEditingController()
  ];

  double height = 170.0;
  int itemnumber = 1;
  // bool visibile = false;
  List<Color> color = [
    Color(0xffFF2424),
    Color(0xff62960E),
    Color(0xff03FEC2),
    Color(0xff108AA8),
    Color(0xff43FF24),
    Color(0xff9F24FF),
    Color(0xffFF44D6),
    Color(0xffFF8D24),
    Color(0xffFFDB24),
  ];
  final List<Color> colors = [
    Color(0xffFF2424),
    Color(0xff62960E),
    Color(0xff03FEC2),
    Color(0xff108AA8),
    Color(0xff43FF24),
    Color(0xff9F24FF),
    Color(0xffFF44D6),
    Color(0xffFF8D24),
    Color(0xffFFDB24),
  ];
  List<bool> visibile = [];
  @override
  void initState() {
    super.initState();
    visibile = List<bool>.filled(10, false);
  }

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
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    print(index);
                                    visibile[index] = !visibile[index];
                                    visibile[index] == true
                                        ? height = height + 50
                                        : height = height - 50;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      color: color[index],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Image.asset(
                                    'assets/Tasks/book.png',
                                    scale: 10,
                                  ),
                                ),
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
                                controller: namecourse[index],
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
                          Visibility(
                            visible: visibile[index],
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 300,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children:
                                        List.generate(colors.length, (indexx) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            color[index] = colors[indexx];
                                            visibile[index] = !visibile[index];
                                            height = height - 50;
                                          });
                                        },
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 4.0, left: 4.0),
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: colors[indexx],
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  15))),
                                                ),
                                              ),
                                            ]),
                                      );
                                    }),
                                  ),
                                )
                              ],
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
