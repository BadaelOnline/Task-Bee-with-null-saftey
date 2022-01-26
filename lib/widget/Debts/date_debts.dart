import 'package:flutter/material.dart';
import 'package:taskBee/services/bloc/datepicker/cubit.dart';
import 'package:taskBee/services/bloc/datepicker/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class DateWidget_Debts extends StatefulWidget {
  const DateWidget_Debts({Key? key, required this.transactionDateController})
      : super(key: key);
  final TextEditingController transactionDateController;

  @override
  _DateWidget_DebtsState createState() =>
      _DateWidget_DebtsState(transactionDateController);
}

// ignore: camel_case_types
class _DateWidget_DebtsState extends State<DateWidget_Debts> {
  String? date;
  String? time;
  final TextEditingController transactionDateController;

  TimeOfDay timeOfDay = TimeOfDay.now();

  _DateWidget_DebtsState(this.transactionDateController);

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
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(
                //   icon: Image.asset(
                //     "assets/wallet/calendar.png",
                //   ),
                //   iconSize: 30,
                //   onPressed: () {},
                // ),
                Center(
                  child: date == null
                      ? Text(
                          'Choose Date',
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
