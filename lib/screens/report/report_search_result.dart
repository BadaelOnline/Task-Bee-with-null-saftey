import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';

import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportSearchResult extends StatelessWidget {
  final int? contactId;
  final int? walletId;
  final int? categoryId;

  const ReportSearchResult(
      {Key? key, this.contactId, this.walletId, this.categoryId})
      : super(key: key);

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
                  return ReportItem(
                      report: transactionCubit.transactionByContact![index]);
                }),
          ),
        );
      },
    );
  }
}
