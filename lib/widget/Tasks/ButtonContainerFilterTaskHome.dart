import 'package:flutter/material.dart';

class ButtonContainerFilterTaskHome extends StatelessWidget {
  final String title;
  final Widget icon;
  final Function() ontap;
  const ButtonContainerFilterTaskHome({
    Key? key,
    required this.title,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
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
              alignment: Alignment.center,
              width: 30,
              height: 30,
              child: Padding(padding: const EdgeInsets.all(5.0), child: icon)),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 11),
        )
      ],
    );
  }
}
