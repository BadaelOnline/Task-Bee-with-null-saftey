import 'package:flutter/material.dart';

class Search_Widget extends StatefulWidget {
  const Search_Widget({Key? key}) : super(key: key);

  @override
  _Search_WidgetState createState() => _Search_WidgetState();
}

class _Search_WidgetState extends State<Search_Widget> {
  bool open = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: open ? 50 : MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(open ? 32 : 8),
              color: Colors.white,
              boxShadow: kElevationToShadow[1]),
          child: Row(children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 25),
                  child: !open
                      ? TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none),
                        )
                      : null),
            ),
            AnimatedContainer(
              duration: Duration(
                milliseconds: 400,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(open ? 33 : 0),
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(open ? 33 : 0),
                    bottomRight: Radius.circular(32),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(open ? Icons.search : Icons.close)),
                  onTap: () {
                    setState(() {
                      open = !open;
                    });
                  },
                ),
              ),
            )
          ])),
    );
  }
}
