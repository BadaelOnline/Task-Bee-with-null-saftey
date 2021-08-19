import 'package:financial/common/database/database.dart';
import 'package:financial/models/financial_report.dart';
import 'package:financial/models/transaction.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:financial/services/dao/dao_transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionCubit extends Cubit<TransactionStates> {
  TransactionCubit() : super(TransactionIntialState());

  static TransactionCubit get(context) => BlocProvider.of(context);

  AppDatabase? database;
  TransactionDao? dao;
  List<Transaction>? transactions = [];
  List<Transaction>? revenues = [];
  List<Transaction>? expenses = [];
  FinancialReport? report;
  List<FinancialReport>? reports;
  List<FinancialReport>? transactionByContact;
  int? lastId;

  void createDatabase() {
    $FloorAppDatabase
        .databaseBuilder('database_wallet.db')
        .build()
        .then((value) {
      database = value;
      dao = database!.transactionDao;
      emit(TransactionCreateDatabaseState());

      getTransactionsFromDatabase();
    });
  }

  void getTransactionsFromDatabase() {
    revenues!.clear();
    expenses!.clear();
    this.dao!.findAllTransaction().then((value) {
      transactions = value;

      for(int i = 0 ; i < value!.length ; i++){
        if (value[i].isIncome == 0){
          revenues!.add(value[i]);
        }else{
          expenses!.add(value[i]);
        }
      }
      if (value.length > 0) {
        lastId = value[value.length - 1].id;
      } else {
        lastId = 0;
      }

      emit(GetTransactionsFromDatabaseState());
    }).catchError((onError) {
      print('2222222222222 $onError');
    });
  }


  void getTransactionByContactFromDatabase({
    @required int? contactId,
    @required int? walletId,
    @required int? categoryId,
    int? currencyID,
  }) {
    this
        .dao!
        .transactionByContact(contactId!, walletId!, categoryId!)
        .then((value) {
      transactionByContact = value;
      emit(GetTransactionsFromDatabaseState());
    });
  }

  Future<void> insertToDatabase(
      {      @required String? total,
      @required String? paid,
      @required String? rest,
      @required String? transactionDate,
      @required String? description,
      @required int? exchangeId,
      @required int? walletId,
      @required int? contactId,
      @required int? isIncome}) async {

    int id = 0 ;
    if (transactions!.length == 0){
      id = 1 ;
    }else{
      id = transactions![transactions!.length - 1].id + 1;
    }

    if(id > 0 ){
      dao!.insertTransaction(Transaction(id, total!, paid!, rest!, transactionDate!,
          description!, 1, 1, isIncome!, exchangeId!, walletId!, contactId!))
          .then((value) {
        emit(InsertTransactionsToDatabaseState());
        getTransactionsFromDatabase();
      });
    }
  }

  Future<void> updateTransactionDatabase({
    @required int? isId,
    @required String? total,
    @required String? paid,
    @required String? rest,
    @required String? transactionDate,
    @required String? description,
    @required int? exchangeId,
    @required int? walletId,
    @required int? contactId,
  }) async {
    dao!
        .updateTransaction(Transaction(isId!, total!, paid!, rest!, transactionDate!,
            description!, 1, 1, 1, exchangeId!, walletId!, contactId!))
        .then((value) {
      emit(UpdateTransactionsToDatabaseState());
      getTransactionsFromDatabase();
    });
  }

  void deleteTransactionFromDatabase({
    @required int? id,
  }) {
    dao!.deleteTransaction(id!).then((value) {
      emit(DeleteTransactionsFromDatabaseState());
      getTransactionsFromDatabase();
    });
  }
}
