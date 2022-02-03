import 'package:flutter/material.dart';
import 'dart:math';
import 'package:taskBee/widget/Tasks/List_Courses/showdialog_add_course.dart';

class SimpleAccountMenu extends StatefulWidget {
  final List<String> course;
  final ValueChanged<int> onChange;
  const SimpleAccountMenu({
    Key? key,
    required this.course,
    required this.onChange,
  })  : assert(course != null),
        super(key: key);
  @override
  _SimpleAccountMenuState createState() => _SimpleAccountMenuState();
}

class _SimpleAccountMenuState extends State<SimpleAccountMenu>
    with SingleTickerProviderStateMixin {
  bool isMenuOpen = false;

  OverlayEntry? _overlayEntry;

  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void closeMenu() {
    _overlayEntry!.remove();
    _animationController.reverse();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)!.insert(_overlayEntry!);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        });
      },
      child: Container(
        width: 65,
        height: 30,
        child: Row(
          children: [
            Text('course'),
            Transform.rotate(
              angle: isMenuOpen == false ? 90 * pi / 180 : -90 * pi / 180,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 150,
          right: 15,
          width: 170,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    width: 170,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children:
                                  List.generate(widget.course.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    widget.onChange(index);
                                    closeMenu();
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, left: 8),
                                    child: Container(
                                      width: 150,
                                      height: 35,
                                      child: Row(children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.amber[400],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Image.asset(
                                            'assets/Tasks/book.png',
                                            scale: 10.2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(widget.course[index]),
                                        Spacer(),
                                        Icon(
                                          Icons.close,
                                          size: 15,
                                        )
                                      ]),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    closeMenu();
                                  });

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return ShowDialog_AddCourse();
                                      });
                                },
                                child: Container(
                                    height: 25,
                                    width: 25,
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xff494949),
                                    )),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
