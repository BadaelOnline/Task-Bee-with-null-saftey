import 'package:financial/common/database/database.dart';
import 'package:financial/models/wallet.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/services/dao/dao_wallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletCubit extends Cubit<WalletStates> {
  WalletCubit() : super(WalletInitialState());

  static WalletCubit get(context) => BlocProvider.of(context);

  AppDatabase? database;
  WalletDao? dao;
  List<Wallet>? wallets = [];
  int? lastId;
  Wallet? chosenWallet;

  void createDatabase() {
    $FloorAppDatabase
        .databaseBuilder('database_wallet.db')
        .build()
        .then((value) {
      database = value;
      dao = database!.walletDao;
      emit(WalletCreateDatabaseState());

      getWalletsFromDatabase();
    });
  }

  void getWalletsFromDatabase() {
    this.dao!.retrieveWallets().then((value) {
      wallets = value;
      for (int i = 0; i < value!.length; i++) {}
      if (value.length > 0) {
        lastId = value[value.length - 1].id;
      } else {
        lastId = 0;
      }

      emit(GetWalletsFromDatabaseState());
    });
  }

  Future<void> insertToDatabase(
      {@required String? walletName,
      @required String? walletBalance,
      @required int? currencyId,
      @required String? icon}) async {
    int id = 0;
    if (wallets!.length == 0) {
      id = 1;
    } else {
      id = wallets![wallets!.length - 1].id + 1;
    }
    if (id > 0) {
      dao!
          .insertWallet(Wallet(
        id,
        walletName!,
        walletBalance!,
        1,
        icon!,
        1,
        currencyId!,
      ))
          .then((value) {
        emit(InsertWalletsToDatabaseState());
        getWalletsFromDatabase();
      });
    }
  }

  Future<void> updateWalletDatabase(
      {@required int? isId,
      @required String? walletName,
      @required String? walletBalance,
      @required int? currencyId,
      @required String? icon}) async {
    dao!
        .updateWallet(Wallet(
            isId!, walletName!, walletBalance!, 1, icon!, 1, currencyId!))
        .then((value) {
      emit(UpdateWalletsToDatabaseState());
      getWalletsFromDatabase();
    });
  }

  void deleteWalletFromDatabase({
    @required int? id,
  }) {
    dao!.deleteWallet(id!).then((value) {
      emit(DeleteWalletsFromDatabaseState());
      getWalletsFromDatabase();
    });
  }

  int getWalletId({
    @required String? walletName,
  }) {
    for (int i = 0; i < wallets!.length; i++) {
      if (wallets![i].name == walletName) {
        return wallets![i].id;
      }
    }
    return 0;
  }

  String getWalletBalance({
    @required String? walletName,
  }) {
    for (int i = 0; i < wallets!.length; i++) {
      if (wallets![i].name == walletName) {
        return wallets![i].balance;
      }
    }
    return 'error';
  }

  String getWalletIcon({
    @required String? walletName,
  }) {
    for (int i = 0; i < wallets!.length; i++) {
      if (wallets![i].name == walletName) {
        return wallets![i].icon;
      }
    }
    return 'error';
  }

  String getWalletName({
    @required int? walletId,
  }) {
    for (int i = 0; i < wallets!.length; i++) {
      if (wallets![i].id == walletId) {
        return wallets![i].name;
      }
    }
    return 'error';
  }

  String getWalletIconFromId({
    @required int? walletId,
  }) {
    for (int i = 0; i < wallets!.length; i++) {
      if (wallets![i].id == walletId) {
        return wallets![i].icon;
      }
    }
    return 'error';
  }

  int getWalletCurrency({
    @required String? walletName,
  }) {
    for (int i = 0; i < wallets!.length; i++) {
      if (wallets![i].name == walletName) {
        return wallets![i].currencyId;
      }
    }
    return 0;
  }

  int getWalletCurrencyId({
    @required int? walletId,
  }) {
    for (int i = 0; i < wallets!.length; i++) {
      if (wallets![i].id == walletId) {
        return wallets![i].currencyId;
      }
    }
    return 0;
  }

  Wallet? getWallet({
    @required int? walletId,
  }) {
    for (int i = 0; i < wallets!.length; i++) {
      if (wallets![i].id == walletId) {
        return wallets![i];
      }
    }
    return null;
  }

  void choseWallet({
    @required Wallet? wallet,
  }) {
    print('ooooooooooooooooooooooooooooooooo $wallet');
    chosenWallet = wallet;

    emit(ChoseWalletFromChooseWalletPageState());
  }
}
