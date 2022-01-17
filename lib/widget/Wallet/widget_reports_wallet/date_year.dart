import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateYear extends StatelessWidget {
  String formattedDate = DateFormat("yyyy").format(DateTime.now());

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
