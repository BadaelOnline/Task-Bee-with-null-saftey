import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Wallet/card_wallet.dart';
import 'package:financial/widget/custom_alert_dialog.dart';
import 'package:financial/widget/custom_appBar.dart';
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
            appBar: CustomAppBar(
                Image(
                  image: AssetImage('assets/homepage/wallet.png'),
                ),
                'Add Wallet'),
            body: Stack(children: [
              ListView.builder(
                itemCount: cubit.wallets!.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      if (cubit.wallets![index].icon ==
                          'assets/wallet/dollar.png') {
                        Navigator.of(context)
                            .pushNamed('/updateCashWallet', arguments: {
                          'walletId': cubit.wallets![index].id,
                          'walletName': cubit.wallets![index].name,
                          'walletBalance': cubit.wallets![index].balance,
                          'currencyId': currencyCubit.getCurrencyOfWallet(
                              currencyId: cubit.wallets![index].currencyId),
                          'image': cubit.wallets![index].icon
                        });
                      } else if (cubit.wallets![index].icon ==
                          'assets/wallet/account.png') {
                        Navigator.of(context)
                            .pushNamed('/updateBankAccount', arguments: {
                          'walletId': cubit.wallets![index].id,
                          'walletName': cubit.wallets![index].name,
                          'walletBalance': cubit.wallets![index].balance,
                          'currencyId': currencyCubit.getCurrencyOfWallet(
                              currencyId: cubit.wallets![index].currencyId),
                          'image': cubit.wallets![index].icon
                        });
                      } else if (cubit.wallets![index].icon ==
                          'assets/wallet/card.png') {
                        Navigator.of(context)
                            .pushNamed('/updateCreditCard', arguments: {
                          'walletId': cubit.wallets![index].id,
                          'walletName': cubit.wallets![index].name,
                          'walletBalance': cubit.wallets![index].balance,
                          'currencyId': currencyCubit.getCurrencyOfWallet(
                              currencyId: cubit.wallets![index].currencyId),
                          'image': cubit.wallets![index].icon
                        });
                      } else if (cubit.wallets![index].icon ==
                          'assets/wallet/credit-cards.png') {
                        Navigator.of(context)
                            .pushNamed('/updatePriberdCard', arguments: {
                          'walletId': cubit.wallets![index].id,
                          'walletName': cubit.wallets![index].name,
                          'walletBalance': cubit.wallets![index].balance,
                          'currencyId': currencyCubit.getCurrencyOfWallet(
                              currencyId: cubit.wallets![index].currencyId),
                          'image': cubit.wallets![index].icon
                        });
                      } else if (cubit.wallets![index].icon ==
                          'assets/wallet/revenue.png') {
                        Navigator.of(context)
                            .pushNamed('/updatePlanerSave', arguments: {
                          'walletId': cubit.wallets![index].id,
                          'walletName': cubit.wallets![index].name,
                          'walletBalance': cubit.wallets![index].balance,
                          'currencyId': currencyCubit.getCurrencyOfWallet(
                              currencyId: cubit.wallets![index].currencyId),
                          'image': cubit.wallets![index].icon
                        });
                      }
                    },
                    child: BlocConsumer<CurrencyCubit, CurrencyStates>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 8),
                          child: Card_Wallet(
                            title: cubit.wallets![index].name,
                            image: cubit.wallets![index].icon == null
                                ? Image.asset(
                                    'assets/wallet/account.png',
                                    width: 35,
                                    height: 35,
                                  )
                                : Image.asset(
                                    cubit.wallets![index].icon,
                                    width: 30,
                                    height: 30,
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
              cubit.wallets!.length > 1
                  ? Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.03,
                      left: MediaQuery.of(context).size.height * 0.06,
                      right: MediaQuery.of(context).size.height * 0.06,
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed('/transferwallet'),
                            icon: Image.asset(
                              'assets/wallet/transfer.png',
                            ),
                            iconSize: 50,
                          ),
                          Text('Transfering Between Wallets')
                        ],
                      ),
                    )
                  : Text('')
            ]),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/walletsList'),
            ));
      },
    );
  }
}
