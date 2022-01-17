import 'package:flutter/material.dart';
import 'package:taskBee/services/bloc/datepicker/cubit.dart';
import 'package:taskBee/services/bloc/datepicker/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class DateWidget_Saveplan extends StatefulWidget {
  const DateWidget_Saveplan(
      {Key? key,
      required this.transactionDateController,
      required this.image,
      required this.text})
      : super(key: key);
  final TextEditingController transactionDateController;
  final Widget image;
  final String text;

  @override
  _DateWidget_SaveplanState createState() =>
      _DateWidget_SaveplanState(transactionDateController, image, text);
}

// ignore: camel_case_types
class _DateWidget_SaveplanState extends State<DateWidget_Saveplan> {
  String? date;
  String? time;

  final TextEditingController transactionDateController;
  final Widget image;
  final String text;

  TimeOfDay timeOfDay = TimeOfDay.now();

  _DateWidget_SaveplanState(
      this.transactionDateController, this.image, this.text);

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
    double height = MediaQuery.of(context).size.height / 13.7;
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
          child: Container(
            height: height,
            width: MediaQuery.of(context).size.width / 2.2,
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
                Container(height: 35, width: 35, child: image),
                Center(
                  child: date == null
                      ? Text(
                          text,
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
        );
      },
    );
  }
}
