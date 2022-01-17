import 'package:taskBee/services/bloc/datepicker/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DatePickerCubit extends Cubit<DatePickerStates> {
  DatePickerCubit() : super(DatePickerInitialState());

  static DatePickerCubit get(context) => BlocProvider.of(context);

  String? chosenDate;

  void createCubit(){
    chosenDate = '${DateFormat('yyyy-MM-dd hh:mm aaa').format(DateTime.now())}';
  }

  void choseDate({
  @required String? date,
    @required String? time
}){
    if(date == null && time == null){
      chosenDate = '${DateTime.now()}';
    }else if(date != null && time==null ){
      chosenDate ='$date ${TimeOfDay.now()}';
    }else if (date == null && time!=null){
      chosenDate = '${DateFormat('yyyy-MM-dd').format(DateTime.now())} $time';
    }else{
      chosenDate = '$date $time';
    }

    emit(ChoseDateState());
  }

}