import 'package:taskBee/screens/Debts/add_debts.dart';
import 'package:taskBee/screens/Debts/creditor/pay_creditor.dart';
import 'package:taskBee/screens/Debts/creditor/recepit_creditor.dart';
import 'package:taskBee/screens/Debts/creditor/view_debts_name_creditor.dart';
import 'package:taskBee/screens/Debts/debtor/pay_debtor.dart';
import 'package:taskBee/screens/Debts/debtor/recepit_debtor.dart';
import 'package:taskBee/screens/Debts/debtor/view_debts_name_debtor.dart';
import 'package:taskBee/screens/Debts/home_debts.dart';
import 'package:taskBee/screens/bmi/bmi_archives.dart';
import 'package:taskBee/screens/bmi/bmi_home.dart';
import 'package:taskBee/screens/bmi/bmi_show_result.dart';
import 'package:taskBee/screens/contact/add_contact.dart';
import 'package:taskBee/screens/contact/choosecontact.dart';
import 'package:taskBee/screens/contact/contact_home.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_contact.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_debts.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_tasks.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_team_work.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_transaction.dart';
import 'package:taskBee/screens/contact/update_contact.dart';
import 'package:taskBee/screens/currency/add_currency.dart';
import 'package:taskBee/screens/currency/chose_currency.dart';
import 'package:taskBee/screens/currency/currency_home.dart';
import 'package:taskBee/screens/currency/update_currency.dart';
import 'package:taskBee/screens/exchange_category/add_exchange.dart';
import 'package:taskBee/screens/exchange_category/category.dart';
import 'package:taskBee/screens/exchange_category/choose_exchang.dart';
import 'package:taskBee/screens/exchange_category/exchange_home.dart';
import 'package:taskBee/screens/exchange_category/report_categoray.dart';
import 'package:taskBee/screens/exchange_category/update_exchange.dart';
import 'package:taskBee/screens/expenses/add_expense.dart';
import 'package:taskBee/screens/expenses/expense_home.dart';
import 'package:taskBee/screens/expenses/update_expense.dart';
import 'package:taskBee/screens/report/report_home.dart';
import 'package:taskBee/screens/report/report_search.dart';
import 'package:taskBee/screens/report/report_search_result.dart';
import 'package:taskBee/screens/revenue_categories/add_revenue_category.dart';
import 'package:taskBee/screens/revenue_categories/choose_revenue.dart';
import 'package:taskBee/screens/revenue_categories/revenue_home.dart';
import 'package:taskBee/screens/revenue_categories/update_revenue_category.dart';
import 'package:taskBee/screens/revenues/Add_Revenue.dart';
import 'package:taskBee/screens/revenues/revenues_home.dart';
import 'package:taskBee/screens/revenues/update_revenues.dart';
import 'package:taskBee/screens/shared/HomePage.dart';
import 'package:taskBee/screens/tasks/CategoraysTask.dart';
import 'package:taskBee/screens/tasks/TaskHome.dart';
import 'package:taskBee/screens/tasks/add_task_page.dart';
import 'package:taskBee/screens/tasks/choose_contact.dart';
import 'package:taskBee/screens/tasks/filter_screen.dart';
import 'package:taskBee/screens/tasks/view_result_filter_screen.dart';
import 'package:taskBee/screens/transaction/add_transaction.dart';
import 'package:taskBee/screens/transaction/transaction_home.dart';
import 'package:taskBee/screens/wallet/add_wallet/add_bank_account.dart';
import 'package:taskBee/screens/wallet/add_wallet/add_cash_wallet.dart';
import 'package:taskBee/screens/wallet/add_wallet/add_credit_card.dart';
import 'package:taskBee/screens/wallet/add_wallet/add_planer_save.dart';
import 'package:taskBee/screens/wallet/add_wallet/add_prepaid_card.dart';
import 'package:taskBee/screens/wallet/addwallet.dart';
import 'package:taskBee/screens/wallet/choose_wallet.dart';
import 'package:taskBee/screens/wallet/page_report/bank_account_reports.dart';
import 'package:taskBee/screens/wallet/page_report/cash_reports.dart';
import 'package:taskBee/screens/wallet/page_report/credit_card_reports.dart';
import 'package:taskBee/screens/wallet/page_report/planer_save_reports.dart';
import 'package:taskBee/screens/wallet/page_report/prepaid_card_reports.dart';
import 'package:taskBee/screens/wallet/transferring_between_wallet/transfer_wallets.dart';
import 'package:taskBee/screens/wallet/updateWallet.dart';
import 'package:taskBee/screens/wallet/update_wallet/update_bank_account.dart';
import 'package:taskBee/screens/wallet/update_wallet/update_cash_Wallet.dart';
import 'package:taskBee/screens/wallet/update_wallet/update_credit_card.dart';
import 'package:taskBee/screens/wallet/update_wallet/update_planer_save.dart';
import 'package:taskBee/screens/wallet/update_wallet/update_priberd_card.dart';
import 'package:taskBee/screens/wallet/wallet_home.dart';
import 'package:taskBee/screens/wallet/wallets_list.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// home page
      case '/':
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );

      /// wallets routes////////////////////////////////////////////////////////
      case '/transferwallet':
        return MaterialPageRoute(
          builder: (_) => Transfer_Wallet(),
        );
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

