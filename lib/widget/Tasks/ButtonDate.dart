import 'package:flutter/material.dart';

class ButtonDate extends StatelessWidget {
  final Widget icon;
  final Function() ontap;
  const ButtonDate({
    Key? key,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
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
              borderRadius: BorderRadius.circular(2)),
          width: 25,
          height: 25,
          child: icon),
    );
  }
}
