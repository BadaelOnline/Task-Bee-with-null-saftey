import 'package:taskBee/common/constant/constants.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/services/bloc/contact/states.dart';
import 'package:taskBee/services/bloc/currency/cubit.dart';
import 'package:taskBee/services/bloc/currency/states.dart';
import 'package:taskBee/services/bloc/exchang_category/cubit.dart';
import 'package:taskBee/services/bloc/exchang_category/states.dart';
import 'package:taskBee/services/bloc/transaction/cubit.dart';
import 'package:taskBee/services/bloc/transaction/states.dart';
import 'package:taskBee/services/bloc/wallet/cubit.dart';
import 'package:taskBee/services/bloc/wallet/states.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_raisd_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Icon(Icons.wallet_giftcard), 'taskBee'),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocConsumer<WalletCubit, WalletStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.amberAccent,
                  child: CustomRaisdButton(
                      text: 'Wallet',
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/walletHome')),
                );
              },
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            BlocConsumer<CurrencyCubit, CurrencyStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.amberAccent,
                  child: CustomRaisdButton(
                      text: 'Currency',
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/currencyHome')),
                );
              },
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            BlocConsumer<ExchangeCubit, ExchangeStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.amberAccent,
                  child: CustomRaisdButton(
                      text: 'Exchange',
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/exchangeHome')),
                  // TextButton(
                  //     onPressed: () => Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => ExchangeHome())),
                  //     child: Text('Exchange')),
                );
              },
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            BlocConsumer<ContactCubit, ContactStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.amberAccent,
                  child: CustomRaisdButton(
                      text: 'Contact',
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/contactHome')),
                  // TextButton(
                  //     onPressed: () => Navigator.push(context,
                  //         MaterialPageRoute(builder: (context) => CurrencyHome())),
                  //     child: Text('Currency')),
                );
              },
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.6,
            //   color: Colors.amberAccent,
            //   child: CustomRaisdButton(
            //       text: 'Transaction',
            //       onPressed: () => Navigator.of(context).pushNamed('/transactionHome')),
            // ),
            // SizedBox(
            //   height: kDefaultPadding / 2,
            // ),
            BlocConsumer<TransactionCubit, TransactionStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.amberAccent,
                  child: CustomRaisdButton(
                      text: 'expenses',
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/expensesHome')),
                );
              },
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.amberAccent,
              child: CustomRaisdButton(
                  text: 'revenues',
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/revenuesHome')),
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.amberAccent,
              child: CustomRaisdButton(
                  text: 'Reports',
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/reportSearch')),
              // TextButton(
              //     onPressed: () => Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => TransactionHome())),
              //     child: Text('Transaction')),
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              color: Colors.amberAccent,
              child: CustomRaisdButton(
                  text: 'debts',
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/debtsHome')),
            ),
          ],
        )),
      ),
    );
  }
}
