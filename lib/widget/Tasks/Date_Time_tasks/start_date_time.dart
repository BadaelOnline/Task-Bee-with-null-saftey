import 'package:flutter/material.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart';

class StartDateTime extends StatefulWidget {
  const StartDateTime({Key? key}) : super(key: key);

  @override
  _StartDateTimeState createState() => _StartDateTimeState();
}

class _StartDateTimeState extends State<StartDateTime> {
  var pickdatetime;
  var startdate;

  selctedFirstDateTime(BuildContext context) async {
    pickdatetime = (await showOmniDateTimePicker(
        context: context,
        primaryColor: Colors.cyan,
        backgroundColor: Colors.white,
        calendarTextColor: Colors.black,
        tabTextColor: Colors.white,
        unselectedTabBackgroundColor: Colors.grey[700],
        buttonTextColor: Colors.black,
        timeSpinnerTextStyle:
            const TextStyle(color: Colors.black, fontSize: 15),
        timeSpinnerHighlightedTextStyle:
            const TextStyle(color: Colors.black, fontSize: 24),
        is24HourMode: false,
        isShowSeconds: false,
        startInitialDate: DateTime.now(),
        startFirstDate: startdate,
        borderRadius: const Radius.circular(10)));
    if (pickdatetime != null) {
      setState(() {
        startdate = pickdatetime;
        startdate =
            DateFormat('EEEE dd/MM/yyyy - hh:mm a').format(pickdatetime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Start'),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            setState(() {
              startdate = null;
              selctedFirstDateTime(context);
            });
          },
          child: Text(
            startdate != null
                ? startdate
                : DateFormat('EEEE dd/MM/yyyy - hh:mm a')
                    .format(DateTime.now())
                    .toString(),
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
