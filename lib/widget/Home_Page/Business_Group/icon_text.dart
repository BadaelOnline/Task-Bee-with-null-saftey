import 'package:flutter/material.dart';

class icon_text extends StatelessWidget {
  const icon_text({
    Key? key,
    required this.icon,
    this.text,
  }) : super(key: key);

  final Image icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        SizedBox(
          height: 5,
        ),
        Text('$text')
      ],
    );
  }
}
