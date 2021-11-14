import 'package:flutter/material.dart';

// ignore: camel_case_types
class Widget_container extends StatelessWidget {
  final Widget image;
  const Widget_container({Key? key, this.text, required this.image})
      : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 13.7;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        alignment: Alignment.center,
        height: height,
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
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            SizedBox(
              width: 10,
            ),
            Text('$text'),
          ],
        ),
      ),
    );
  }
}
