import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDayMonthYear extends StatelessWidget {
  String formattedDate = DateFormat("yyyy MMMM dd").format(DateTime.now());

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
