import 'package:financial/common/database/database.dart';
import 'package:financial/models/bmi.dart';
import 'package:financial/services/bloc/bmi/states.dart';
import 'package:financial/services/dao/dao_bmi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiStates> {
  BmiCubit() : super(BmiIntialState());

  static BmiCubit get(context) => BlocProvider.of(context);

  AppDatabase? database;
  BmiDao? dao;
  List<Bmi>? bmis = [];
  int? lastId;

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
  }) async {
    int id = 0;
    if (bmis!.length == 0) {
      id = 1;
    } else {
      id = bmis![bmis!.length - 1].id + 1;
    }
    if (id > 0) {
      dao!.insertBmi(Bmi(id, length!, weight!, '')).then((value) {
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
}
