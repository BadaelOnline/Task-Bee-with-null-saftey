import 'package:flutter/material.dart';

class Name_Wallet extends StatelessWidget {
  final String? name;
  const Name_Wallet({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$name',
      style: TextStyle(
          color: Colors.grey[500], fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}
