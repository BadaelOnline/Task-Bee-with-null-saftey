import 'package:flutter/material.dart';

class image extends StatelessWidget {
  const image({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon(
        //   Icons.person_add,
        //   size: 50,
        //   color: Colors.grey[500],
        // )
        Image.asset(
          'assets/contact/contact.png',
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}
