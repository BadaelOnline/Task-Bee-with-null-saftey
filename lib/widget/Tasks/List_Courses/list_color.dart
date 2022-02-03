import 'package:flutter/material.dart';

class ListColor extends StatefulWidget {
  final List<Color> course;
  final double? top;

  ListColor({Key? key, required this.course, required this.top})
      : assert(course != null),
        super(key: key);
  @override
  _ListColorState createState() => _ListColorState();
}

class _ListColorState extends State<ListColor>
    with SingleTickerProviderStateMixin {
  Color? color;
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
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: color == null ? Colors.amber[400] : color,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Image.asset(
          'assets/Tasks/book.png',
          scale: 10,
        ),
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: widget.top,
          left: 25,
          width: 320,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 320,
                    height: 40,
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: List.generate(widget.course.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                color = widget.course[index];
                              });
                              closeMenu();
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: widget.course[index],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                  ),
                                ]),
                          );
                        }),
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
