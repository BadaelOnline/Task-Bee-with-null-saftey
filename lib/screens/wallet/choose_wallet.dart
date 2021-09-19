import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/custom_alert_dialog.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_container_wallet.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseWallet extends StatefulWidget {
  const ChooseWallet({Key? key}) : super(key: key);

  @override
  _ChooseWalletState createState() => _ChooseWalletState();
}

class _ChooseWalletState extends State<ChooseWallet> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        WalletCubit cubit = WalletCubit.get(context);
        CurrencyCubit currencyCubit = CurrencyCubit.get(context);
        return Scaffold(
            appBar: CustomAppBar(
                Image(
                  image: AssetImage('assets/homepage/wallet.png'),
                ),
                'Choose Wallet'),
            body: ListView.builder(
              itemCount: cubit.wallets!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    print('////////////////////////////${cubit.wallets![index].name}');
                    cubit.choseWallet(wallet: cubit.wallets![index]) ;
                    Navigator.of(context).pop();
                  },
                  child: BlocConsumer<CurrencyCubit, CurrencyStates>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return CustomContainerWallet(
                        title: cubit.wallets![index].name,
                        circleAvatar: Container(
                          width: 45.0,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              scale: 0.5,
                              // ignore: unnecessary_null_comparison
                              image: cubit.wallets![index].icon == null
                                  ? AssetImage('assets/wallet/account.png')
                                  : AssetImage(cubit.wallets![index].icon),
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                          ),
                        ),
                        deleteMethod: () {
                          showDialog(
                            context: context,
                            builder: (_) =>
                                customAlertDialog(
                                  // title: 'Alart',
                                  content:
                                  'This wallet will be deleted along with all transactions made on it \n and delete associated debt transactions',
                                  cancelMethod: () {
                                    Navigator.of(context).pop();
                                  },
                                  submitMethod: () {
                                    cubit.deleteWalletFromDatabase(
                                        id: cubit.wallets![index].id);
                                    Navigator.of(context).pop();
                                  },
                                ),
                          );
                        },
                        transactionMethod: () {},
                        balance: cubit.wallets![index].balance,
                        currency: currencyCubit.getCurrencyOfWallet(
                            currencyId: cubit.wallets![index].currencyId),
                      );
                    },
                  ),
                );
              },
            ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/walletsList'),
            ));
      },
    );
  }
}
