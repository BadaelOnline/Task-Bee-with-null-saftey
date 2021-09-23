import 'package:financial/screens/Debts/debts_form.dart';
import 'package:financial/screens/Debts/home_debts.dart';
import 'package:financial/screens/contact/add_contact.dart';
import 'package:financial/screens/contact/choosecontact.dart';
import 'package:financial/screens/contact/contact_home.dart';
import 'package:financial/screens/contact/preview_contact/preview_contact.dart';
import 'package:financial/screens/contact/preview_contact/preview_debts.dart';
import 'package:financial/screens/contact/preview_contact/preview_tasks.dart';
import 'package:financial/screens/contact/preview_contact/preview_team_work.dart';
import 'package:financial/screens/contact/preview_contact/preview_transaction.dart';
import 'package:financial/screens/contact/update_contact.dart';
import 'package:financial/screens/currency/add_currency.dart';
import 'package:financial/screens/currency/chose_currency.dart';
import 'package:financial/screens/currency/currency_home.dart';
import 'package:financial/screens/currency/update_currency.dart';
import 'package:financial/screens/exchange_category/add_exchange.dart';
import 'package:financial/screens/exchange_category/category.dart';
import 'package:financial/screens/exchange_category/choose_exchang.dart';
import 'package:financial/screens/exchange_category/exchange_home.dart';
import 'package:financial/screens/exchange_category/update_exchange.dart';
import 'package:financial/screens/expenses/add_expense.dart';
import 'package:financial/screens/expenses/expense_home.dart';
import 'package:financial/screens/expenses/update_expense.dart';
import 'package:financial/screens/report/report_home.dart';
import 'package:financial/screens/report/report_search.dart';
import 'package:financial/screens/report/report_search_result.dart';
import 'package:financial/screens/revenue_categories/add_revenue_category.dart';
import 'package:financial/screens/revenue_categories/choose_revenue.dart';
import 'package:financial/screens/revenue_categories/revenue_home.dart';
import 'package:financial/screens/revenue_categories/update_revenue_category.dart';
import 'package:financial/screens/revenues/Add_Revenue.dart';
import 'package:financial/screens/revenues/revenues_home.dart';
import 'package:financial/screens/revenues/update_revenues.dart';
import 'package:financial/screens/shared/HomePage.dart';
import 'package:financial/screens/transaction/add_transaction.dart';
import 'package:financial/screens/transaction/transaction_home.dart';
import 'package:financial/screens/wallet/add_wallet/add_bank_account.dart';
import 'package:financial/screens/wallet/add_wallet/add_cash_wallet.dart';
import 'package:financial/screens/wallet/add_wallet/add_credit_card.dart';
import 'package:financial/screens/wallet/add_wallet/add_planer_save.dart';
import 'package:financial/screens/wallet/add_wallet/add_priberd_card.dart';
import 'package:financial/screens/wallet/addwallet.dart';
import 'package:financial/screens/wallet/choose_wallet.dart';
import 'package:financial/screens/wallet/updateWallet.dart';
import 'package:financial/screens/wallet/update_wallet/update_bank_account.dart';
import 'package:financial/screens/wallet/update_wallet/update_cash_Wallet.dart';
import 'package:financial/screens/wallet/update_wallet/update_credit_card.dart';
import 'package:financial/screens/wallet/update_wallet/update_planer_save.dart';
import 'package:financial/screens/wallet/update_wallet/update_priberd_card.dart';
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
      case '/choosewallet':
        return MaterialPageRoute(
          builder: (_) => ChooseWallet(),
        );
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
            builder: (_) => Add_Cash_Wallet(),
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
      case '/chooseexchang':
        return MaterialPageRoute(
          builder: (_) => ChooseExchang(),
        );
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

      /// exchanges routes
      case '/chooseRevenue':
        return MaterialPageRoute(
          builder: (_) => ChooseRevenue(),
        );
      case '/revenueCategoryHome':
        return MaterialPageRoute(
          builder: (_) => RevenueCategoryHome(),
        );
      case '/addRevenueCategory':
        return MaterialPageRoute(
          builder: (_) => AddRevenueCategory(),
        );
      case '/updateRevenueCategory':
        return MaterialPageRoute(
            builder: (_) => UpdateRevenueCategory(),
            settings: RouteSettings(arguments: settings.arguments));

      /// contacts routes
      case '/previewcontact':
        return MaterialPageRoute(
            builder: (_) => Preview_Contact(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/choosecontact':
        return MaterialPageRoute(
          builder: (_) => ChooseContact(),
        );
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
      case '/previewtransaction':
        return MaterialPageRoute(
          builder: (_) => Preview_Transaction(),
        );
      case '/previewdebtes':
        return MaterialPageRoute(
          builder: (_) => Preview_Debts(),
        );
      case '/previewtasks':
        return MaterialPageRoute(
          builder: (_) => Preview_Tasks(),
        );
      case '/previewteamwork':
        return MaterialPageRoute(
          builder: (_) => Preview_TeamWork(),
        );
      case '/previewproject':
        return MaterialPageRoute(
          builder: (_) => Preview_TeamWork(),
        );

      /// currency routes
      case '/choosecurrency':
        return MaterialPageRoute(
          builder: (_) => ChooseCurrency(),
        );
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
      // case '/updateTransaction':
      //   return MaterialPageRoute(
      //       builder: (_) => UpdateTransaction(),
      //       settings: RouteSettings(arguments: settings.arguments));

      /// revenues routes
      case '/revenuesHome':
        return MaterialPageRoute(
          builder: (_) => RevenuesHome(),
        );
      case '/addRevenue':
        return MaterialPageRoute(
          builder: (_) => Add_Revenue(),
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

      default:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
    }
  }
}
