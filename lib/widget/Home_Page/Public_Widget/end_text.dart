import 'package:flutter/material.dart';

class Slogan extends StatelessWidget {
  const Slogan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.amber[400]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'One of ',
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          Text('Badael Online ',
              style: TextStyle(color: Color(0xff47AFC9), fontSize: 14)),
          Text('projects',
              style: TextStyle(color: Colors.grey[700], fontSize: 14))
        ],
      ),
    );
  }
}
