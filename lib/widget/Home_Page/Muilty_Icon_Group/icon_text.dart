import 'package:flutter/material.dart';

class Icon_Text extends StatelessWidget {
  const Icon_Text({
    Key? key,
    this.onTap,
    required this.icon,
    this.text,
  });

  final onTap;
  final Image icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(onTap: onTap, child: icon),
        Text(
          '$text',
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
