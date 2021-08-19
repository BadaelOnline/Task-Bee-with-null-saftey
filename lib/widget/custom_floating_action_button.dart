import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Icon? icon;
  final Function()? onPressed;
  const CustomFloatingActionButton({
    Key? key, this.icon, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.amber[400],
        onPressed: onPressed,
        child: Icon(
          Icons.add,
          color: Colors.blue,
          size: 25,
        ));
  }
}