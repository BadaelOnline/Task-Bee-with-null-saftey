import 'dart:async';

import 'package:taskBee/common/applocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicator extends StatefulWidget {
  @override
  _PercentIndicatorState createState() => _PercentIndicatorState();
}

class _PercentIndicatorState extends State<PercentIndicator> {
  double percent = 25;

  @override
  void initState() {
    late Timer timer;
    timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        percent = 25;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double readius = MediaQuery.of(context).size.height / 4;
    double readius2 = MediaQuery.of(context).size.height / 60;
    double height = MediaQuery.of(context).size.height / 18;

    return Column(
      children: [
        SizedBox(
          height: height,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${getLang(context, "Project Balance")} :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              ' 1000000      ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              ' S.P',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: CircularPercentIndicator(
              radius: readius,
              lineWidth: readius2,
              animation: true,
              percent: percent / 100,
              center: Text(
                percent.toString() + "%",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              backgroundColor: Colors.amber[400]!,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.green[300],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${getLang(context, "Current Balance")} :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '4500',
              style: TextStyle(
                  color: Colors.green[300], fontWeight: FontWeight.bold),
            ),
            Text(
              'S.P',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${getLang(context, "Remaining Balance")} :",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              ' 750000',
              style: TextStyle(
                  color: Colors.amber[400], fontWeight: FontWeight.bold),
            ),
            Text(
              'S.P',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
