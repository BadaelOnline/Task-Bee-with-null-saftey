import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/services/bloc/currency/cubit.dart';
import 'package:taskBee/services/bloc/currency/states.dart';
import 'package:taskBee/services/bloc/wallet/cubit.dart';
import 'package:taskBee/services/bloc/wallet/states.dart';
import 'package:taskBee/widget/Wallet/Image_Text_Wallet/image_wallet.dart';
import 'package:taskBee/widget/Wallet/Image_Text_Wallet/name_wallet.dart';
import 'package:taskBee/widget/Wallet/checkbox_wallet.dart';
import 'package:taskBee/widget/Wallet/raised_button_wallets.dart';
import 'package:taskBee/widget/Wallet/text_wallet_currency.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddCreditCard extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController limitController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController amountpaybaleController = TextEditingController();
  int dropdownValue = 1;
  String image = 'assets/wallet/card.png';

  @override
  Widget build(BuildContext context) {
    double space1 = MediaQuery.of(context).size.height / 35;
    return Scaffold(
      appBar: CustomAppBar(
        Image(
          image: AssetImage('assets/homepage/wallet.png'),
        ),
        "${getLang(context, "Add Wallet")}",
      ),
      body: BlocConsumer<WalletCubit, WalletStates>(
        listener: (context, state) {
          if (state is InsertWalletsToDatabaseState) {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.all(8),
            child: Column(children: [
              Image_Wallet(
                image: image,
                scale: 20.0,
              ),
              SizedBox(
                height: space1,
              ),
              Name_Wallet(
                name: "${getLang(context, "Credit Card")}",
              ),
              SizedBox(
                height: space1,
              ),
              Custom_Text(
                label: "${getLang(context, "Name")}",
                controller: nameController,
              ),
              SizedBox(
                height: space1,
              ),
              Text_Wallet_Name(
                label: "${getLang(context, "Total")}",
                controller: balanceController,
                type: TextInputType.number,
              ),
              SizedBox(
                height: space1,
              ),
              checkbox_wallet(),
              SizedBox(
                height: space1,
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
                      RaisedButtonWallets(
                          text: "${getLang(context, "Create")}",
                          onPressed: () {
                            WalletCubit.get(context).insertToDatabase(
                                icon: image,
                                walletName: nameController.text,
                                walletBalance: balanceController.text,
                                currencyId: CurrencyCubit.get(context)
                                    .chosenCurrency!
                                    .id);
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
