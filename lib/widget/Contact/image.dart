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
        Image.asset(
          'assets/image/user.png',
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}
