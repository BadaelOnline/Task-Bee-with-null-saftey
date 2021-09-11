import 'package:financial/screens/wallet/update_bank_account.dart';
import 'package:financial/screens/wallet/update_cash_Wallet.dart';
import 'package:financial/screens/wallet/update_credit_card.dart';
import 'package:financial/screens/wallet/update_planer_save.dart';
import 'package:financial/screens/wallet/update_priberd_card.dart';
import 'package:financial/screens/wallet/wallets_list.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/custom_alert_dialog.dart';
import 'package:financial/widget/custom_container_wallet.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WalletHome extends StatelessWidget {


  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletCubit, WalletStates>(
      listener: (BuildContext context, WalletStates state) {},
      builder: (BuildContext context, WalletStates state) {
        WalletCubit cubit = WalletCubit.get(context);
        CurrencyCubit currencyCubit = CurrencyCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text('My Wallet'),
              centerTitle: true,
              backgroundColor: Colors.amber[400],
            ),
            body: ListView.builder(
                  itemCount: cubit.wallets!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onDoubleTap: () {
                        if (cubit.wallets![index].icon ==
                            'assets/wallet/dollar.png') {
                          Navigator.of(context).pushNamed(
                              '/updateCashWallet',
                              arguments: {
                                'walletId': cubit.wallets![index].id,
                                'walletName' :cubit.wallets![index].name,
                                'walletBalance': cubit.wallets![index].balance,
                                'currencyId' :currencyCubit.getCurrencyOfWallet(currencyId: cubit.wallets![index].currencyId),
                                'image' :cubit.wallets![index].icon
                              }
                          );
                        } else if (cubit.wallets![index].icon ==
                            'assets/wallet/account.png') {
                          Navigator.of(context).pushNamed(
                              '/updateBankAccount',
                              arguments: {
                                'walletId': cubit.wallets![index].id,
                                'walletName' :cubit.wallets![index].name,
                                'walletBalance': cubit.wallets![index].balance,
                                'currencyId' :currencyCubit.getCurrencyOfWallet(currencyId: cubit.wallets![index].currencyId),
                                'image' :cubit.wallets![index].icon
                              }
                          );

                        } else if (cubit.wallets![index].icon ==
                            'assets/wallet/card.png') {
                          Navigator.of(context).pushNamed(
                              '/updateCreditCard',
                              arguments: {
                                'walletId': cubit.wallets![index].id,
                                'walletName' :cubit.wallets![index].name,
                                'walletBalance': cubit.wallets![index].balance,
                                'currencyId' :currencyCubit.getCurrencyOfWallet(currencyId: cubit.wallets![index].currencyId),
                                'image' :cubit.wallets![index].icon
                              }
                          );
                        } else if (cubit.wallets![index].icon ==
                            'assets/wallet/credit-cards.png') {
                          Navigator.of(context).pushNamed(
                              '/updatePriberdCard',
                              arguments: {
                                'walletId': cubit.wallets![index].id,
                                'walletName' :cubit.wallets![index].name,
                                'walletBalance': cubit.wallets![index].balance,
                                'currencyId' :currencyCubit.getCurrencyOfWallet(currencyId: cubit.wallets![index].currencyId),
                                'image' :cubit.wallets![index].icon
                              }
                          );
                        } else if (cubit.wallets![index].icon ==
                            'assets/wallet/revenue.png') {
                          Navigator.of(context).pushNamed(
                              '/updatePlanerSave',
                              arguments: {
                                'walletId': cubit.wallets![index].id,
                                'walletName' :cubit.wallets![index].name,
                                'walletBalance': cubit.wallets![index].balance,
                                'currencyId' :currencyCubit.getCurrencyOfWallet(currencyId: cubit.wallets![index].currencyId),
                                'image' :cubit.wallets![index].icon
                              }
                          );
                        }
                        // if (cubit.wallets![index].icon ==
                        //     'assets/wallet/dollar.png') {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (_) => UpdateWallet(
                        //             walletId: cubit.wallets![index].id,
                        //             walletName: cubit.wallets![index].name,
                        //             walletCurrencyId:
                        //                 currencyCubit.currencies![index].name,
                        //             walletbalance:
                        //                 cubit.wallets![index].balance,
                        //             image: cubit.wallets![index].icon,
                        //           )));
                        // } else if (cubit.wallets![index].icon ==
                        //     'assets/wallet/card.png') {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (_) => WalletsList()));
                        // }
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
                              image:cubit.wallets![index].icon == null ?AssetImage('assets/wallet/account.png'): AssetImage(cubit.wallets![index].icon),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
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
                      );
  },
),
                    );
                  },
                ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              text: 'add wallet',
              onPressed: () => Navigator.of(context).pushNamed('/walletsList'),
            ));
      },
    );
  }
}
