import 'package:flutter/material.dart';

class Title_container extends StatelessWidget {
  const Title_container({Key? key, this.text})
      : super(
          key: key,
        );

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Text('$text',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
              fontSize: 15)),
    );
  }
}
