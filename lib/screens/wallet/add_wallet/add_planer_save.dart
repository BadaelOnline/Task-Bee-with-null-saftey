import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/image_wallet.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/name_wallet.dart';
import 'package:financial/widget/Wallet/checkbox_wallet.dart';
import 'package:financial/widget/Wallet/text_wallet_balance.dart';
import 'package:financial/widget/Wallet/text_wallet_name.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddPlannerSave extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController ammountController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  int dropdownValue = 1;
  String image = 'assets/wallet/revenue.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image(
            image: AssetImage('assets/homepage/wallet.png'),
          ),
          'Add Wallet'),
      body: BlocConsumer<WalletCubit, WalletStates>(
        listener: (context, state) {
          if (state is InsertWalletsToDatabaseState) {
            Navigator.of(context).popAndPushNamed('/walletHome');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.all(15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image_Wallet(
                    image: image,
                    scale: 25,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Name_Wallet(
                    name: 'Planner Save',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text_Wallet_Name(
                      label: 'Name',
                      controller: nameController,
                      namecurrency: 'S.P'),
                  SizedBox(
                    height: 20,
                  ),
                  Text_Wallet_Balance(
                      label: 'Planner\nAmount',
                      controller: ammountController,
                      namecurrency: 'S.P'),
                  SizedBox(
                    height: 20,
                  ),
                  Text_Wallet_Balance(
                      label: 'Primary\nBalance',
                      controller: balanceController,
                      namecurrency: 'S.P'),
                  SizedBox(
                    height: 20,
                  ),
                  checkbox_wallet(),
                  SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<CurrencyCubit, CurrencyStates>(
                    listener: (context, state) {
                      if (state is InsertCurrenciesToDatabaseState) {
                        Navigator.of(context).popAndPushNamed('/walletHome');
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          CustomRaisdButton(
                              text: 'save',
                              onPressed: () {
                                WalletCubit.get(context).insertToDatabase(
                                    icon: image,
                                    walletName: nameController.text,
                                    walletBalance: balanceController.text,
                                    currencyId: CurrencyCubit.get(context)
                                        .getCurrencyId(
                                            currencyName:
                                                currencyController.text));
                              }),
                        ],
                      );
                    },
                  )
                ]),
          );
        },
      ),
    );
  }
}
