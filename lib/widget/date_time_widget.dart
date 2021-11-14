import 'package:flutter/material.dart';
import 'package:financial/services/bloc/datepicker/cubit.dart';
import 'package:financial/services/bloc/datepicker/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateTimeWidget extends StatefulWidget {
  const DateTimeWidget({Key? key, required this.transactionDateController})
      : super(key: key);
  final TextEditingController transactionDateController;

  @override
  _DateTimeWidgetState createState() =>
      _DateTimeWidgetState(transactionDateController);
}

class _DateTimeWidgetState extends State<DateTimeWidget> {
  String? date;
  String? time;
  final TextEditingController transactionDateController;

  TimeOfDay timeOfDay = TimeOfDay.now();

  _DateTimeWidgetState(this.transactionDateController);

  selectedTodotime(BuildContext context) async {
    var pickTime = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );
    if (pickTime != null) {
      timeOfDay = pickTime;
      time = TimeOfDay(hour: pickTime.hour, minute: pickTime.minute)
          .format(context);
      DatePickerCubit.get(context).choseDate(date: date, time: time);
    }
  }

  DateTime dateTime = DateTime.now();

  selectedTodoDate(BuildContext context) async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateTime = pickedDate;
      date = DateFormat('yyyy-MM-dd').format(pickedDate);
      DatePickerCubit.get(context).choseDate(date: date, time: time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatePickerCubit, DatePickerStates>(
      listener: (context, state) {
        if (state is ChoseDateState) {
          transactionDateController.text =
              DatePickerCubit.get(context).chosenDate!;
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => selectedTodotime(context),
              child: Container(
                height: MediaQuery.of(context).size.height / 13.7,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        "assets/wallet/clock.png",
                      ),
                      iconSize: 40,
                      onPressed: () => {},
                    ),
                    Center(
                      child: time == null
                          ? Text(
                              TimeOfDay(
                                      minute: timeOfDay.minute,
                                      hour: timeOfDay.hour)
                                  .format(context),
                              style: TextStyle(fontSize: 15),
                            )
                          : Text(
                              '$time',
                              style: TextStyle(fontSize: 15),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => selectedTodoDate(context),
              child: Container(
                height: MediaQuery.of(context).size.height / 13.7,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        "assets/wallet/calendar.png",
                      ),
                      iconSize: 30,
                      onPressed: () {},
                    ),
                    Center(
                      child: date == null
                          ? Text(
                              DateFormat('yyyy-MM-dd').format(dateTime),
                              style: TextStyle(fontSize: 15),
                            )
                          : Text(
                              '$date',
                              style: TextStyle(fontSize: 15),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
