import 'package:flutter/material.dart';

class CustomRaisdButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final Color? color;
  const CustomRaisdButton({
    Key? key,
    this.onPressed,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: color,
          ),
          width: MediaQuery.of(context).size.width / 5,
          height: MediaQuery.of(context).size.height / 20,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text!,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
