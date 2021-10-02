import 'package:financial/models/currency.dart';
import 'package:financial/screens/wallet/wallet_home.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/image_wallet.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/name_wallet.dart';
import 'package:financial/widget/Wallet/checkbox_wallet.dart';
import 'package:financial/widget/Wallet/text_wallet_balance.dart';
import 'package:financial/widget/Wallet/text_wallet_currency.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/custom_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCreditCard extends StatelessWidget {
  int? walletId;
  String? walletName;
  String? walletCurrency;
  String? walletBalance;
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController limitController = TextEditingController();
  TextEditingController amountpaybaleController = TextEditingController();

  int dropdownValue = 1;

  int? isID;
  String? image = 'assets/wallet/card.png';

  UpdateCreditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    walletId = arguments['walletId'];
    walletName = arguments['walletName'];
    walletCurrency = arguments['currencyId'];
    walletBalance = arguments['walletBalance'];
    image = arguments['image'];
    return Scaffold(
      appBar: CustomAppBar(Icon(Icons.wallet_giftcard), 'Add Wallet'),
      body: BlocConsumer<WalletCubit, WalletStates>(
        listener: (context, state) {
          if (state is UpdateWalletsToDatabaseState) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Image_Wallet(
                image: image!,
                scale: 20.0,
              ),
              SizedBox(
                height: 20,
              ),
              Name_Wallet(
                name: 'Credit Card',
              ),
              SizedBox(
                height: 20,
              ),
              Custom_Text(
                label: 'Name',
                controller: nameController =
                    TextEditingController(text: '$walletName'),
                type: TextInputType.text,
              ),
              SizedBox(
                height: 20,
              ),
              Text_Wallet_Name(
                label: 'Available\n Balance',
                controller: balanceController =
                    TextEditingController(text: '$walletBalance'),
                type: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              Text_Wallet_Balance(
                  label: 'Credit\n limit',
                  controller: limitController =
                      TextEditingController(text: '$walletBalance'),
                  namecurrency: 'S.P',
                  type: TextInputType.number),
              SizedBox(
                height: 20,
              ),
              Text_Wallet_Balance(
                  label: 'Amount\n payable',
                  controller: amountpaybaleController,
                  namecurrency: 'S.P',
                  type: TextInputType.number),
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => WalletHome()));
                  }
                },
                builder: (context, state) {
                  var x = CurrencyCubit.get(context).currencies;
                  return Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CustomRaisdButton(
                          text: 'Edit',
                          onPressed: () {
                            WalletCubit.get(context).updateWalletDatabase(
                                isId: walletId,
                                icon: image,
                                walletName: nameController.text,
                                walletBalance: balanceController.text,
                                currencyId: CurrencyCubit.get(context)
                                    .getCurrencyId(
                                        currencyName: currencyController.text));
                            // CurrencyCubit.get(context).insertToDatabase(
                            //     isId: isID,
                            //     basselName: currencyController.text,
                            //     ownerId:WalletCubit.get(context).lastId != null?  WalletCubit.get(context).lastId + 1 : 1);
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
