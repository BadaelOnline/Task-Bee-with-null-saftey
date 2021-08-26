import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/widget/TransAction_Card_1.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_expense.dart';

class ExpenseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionCubit, TransactionStates>(
      listener: (BuildContext context, TransactionStates state) {},
      builder: (BuildContext context, TransactionStates state) {
        TransactionCubit transactionCubit = TransactionCubit.get(context);
        ContactCubit contactCubit = ContactCubit.get(context);
        ExchangeCubit exchangeCubit = ExchangeCubit.get(context);
        WalletCubit walletCubit = WalletCubit.get(context);
        CurrencyCubit currencyCubit = CurrencyCubit.get(context);
        return Scaffold(
            appBar: CustomAppBar(Icon(Icons.wallet_giftcard), 'Expense'),
            body: ListView.builder(
              itemCount: transactionCubit.expenses!.length,
              itemBuilder: (BuildContext context, int index) {
                return BlocConsumer<CurrencyCubit, CurrencyStates>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return TransactionCard(
                    contact: '${contactCubit.getContactName(contactId: transactionCubit.expenses![index].contactId)}',
                    datetime:
                    '${transactionCubit.expenses![index].transactionDate}',
                    iconExchange: Image.asset(
                        '${exchangeCubit.getExchangeIcon(exchangeId: transactionCubit.expenses![index].exchangeId)}'),
                    imageWallet:
                    Image.asset('${walletCubit.getWalletIconFromId(walletId:transactionCubit.expenses![index].walletId )}'),
                    iconMoneyType:
                    Image.asset('${walletCubit.getWalletIconFromId(walletId:transactionCubit.expenses![index].walletId )}'),
                    note:
                    '${transactionCubit.expenses![index].description}',
                    paidMoney:
                    '${transactionCubit.expenses![index].paid}',
                    deleteTransaction:() {
                          transactionCubit.deleteTransactionFromDatabase(
                              id: transactionCubit.expenses![index].id);
                        },
                    updateTransaction:() {
                      Navigator.of(context).pushNamed('/updateExpense',
                      arguments: {
                        'transaction': transactionCubit.expenses![index]
                      });
                        },
                    totalMoney:
                    '${transactionCubit.expenses![index].total}',
                    restMoney:
                    '${transactionCubit.expenses![index].rest}',
                    titleExchange:
                    '${exchangeCubit.getExchangeName(exchangeId: transactionCubit.expenses![index].exchangeId)}',
                    walletType: '${walletCubit.getWalletName(walletId: transactionCubit.expenses![index].walletId)}',
                    currency: '${currencyCubit.getCurrencyOfWallet(currencyId: walletCubit.getWalletCurrencyId(walletId: transactionCubit.expenses![index].walletId))}');
  },
);
              },
            ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/addExpense'),
            )
            );
      },
    );
  }

}