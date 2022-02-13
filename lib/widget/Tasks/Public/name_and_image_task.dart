import 'package:flutter/material.dart';

class NameImageTask extends StatefulWidget {
  String type;
  String image;
  NameImageTask({Key? key, required this.image, required this.type})
      : super(key: key);

  @override
  _NameImageTaskState createState() => _NameImageTaskState();
}

class _NameImageTaskState extends State<NameImageTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        height: 60,
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
              width: 30,
              height: 30,
              child: Image.asset(widget.image),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                widget.type,
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ));
  }
}
