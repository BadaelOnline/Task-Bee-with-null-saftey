import 'package:flutter/material.dart';

class CardOfVisibibleAddTask extends StatelessWidget {
  final String title;
  final String image;
  final Function()? ontap;
  const CardOfVisibibleAddTask({
    Key? key,
    required this.title,
    required this.image,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Container(
                height: 30,
                width: 30,
                child: Image.asset(image),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                  color: Color(0xff5A5A5A),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