///// Report All Wallet

      case '/cashreports':
        return MaterialPageRoute(
            builder: (_) => CashReports(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/bankaccountreports':
        return MaterialPageRoute(
            builder: (_) => BankAccountReports(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/creditcardreports':
        return MaterialPageRoute(
            builder: (_) => CreditCardReports(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/prepaidcardreports':
        return MaterialPageRoute(
            builder: (_) => PrepaidCardReports(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/plannersavereports':
        return MaterialPageRoute(
            builder: (_) => PlannerSaveReports(),
            settings: RouteSettings(arguments: settings.arguments));

      /// exchanges routes /////////////////////////////////////////////////////////////////////
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

      case '/reportpagecategoray':
        return MaterialPageRoute(
            builder: (_) => ReportCategoray(),
            settings: RouteSettings(arguments: settings.arguments));

      /// contacts routes/////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

      /// currency routes//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

      /// revenues routes/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

      /// expenses routes /////////////////////////////////////////////////////////////////////////////////////////////
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

      /// reports routes////////////////////////////////////////////////////////////////////////////////////////////
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

      //////////////////////////////////////////////////// debts////////////////////////////////////////////////////
      case '/debtsHome':
        return MaterialPageRoute(
            builder: (_) => DebtsHome(),
            settings: RouteSettings(arguments: settings.arguments));
      case '/debtsForm':
        return MaterialPageRoute(
            builder: (_) => DebtsForm(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/viewdebtscreditor':
        return MaterialPageRoute(
            builder: (_) => ViewDebts_Name_Creditor(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/viewdebtsdebtor':
        return MaterialPageRoute(
            builder: (_) => ViewDebts_Name_Debtor(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/paycreditor':
        return MaterialPageRoute(
            builder: (_) => payCreditor(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/paydebtor':
        return MaterialPageRoute(
            builder: (_) => Paydebtor(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/recepitcreditor':
        return MaterialPageRoute(
            builder: (_) => Recepit_creditor(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/recepitdebtor':
        return MaterialPageRoute(
          builder: (_) => Recepitdebtor(),
        );
      //  bmi routes//////////////////////////////////////////////////////////////////////////////////////////////////////////
      case '/BmiHome':
        return MaterialPageRoute(
            builder: (_) => BmiHome(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/BmiShowResult':
        return MaterialPageRoute(
            builder: (_) => BmiShowResult(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/BmiArchives':
        return MaterialPageRoute(
            builder: (_) => BmiArchives(),
            settings: RouteSettings(arguments: settings.arguments));

      ///// Tasks //////////////////////////////////////////////////////////////////////////////////////////////////////////

      case '/HomeTask':
        return MaterialPageRoute(
            builder: (_) => TasksHome(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/CategoraysTask':
        return MaterialPageRoute(
            builder: (_) => CategorayTask(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/AddTask':
        return MaterialPageRoute(
            builder: (_) => AddTaskPage(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/chooseContactTask':
        return MaterialPageRoute(
            builder: (_) => ChooseContactTasks(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/FilterScreenTask':
        return MaterialPageRoute(
            builder: (_) => FilterTasksScreen(),
            settings: RouteSettings(arguments: settings.arguments));

      case '/ViewResultFilterScreen':
        return MaterialPageRoute(
            builder: (_) => ViewResultFilterScreen(),
            settings: RouteSettings(arguments: settings.arguments));

      /// default ///////

      default:
        return MaterialPageRoute(
          builder: (_) => MyHomePage(),
        );
    }
  }
}
