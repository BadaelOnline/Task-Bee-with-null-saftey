import 'package:flutter/material.dart';

class multi_icon_text extends StatelessWidget {
  const multi_icon_text({
    Key? key,
    this.onTap,
    required this.icon1,
    required this.icon2,
    this.text1,
    this.text2,
  }) : super(key: key);

  final onTap;
  final Image icon1;
  final Image icon2;
  final String? text1;
  final String? text2;

  final duoble = 14.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon1,
        SizedBox(
          height: 5,
        ),
        Text(
          '$text1',
          style: TextStyle(fontSize: duoble),
        ),
        SizedBox(
          height: 10,
        ),
        icon2,
        SizedBox(
          height: 5,
        ),
        Text(
          '$text2',
          style: TextStyle(fontSize: duoble),
        )
      ],
    );
  }
}
