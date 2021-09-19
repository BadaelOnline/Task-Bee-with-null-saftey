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
  List<ExchangeCategory>? allCategories = [];
  List<ExchangeCategory>? exchanges = [];
  List<ExchangeCategory>? revenues = [];
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
    revenues!.clear();
    exchanges!.clear();
    this.dao!.retrieveExchangeCategories().then((value) {
      allCategories = value;
      for(int i = 0 ; i < value!.length ; i++){
        if(value[i].isIncome == 1){
          revenues!.add(value[i]);
        }else{
          exchanges!.add(value[i]);
        }
      }

      emit(GetExchangesFromDatabaseState());
    });
  }

  Future<void> insertToDatabase(
      {@required String? exchangeName,
      @required String? catImage,
      @required int? isIncome
      }) async {
    int id = 0 ;
    if (allCategories!.length == 0){
      id = 1 ;
    }else{
      id = allCategories![allCategories!.length - 1].id + 1;
    }

    if(id > 0 ){
      dao!.insertExchangeCategory(
          ExchangeCategory(id, exchangeName!, 1, catImage!, 0, isIncome!))
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
    @required int? isIncome
  }) async {
    dao!.updateExchangeCategory(
            ExchangeCategory(isId!, exchangeName!, 1, icon!, 0, isIncome!))
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
    for (int i = 0; i < allCategories!.length; i++) {
      if (allCategories![i].name == exchangeName) {
        return allCategories![i].id;
      }
    }
    return 0;
  }

  String getExchangeIcon({
    @required int? exchangeId,
  }) {
    for (int i = 0; i < allCategories!.length; i++) {
      if (allCategories![i].id == exchangeId) {
        return allCategories![i].icon;
      }
    }
    return 'error';
  }

  String getExchangeName({
    @required int? exchangeId,
  }) {
    for (int i = 0; i < allCategories!.length; i++) {
      if (allCategories![i].id == exchangeId) {
        return allCategories![i].name;
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
