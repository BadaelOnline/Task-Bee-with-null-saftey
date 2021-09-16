// database.dart

// required package imports
import 'dart:async';
import 'package:financial/models/bmi.dart';
import 'package:financial/models/contact.dart';
import 'package:financial/models/currency.dart';
import 'package:financial/models/exchange_category.dart';
import 'package:financial/models/financial_report.dart';
import 'package:financial/models/transaction.dart';
import 'package:financial/models/wallet.dart';
import 'package:financial/services/dao/dao_bmi.dart';
import 'package:financial/services/dao/dao_contact.dart';
import 'package:financial/services/dao/dao_exchange_category.dart';
import 'package:financial/services/dao/dao_transaction.dart';
import 'package:financial/services/dao/dao_wallet.dart';
import 'package:financial/services/dao/dao_currency.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart'; // the generated code will be there

@Database(
    version: 1,
    entities: [Wallet, Currency, Transaction, Contact, ExchangeCategory, Bmi])
abstract class AppDatabase extends FloorDatabase {
  WalletDao get walletDao;
  CurrencyDao get currencyDao;
  TransactionDao get transactionDao;
  ExchangeCategoryDao get exchangeCategoryDao;
  ContactDao get contactDao;
  BmiDao get bmiDao;
}
