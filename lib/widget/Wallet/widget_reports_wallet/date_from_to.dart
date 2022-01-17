import 'package:flutter/material.dart';
import 'package:taskBee/services/bloc/datepicker/cubit.dart';
import 'package:taskBee/services/bloc/datepicker/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class DateFromTo extends StatefulWidget {
  const DateFromTo(
      {Key? key, required this.transactionDateController, required this.text})
      : super(key: key);
  final TextEditingController transactionDateController;

  final String text;

  @override
  _DateFromToState createState() =>
      _DateFromToState(transactionDateController, text);
}

// ignore: camel_case_types
class _DateFromToState extends State<DateFromTo> {
  String? date;
  String? time;

  final TextEditingController transactionDateController;

  final String text;

  TimeOfDay timeOfDay = TimeOfDay.now();

  _DateFromToState(this.transactionDateController, this.text);

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
        return InkWell(
          onTap: () => selectedTodoDate(context),
          child: Center(
            child: date == null
                ? Text(
                    text,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : Text(
                    '$date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        );
      },
    );
  }
}
