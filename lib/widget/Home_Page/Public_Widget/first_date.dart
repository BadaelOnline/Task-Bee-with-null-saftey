import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirstDate extends StatelessWidget {
  String formattedDate = DateFormat("yyyy MMMM").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Text(
      formattedDate,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
