import 'package:financial/common/applocal.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/image_wallet.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/name_wallet.dart';
import 'package:financial/widget/Wallet/checkbox_wallet.dart';
import 'package:financial/widget/Wallet/date_saveplan.dart';
import 'package:financial/widget/Wallet/raised_button_wallets.dart';
import 'package:financial/widget/Wallet/text_wallet_balance.dart';
import 'package:financial/widget/Wallet/text_wallet_currency.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddPlannerSave extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController ammountController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController startdate = TextEditingController();
  TextEditingController endtdate = TextEditingController();
  int dropdownValue = 1;
  String image = 'assets/wallet/revenue.png';

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
                scale: 25,
              ),
              SizedBox(
                height: space1,
              ),
              Name_Wallet(
                name: "${getLang(context, "Saving Wallet")}",
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
                label: "${getLang(context, "Planner Amount")}",
                controller: ammountController,
                type: TextInputType.number,
              ),
              SizedBox(
                height: space1,
              ),
              Text_Wallet_Balance(
                  label: "${getLang(context, "Primary Balance")}",
                  controller: balanceController,
                  type: TextInputType.number,
                  namecurrency: 'S.P'),
              SizedBox(
                height: space1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateWidget_Saveplan(
                    text: "${getLang(context, "Start Date")}",
                    image: Image.asset('assets/wallet/calendar.png'),
                    transactionDateController: startdate,
                  ),
                  DateWidget_Saveplan(
                    text: "${getLang(context, "End Date")}",
                    image: Image.asset('assets/wallet/calendar_saveplan.png'),
                    transactionDateController: endtdate,
                  ),
                ],
              ),
              SizedBox(
                height: space1 * 2,
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
