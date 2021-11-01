import 'package:financial/common/database/database.dart';
import 'package:financial/models/bmi.dart';
import 'package:financial/services/bloc/bmi/states.dart';
import 'package:financial/services/dao/dao_bmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class BmiCubit extends Cubit<BmiStates> {
  BmiCubit() : super(BmiIntialState());

  static BmiCubit get(context) => BlocProvider.of(context);

  AppDatabase? database;
  BmiDao? dao;
  List<Bmi>? bmis = [];
  int? lastId;
  double? getBmi;
  double? getWeight;
  double? getLength;
  double? maxweight;
  double? bmi;

  void createDataabase() {
    $FloorAppDatabase
        .databaseBuilder('database_wallet.db')
        .build()
        .then((value) {
      database = value;
      dao = database!.bmiDao;
      emit(BmiCreateDatabaseState());
    });
  }

  void getBmiFromDateBase() {
    this.dao!.findAllBmi().then((value) {
      bmis = value;

      if (value!.length > 0) {
        lastId = value[value.length - 1].id;
      } else {
        lastId = 0;
      }

      emit(GetBmiFromDatabaseState());
    });
  }

  Future<void> insertToDateBase({
    @required double? length,
    @required double? weight,
    DateTime? date,
  }) async {
    int id = 0;

    if (bmis!.length == 0) {
      id = 1;
    } else {
      id = bmis![bmis!.length - 1].id + 1;
    }

    if (id > 0) {
      dao!.insertBmi(Bmi(id, length!, weight!, date.toString())).then((value) {
        emit(InsertBmiToDatabaseState());
        getBmiFromDateBase();
      });
    }
  }

  void deleteBmiFromDataBase({
    @required int? id,
  }) {
    dao!.deleteBmi(id!).then((value) {
      emit(DeleteBmiFromDatabaseState());
      getBmiFromDateBase();
    });
  }

  double calculatBmi({
    @required double? weight,
    @required double? length,
  }) {
    double bmi = weight! / (length! * length / 10000);
    print(bmi);
    return bmi;
  }

  void getBmiArguments({
    @required double? bmi,
    @required double? weight,
    @required double? length,
  }) {
    print(
      'ooooooooooooooooooooooooooooooooo $bmi,$weight,$length',
    );
    getBmi = bmi;
    getWeight = weight;
    getLength = length;
    emit(GetBmiArguments());
  }

  String displayBMIText() {
    return (getBmi! < 18.9)
        ? "slim "
        : (getBmi! == 18.5 || getBmi! < 24.9)
            ? "health"
            : (getBmi! == 25 || getBmi! < 30)
                ? 'overWeight'
                : 'execssiveWeight';
  }

  Color colorBMIText() {
    return (getBmi! < 18.9)
        ? Colors.blue
        : (getBmi! == 18.5 || getBmi! < 24.9)
            ? Colors.green
            : (getBmi! == 25 || getBmi! < 30)
                ? Colors.orange
                : Colors.red;
  }

  double maxWeight({
    @required double? length,
  }) {
    double max = 24.9 * (length! * length / 10000);
    print(max);
    return max;
  }

  double minWeight({
    // @required double? bmi,
    @required double? length,
  }) {
    double min = 18.5 * (length! * length / 10000);
    print(min);
    return min;
  }
}
