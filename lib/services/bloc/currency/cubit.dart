import 'package:financial/common/database/database.dart';
import 'package:financial/models/currency.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/dao/dao_currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCubit extends Cubit<CurrencyStates>{
  CurrencyCubit() : super(CurrencyIntialState());

  static CurrencyCubit get(context) => BlocProvider.of(context);

  AppDatabase? database ;
  CurrencyDao? dao  ;
  List<Currency>? currencies = [];

  void createDatabase(){
    $FloorAppDatabase.databaseBuilder('database_wallet.db').build().then((value) {
      database = value;
      dao = database!.currencyDao;
      emit(CurrencyCreateDatabaseState());

      getCurrenciesFromDatabase();
    });
  }

  void getCurrenciesFromDatabase(){
    this.dao!.findAllCurrencies().then((value) {
      currencies = value;
      emit(GetCurrenciesFromDatabaseState());


    });
  }

  void insertToDatabase({
    @required String? currencyName,
  }){
    int id = 0 ;
    if (currencies!.length == 0){
      id = 1 ;
    }else{
       id = currencies![currencies!.length - 1].id + 1;
    }

    if(id > 0 ){
      dao!.insertCurrency(Currency(id, currencyName!,'','')).then((value) {
        emit(InsertCurrenciesToDatabaseState());
        getCurrenciesFromDatabase();

      });
    }

  }



  Future<void> updateCurrencyDatabase({
    @required int? isId,
    @required String? currencyName,
  })async {
    dao!.updateCurrency(Currency(isId!, currencyName!, '','')).then((value) {
      emit(UpdateCurrencyToDatabaseState());
      getCurrenciesFromDatabase();

    });
  }

  void deleteCurrencyFromDatabase({
    @required int? id,
  }){
    dao!.deleteCurrency(id!).then((value)  {
      emit(DeleteCurrenciesFromDatabaseState());
      getCurrenciesFromDatabase();
    });
  }

  String getCurrencyOfWallet({
    @required int? currencyId,
  }){
    for(int i = 0 ; i <currencies!.length;i++){
      if(currencies![i].id == currencyId){
        return currencies![i].name;
      }
    }
    return 'no currency for this wallet';
  }

  int getCurrencyId({
    @required String? currencyName,
  }){
    for(int i = 0 ; i <currencies!.length;i++){
      if(currencies![i].name == currencyName){
        return currencies![i].id;
      }
    }
    return 0;
  }




}