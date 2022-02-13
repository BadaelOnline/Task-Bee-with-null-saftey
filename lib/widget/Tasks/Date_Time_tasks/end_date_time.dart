import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class EnddateTime extends StatefulWidget {
  const EnddateTime({Key? key}) : super(key: key);

  @override
  _EnddateTimeState createState() => _EnddateTimeState();
}

class _EnddateTimeState extends State<EnddateTime> {
  var secanddate;
  var pickdatetime;

  selctedSecandDateTime(BuildContext context) async {
    pickdatetime = (await showOmniDateTimePicker(
      context: context,
      primaryColor: Colors.cyan,
      backgroundColor: Colors.white,
      calendarTextColor: Colors.black,
      tabTextColor: Colors.white,
      unselectedTabBackgroundColor: Colors.grey[700],
      buttonTextColor: Colors.black,
      timeSpinnerTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
      timeSpinnerHighlightedTextStyle:
          const TextStyle(color: Colors.black, fontSize: 24),
      is24HourMode: false,
      isShowSeconds: false,
      startInitialDate: DateTime.now(),
      startFirstDate: secanddate,
      borderRadius: const Radius.circular(10),
    ));
    if (pickdatetime != null) {
      setState(() {
        secanddate = pickdatetime;
        secanddate =
            DateFormat('EEEE dd/MM/yyyy - hh:mm a').format(pickdatetime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(' End '),
        SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            setState(() {
              secanddate = null;
              selctedSecandDateTime(context);
            });
          },
          child: Text(
            secanddate != null
                ? secanddate
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
