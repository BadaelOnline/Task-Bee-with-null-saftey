import 'package:financial/common/database/database.dart';
import 'package:financial/models/exchange_category.dart';
import 'package:financial/services/bloc/exchang_category/states.dart';
import 'package:financial/services/dao/dao_exchange_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeCubit extends Cubit<ExchangeStates> {
  ExchangeCubit() : super(ExchangeIntialState());

  static ExchangeCubit get(context) => BlocProvider.of(context);

  AppDatabase? database;
  ExchangeCategoryDao? dao;
  List<ExchangeCategory>? exchanges = [];
  String? chosenImage = '';

  void createDatabase() {
    $FloorAppDatabase
        .databaseBuilder('database_wallet.db')
        .build()
        .then((value) {
      database = value;
      dao = database!.exchangeCategoryDao;
      emit(ExchangeCreateDatabaseState());

      getExchangesFromDatabase();
    });
  }

  void getExchangesFromDatabase() {
    this.dao!.retrieveExchangeCategories().then((value) {
      exchanges = value!;

      emit(GetExchangesFromDatabaseState());
    });
  }

  Future<void> insertToDatabase(
      {@required String? exchangeName,
      @required String? catImage}) async {
    int id = 0 ;
    if (exchanges!.length == 0){
      id = 1 ;
    }else{
      id = exchanges![exchanges!.length - 1].id + 1;
    }

    if(id > 0 ){
      dao!.insertExchangeCategory(
          ExchangeCategory(id, exchangeName!, 1, catImage!, 0, 1))
          .then((value) {
        emit(InsertExchangesToDatabaseState());
        getExchangesFromDatabase();
      });
    }

  }

  Future<void> updateExchangeDatabase({
    @required int? isId,
    @required String? exchangeName,
    @required String? icon,
  }) async {
    print('////////////////////////////////////333333333333 $isId');
    print('////////////////////////////////////22222222222 $exchangeName');
    print('////////////////////////////////////111111111 $icon');
    dao!.updateExchangeCategory(
            ExchangeCategory(isId!, exchangeName!, 1, icon!, 0, 1))
        .then((value) {
      emit(UpdateExchangesToDatabaseState());
      getExchangesFromDatabase();
    });
  }

  void deleteExchangeFromDatabase({
    @required int? id,
  }) {
    dao!.deleteExchangeCategory(id!).then((value) {
      emit(DeleteExchangesFromDatabaseState());
      getExchangesFromDatabase();
    });
  }

  int getExchangeId({
    @required String? exchangeName,
  }) {
    for (int i = 0; i < exchanges!.length; i++) {
      if (exchanges![i].name == exchangeName) {
        return exchanges![i].id;
      }
    }
    return 0;
  }

  String getExchangeIcon({
    @required int? exchangeId,
  }) {
    for (int i = 0; i < exchanges!.length; i++) {
      if (exchanges![i].id == exchangeId) {
        return exchanges![i].icon;
      }
    }
    return 'error';
  }

  String getExchangeName({
    @required int? exchangeId,
  }) {
    for (int i = 0; i < exchanges!.length; i++) {
      if (exchanges![i].id == exchangeId) {
        return exchanges![i].name;
      }
    }
    return 'error';
  }

  void choseImage({
  @required String? image,
}){
    print('ooooooooooooooooooooooooooooooooo $image');
    chosenImage = image;
    emit(ChoseImageFromCategoryImagePageState());
  }
}
