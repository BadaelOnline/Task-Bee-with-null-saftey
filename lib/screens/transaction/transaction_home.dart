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

import 'add_transaction.dart';

class TransactionHome extends StatelessWidget {
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
            appBar: CustomAppBar(Icon(Icons.wallet_giftcard), 'Transaction'),
            body: ListView.builder(
              itemCount: transactionCubit.transactions!.length,
              itemBuilder: (BuildContext context, int index) {
                return BlocConsumer<CurrencyCubit, CurrencyStates>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return TransactionCard(
                    contact: '${contactCubit.getContactName(contactId: transactionCubit.transactions![index].contactId)}',
                    datetime:
                    '${transactionCubit.transactions![index].transactionDate}',
                    iconExchange: Image.asset(
                        '${exchangeCubit.getExchangeIcon(exchangeId: transactionCubit.transactions![index].exchangeId)}'),
                    imageWallet:
                    Image.asset('${walletCubit.getWalletIconFromId(walletId:transactionCubit.transactions![index].walletId )}'),
                    iconMoneyType:
                    Image.asset('${walletCubit.getWalletIconFromId(walletId:transactionCubit.transactions![index].walletId )}'),
                    note:
                    '${transactionCubit.transactions![index].description}',
                    paidMoney:
                    '${transactionCubit.transactions![index].paid}',
                    totalMoney:
                    '${transactionCubit.transactions![index].total}',
                    restMoney:
                    '${transactionCubit.transactions![index].rest}',
                    deleteTransaction:() {
                          transactionCubit.deleteTransactionFromDatabase(
                              id: transactionCubit.transactions![index].id);
                        },
                    titleExchange:
                    '${exchangeCubit.getExchangeName(exchangeId: transactionCubit.transactions![index].exchangeId)}',
                    walletType: '${walletCubit.getWalletName(walletId: transactionCubit.transactions![index].walletId)}',
                    currency: '${currencyCubit.getCurrencyOfWallet(currencyId: walletCubit.getWalletCurrencyId(walletId: transactionCubit.transactions![index].walletId))}');
  },
);
              },
            ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddTransaction())),
            )
            );
      },
    );
  }

}