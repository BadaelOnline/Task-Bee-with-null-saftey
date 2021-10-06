import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/widget/TransAction_Card_1.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Preview_Transaction extends StatelessWidget {
  const Preview_Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionCubit, TransactionStates>(
      listener: (context, TransactionStates states) {},
      builder: (context, TransactionStates states) {
        TransactionCubit transactionCubit = TransactionCubit.get(context);
        // transactionCubit.getTransactionByContactFromDatabase(contactId: contactId);
        return Scaffold(
          appBar: CustomAppBar(Icon(Icons.wallet_giftcard), 'Reports'),
          body: Center(
            child: ListView.builder(
                itemCount: transactionCubit.transactionByContact!.length,
                itemBuilder: (BuildContext context, int index) {
                  return TransactionCard(
                    contact:transactionCubit.transactionByContact![index].contactName ,
                    currency: '${CurrencyCubit.get(context).getCurrencyOfWallet(currencyId: WalletCubit.get(context).getWalletCurrency(walletName: transactionCubit.transactionByContact![index].walletName))}',
                    datetime: transactionCubit.transactionByContact![index].transactionDate,
                    iconExchange: Image.asset(
                        '${ExchangeCubit.get(context).getExchangeIcon(exchangeId: ExchangeCubit.get(context).getExchangeId(exchangeName: transactionCubit.transactionByContact![index].exchangeCategoryName))}'),
                    iconMoneyType: Image.asset(
                        '${WalletCubit.get(context).getWalletIcon(walletName: transactionCubit.transactionByContact![index].walletName)}'),
                    imageWallet: Image.asset(
                        '${WalletCubit.get(context).getWalletIcon(walletName: transactionCubit.transactionByContact![index].walletName)}'),
                    note: transactionCubit.transactionByContact![index].transactionDescription,
                    paidMoney:transactionCubit.transactionByContact![index].transactionPaid ,
                    restMoney: transactionCubit.transactionByContact![index].transactionRest,
                    titleExchange: transactionCubit.transactionByContact![index].exchangeCategoryName,
                    totalMoney: transactionCubit.transactionByContact![index].transactionTotal,
                    walletType: transactionCubit.transactionByContact![index].walletName,
                  );
                }),
          ),
        );
      },
    );
  }
}
