import 'package:taskBee/services/bloc/currency/cubit.dart';
import 'package:taskBee/services/bloc/transaction/cubit.dart';
import 'package:taskBee/services/bloc/transaction/states.dart';
import 'package:taskBee/services/bloc/wallet/cubit.dart';
import 'package:taskBee/widget/TransAction_Card_1.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTransaction extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => WalletCubit()..createDatabase(),
          ),
          BlocProvider(
            create: (BuildContext context) => TransactionCubit()..createDatabase(),
          ),
          BlocProvider(
            create: (BuildContext context) => CurrencyCubit()..createDatabase(),
          )
        ],

        child:BlocConsumer<TransactionCubit,TransactionStates>(
          listener: (context,TransactionStates states){},
          builder: (context,TransactionStates states){
            TransactionCubit transactionCubit = TransactionCubit.get(context);
            return Scaffold(
              appBar: CustomAppBar(
                  Icon(Icons.wallet_giftcard),
                  'Reports'),
              body: Center(
                child: ListView.builder(
                    itemCount: transactionCubit.reports!.length,
                    itemBuilder: (BuildContext context, int index){
                      return TransactionCard(

                      );
                    }
                ),
              ),
            );
          },
        )
    );
  }
}
