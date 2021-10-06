import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Wallet/Image_Text_Wallet/image_wallet.dart';
import 'package:financial/widget/Wallet/checkbox_wallet.dart';
import 'package:financial/widget/Wallet/text_wallet_currency.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Updatewallet extends StatelessWidget {
  int? walletId;
  String? walletName;
  String? walletCurrency;
  String? walletBalance;

  String? image = 'assets/wallet/dollar.png';

  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();

  Updatewallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    walletId = arguments['walletId'];
    walletName = arguments['walletName'];
    walletCurrency = arguments['currencyId'];
    walletBalance = arguments['walletBalance'];
    image = arguments['image'];
    return Scaffold(
      appBar: CustomAppBar(
          Image(
            image: AssetImage('assets/homepage/wallet.png'),
          ),
          'Update Wallet'),
      body: BlocConsumer<WalletCubit, WalletStates>(listener: (context, state) {
        if (state is UpdateWalletsToDatabaseState) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      }, builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(children: [
            Image_Wallet(
              image: image!,
              scale: 9.0,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Cash',
            ),
            SizedBox(
              height: 20,
            ),
            Custom_Text(
              label: 'Name',
              controller: nameController = TextEditingController(
                text: '$walletName',
              ),
              type: TextInputType.text,
            ),
            SizedBox(
              height: 20,
            ),
            Text_Wallet_Name(
              label: 'Balance',
              controller: balanceController =
                  TextEditingController(text: '$walletBalance'),
              type: TextInputType.number,
            ),
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
                return CustomRaisdButton(
                    text: 'Edit',
                    onPressed: () {
                      WalletCubit.get(context).updateWalletDatabase(
                          isId: walletId,
                          icon: image,
                          walletName: nameController.text,
                          walletBalance: balanceController.text,
                          currencyId:
                              CurrencyCubit.get(context).chosenCurrency!.id);
                    });
              },
            )
          ]),
        );
      }),
    );
  }
}
