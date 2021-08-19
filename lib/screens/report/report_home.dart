import 'package:financial/screens/report/report_search.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'all-transaction.dart';

class ReportHome extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => WalletCubit()..createDatabase(),
          ),
          BlocProvider(
            create: (BuildContext context) => CurrencyCubit()..createDatabase(),
          )
        ],

        child:Scaffold(
          appBar: CustomAppBar(
              Icon(Icons.wallet_giftcard),
              'Reports'),
          body: Center(
            child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.amberAccent,
                  child:CustomRaisdButton(
                      text: 'all transaction',
                      onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllTransaction())
                  ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  color: Colors.amberAccent,
                  child:CustomRaisdButton(
                    text: 'transaction by contact',
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReportSearch())
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )),
          ),
        )
    );
  }
}
