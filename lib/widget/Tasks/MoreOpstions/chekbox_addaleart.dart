import 'package:flutter/material.dart';

class checkbox_Aleart extends StatefulWidget {
  final String title;
  const checkbox_Aleart({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _checkbox_AleartState createState() => _checkbox_AleartState();
}

class _checkbox_AleartState extends State<checkbox_Aleart> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(widget.title),
      value: value,
      tristate: value,
      onChanged: (val) {
        setState(() {
          value = !value;
        });
      },
      checkColor: Colors.amber,
      activeColor: Colors.grey[300],
    );
  }
}
