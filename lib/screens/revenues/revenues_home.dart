import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/services/bloc/currency/cubit.dart';
import 'package:taskBee/services/bloc/currency/states.dart';
import 'package:taskBee/services/bloc/exchang_category/cubit.dart';
import 'package:taskBee/services/bloc/transaction/cubit.dart';
import 'package:taskBee/services/bloc/transaction/states.dart';
import 'package:taskBee/services/bloc/wallet/cubit.dart';
import 'package:taskBee/widget/TransAction_Card_1.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RevenuesHome extends StatelessWidget {
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
            appBar: CustomAppBar(
                Image(
                  image: AssetImage('assets/homepage/dollar.png'),
                ),
                'Revenues'),
            body: ListView.builder(
              itemCount: transactionCubit.revenues!.length,
              itemBuilder: (BuildContext context, int index) {
                return BlocConsumer<CurrencyCubit, CurrencyStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return TransactionCard(
                        contact:
                            '${contactCubit.getContactName(contactId: transactionCubit.revenues![index].contactId)}',
                        datetime:
                            '${transactionCubit.revenues![index].transactionDate}',
                        iconExchange: Image.asset(
                            '${exchangeCubit.getExchangeIcon(exchangeId: transactionCubit.revenues![index].exchangeId)}'),
                        imageWallet: Image.asset(
                            '${walletCubit.getWalletIconFromId(walletId: transactionCubit.revenues![index].walletId)}'),
                        iconMoneyType: Image.asset(
                            '${walletCubit.getWalletIconFromId(walletId: transactionCubit.revenues![index].walletId)}'),
                        note:
                            '${transactionCubit.revenues![index].description}',
                        paidMoney: '${transactionCubit.revenues![index].paid}',
                        totalMoney:
                            '${transactionCubit.revenues![index].total}',
                        restMoney: '${transactionCubit.revenues![index].rest}',
                        deleteTransaction: () {
                          transactionCubit.deleteTransactionFromDatabase(
                              id: transactionCubit.revenues![index].id);
                        },
                        updateTransaction: () {
                          Navigator.of(context).pushNamed('/updateRevenue',
                              arguments: {
                                'transaction': transactionCubit.revenues![index]
                              });
                        },
                        titleExchange:
                            '${exchangeCubit.getExchangeName(exchangeId: transactionCubit.revenues![index].exchangeId)}',
                        walletType:
                            '${walletCubit.getWalletName(walletId: transactionCubit.revenues![index].walletId)}',
                        currency:
                            '${currencyCubit.getCurrencyOfWallet(currencyId: walletCubit.getWalletCurrencyId(walletId: transactionCubit.revenues![index].walletId))}');
                  },
                );
              },
            ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/addRevenue'),
            ));
      },
    );
  }
}
