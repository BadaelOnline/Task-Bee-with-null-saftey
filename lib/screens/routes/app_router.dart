import 'package:financial/screens/Debts/debts_form.dart';
import 'package:financial/screens/Debts/home_debts.dart';
import 'package:financial/screens/contact/add_contact.dart';
import 'package:financial/screens/contact/contact_home.dart';
import 'package:financial/screens/contact/update_contact.dart';
import 'package:financial/screens/currency/add_currency.dart';
import 'package:financial/screens/currency/currency_home.dart';
import 'package:financial/screens/currency/update_currency.dart';
import 'package:financial/screens/debts/debts_home.dart';
import 'package:financial/screens/exchange_category/add_exchange.dart';
import 'package:financial/screens/exchange_category/category.dart';
import 'package:financial/screens/exchange_category/exchange_home.dart';
import 'package:financial/screens/exchange_category/update_exchange.dart';
import 'package:financial/screens/expenses/add_expense.dart';
import 'package:financial/screens/expenses/expense_home.dart';
import 'package:financial/screens/expenses/update_expense.dart';
import 'package:financial/screens/report/report_home.dart';
import 'package:financial/screens/report/report_search.dart';
import 'package:financial/screens/report/report_search_result.dart';
import 'package:financial/screens/revenues/add_revenues.dart';
import 'package:financial/screens/revenues/revenues_home.dart';
import 'package:financial/screens/revenues/update_revenues.dart';
import 'package:financial/screens/shared/HomePage.dart';
import 'package:financial/screens/shared/myhomepage.dart';
import 'package:financial/screens/transaction/add_transaction.dart';
import 'package:financial/screens/transaction/transaction_home.dart';
import 'package:financial/screens/transaction/update_transaction.dart';
import 'package:financial/screens/wallet/add_bank_account.dart';
import 'package:financial/screens/wallet/add_cash_wallet.dart';
import 'package:financial/screens/wallet/add_credit_card.dart';
import 'package:financial/screens/wallet/add_planer_save.dart';
import 'package:financial/screens/wallet/add_priberd_card.dart';
import 'package:financial/screens/wallet/addwallet.dart';
import 'package:financial/screens/wallet/updateWallet.dart';
import 'package:financial/screens/wallet/update_bank_account.dart';
import 'package:financial/screens/wallet/update_cash_Wallet.dart';
import 'package:financial/screens/wallet/update_credit_card.dart';
import 'package:financial/screens/wallet/update_planer_save.dart';
import 'package:financial/screens/wallet/update_priberd_card.dart';
import 'package:financial/screens/wallet/wallet_home.dart';
import 'package:financial/screens/wallet/wallets_list.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// home page
      case '/':
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );

      /// wallets routes
      case '/walletHome':
        return MaterialPageRoute(
          builder: (_) => WalletHome(),
        );
      case '/addBankAccount':
        return MaterialPageRoute(
          builder: (_) => AddBankAccount(),
        );
      case '/addCashWallet':
        return MaterialPageRoute(
          builder: (_) => AddCashWallet(),
        );
      case '/addCreditCard':
        return MaterialPageRoute(
          builder: (_) => AddCreditCard(),
        );
      case '/addPlannerSave':
        return MaterialPageRoute(
          builder: (_) => AddPlannerSave(),
        );
      case '/addPrepaidCard':
        return MaterialPageRoute(
          builder: (_) => AddPrepaidCard(),
        );
      case '/addWallet':
        return MaterialPageRoute(
          builder: (_) => AddWallet(),
        );
      case '/updateWallet':
        return MaterialPageRoute(
          builder: (_) => UpdateWallet(),
        );
      case '/walletsList':
        return MaterialPageRoute(
          builder: (_) => WalletsList(),
        );
      case '/updatePlanerSave':
        return MaterialPageRoute(
            builder: (_) => UpdatePlannerSave(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/updateBankAccount':
        return MaterialPageRoute(
            builder: (_) => UpdateBankAccount(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/updateCashWallet':
        return MaterialPageRoute(
            builder: (_) => Updatewallet(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/updateCreditCard':
        return MaterialPageRoute(
            builder: (_) => UpdateCreditCard(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/updatePriberdCard':
        return MaterialPageRoute(
            builder: (_) => UpdatePrepaidCard(),
            settings: RouteSettings(arguments: settings.arguments));

      /// exchanges routes
      case '/exchangeHome':
        return MaterialPageRoute(
          builder: (_) => ExchangeHome(),
        );
      case '/addExchange':
        return MaterialPageRoute(
          builder: (_) => AddExchange(),
        );
      case '/category':
        return MaterialPageRoute(
          builder: (_) => Category(),
        );
      case '/updateExchange':
        return MaterialPageRoute(
            builder: (_) => UpdateExchange(),
            settings: RouteSettings(arguments: settings.arguments));

      /// contacts routes
      case '/contactHome':
        return MaterialPageRoute(
          builder: (_) => ContactHome(),
        );
      case '/addContact':
        return MaterialPageRoute(
          builder: (_) => AddContact(),
        );
      case '/updateContact':
        return MaterialPageRoute(
            builder: (_) => UpdateContact(),
            settings: RouteSettings(arguments: settings.arguments));

      /// currency routes
      case '/currencyHome':
        return MaterialPageRoute(
          builder: (_) => CurrencyHome(),
        );
      case '/addCurrency':
        return MaterialPageRoute(
          builder: (_) => AddCurrency(),
        );
      case '/updateCurrency':
        return MaterialPageRoute(
            builder: (_) => UpdateCurrency(),
            settings: RouteSettings(arguments: settings.arguments));

      /// transactions routes
      case '/transactionHome':
        return MaterialPageRoute(
          builder: (_) => TransactionHome(),
        );
      case '/addTransaction':
        return MaterialPageRoute(
          builder: (_) => AddTransaction(),
        );
      case '/updateTransaction':
        return MaterialPageRoute(
            builder: (_) => UpdateTransaction(),
            settings: RouteSettings(arguments: settings.arguments));

      /// revenues routes
      case '/revenuesHome':
        return MaterialPageRoute(
          builder: (_) => RevenuesHome(),
        );
      case '/addRevenue':
        return MaterialPageRoute(
          builder: (_) => AddRevenues(),
        );
      case '/updateRevenue':
        return MaterialPageRoute(
            builder: (_) => UpdateRevenues(),
            settings: RouteSettings(arguments: settings.arguments));

      /// expenses routes
      case '/expensesHome':
        return MaterialPageRoute(
          builder: (_) => ExpenseHome(),
        );
      case '/addExpense':
        return MaterialPageRoute(
          builder: (_) => AddExpense(),
        );
      case '/updateExpense':
        return MaterialPageRoute(
            builder: (_) => UpdateExpense(),
            settings: RouteSettings(arguments: settings.arguments));

      /// reports routes
      case '/reportHome':
        return MaterialPageRoute(
          builder: (_) => ReportHome(),
        );
      case '/reportSearch':
        return MaterialPageRoute(
          builder: (_) => ReportSearch(),
        );
      case '/reportSearchResult':
        return MaterialPageRoute(
            builder: (_) => ReportSearchResult(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/debtsHome':
        return MaterialPageRoute(
            builder: (_) => DebtsHome(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/debtsForm':
        return MaterialPageRoute(
            builder: (_) => DebtsForm(),
            settings: RouteSettings(arguments: settings.arguments));


    /// debts routes
      case '/debtsHome':
        return MaterialPageRoute(
          builder: (_) => DebtsHome(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
    }
  }
}
