import 'package:flutter/material.dart';

import 'end_date_time.dart';
import 'start_date_time.dart';

class SectionDateTime extends StatefulWidget {
  const SectionDateTime({Key? key}) : super(key: key);

  @override
  _SectionDateTimeState createState() => _SectionDateTimeState();
}

class _SectionDateTimeState extends State<SectionDateTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
        bottom: 25,
        left: 25,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 30,
                  height: 30,
                  child: Image.asset('assets/Tasks/clock.png'))
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StartDateTime(),
              SizedBox(
                height: 25,
              ),
              EnddateTime()
            ],
          )
        ],
      ),
    );
  }
}
