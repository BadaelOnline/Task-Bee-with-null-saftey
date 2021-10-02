import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/custom_alert_dialog.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/Wallet/card_choose_wallet.dart';
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
                  onTap: () {
                    print(
                        '////////////////////////////${cubit.wallets![index].name}');
                    cubit.choseWallet(wallet: cubit.wallets![index]);
                    Navigator.of(context).pop();
                  },
                  child: BlocConsumer<CurrencyCubit, CurrencyStates>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(right: 15, left: 15, top: 8),
                        child: Card_Choose_Wallet(
                          title: cubit.wallets![index].name,
                          image: cubit.wallets![index].icon == null
                              ? Image.asset(
                                  'assets/wallet/account.png',
                                  height: 35,
                                  width: 35,
                                )
                              : Image.asset(
                                  cubit.wallets![index].icon,
                                  height: 35,
                                  width: 35,
                                ),
                          deleteMethod: () {
                            showDialog(
                              context: context,
                              builder: (_) => customAlertDialog(
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
                        ),
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
