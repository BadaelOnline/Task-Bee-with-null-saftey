import 'package:flutter/material.dart';

class RaisedButtonWallets extends StatelessWidget {
  final Function()? onPressed;
  final String? text;

  const RaisedButtonWallets({
    Key? key,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.amber[400],
          ),
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 18,
          child: TextButton(
            onPressed: onPressed,
            child: Text(
              text!,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
