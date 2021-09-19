import 'package:flutter/material.dart';

class CustomRaisdButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  const CustomRaisdButton({
    Key? key,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
