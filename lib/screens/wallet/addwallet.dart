import 'package:financial/models/currency.dart';
import 'package:financial/screens/shared/myhomepage.dart';
import 'package:financial/screens/wallet/wallet_home.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddWallet extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  int dropdownValue = 1;
  String image = 'assets/wallet/dollar.png';

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
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return ListView(children: [
            SizedBox(
              height: 50,
            ),
            CustomTextFormField(
                label: 'Wallet',
                controller: nameController,
                prefix: Icons.wallet_giftcard,
                type: TextInputType.text,
                onChange: (String value) {},
                onSubmit: (String value) {},
                onTap: () {}),
            SizedBox(
              height: 50,
            ),
            CustomTextFormField(
                label: 'balance',
                controller: balanceController,
                prefix: Icons.account_balance,
                onChange: (String value) {},
                onSubmit: (String value) {},
                type: TextInputType.number),
            SizedBox(
              height: 50,
            ),
            BlocConsumer<CurrencyCubit, CurrencyStates>(
              listener: (context, CurrencyStates state) {},
              builder: (context, CurrencyStates state) {
                var x = CurrencyCubit.get(context);
                // ignore: unrelated_type_equality_checks
                return TextField(
                  textAlign: TextAlign.right,
                  readOnly: true,
                  controller: currencyController,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.amberAccent,
                  ),
                  cursorColor: Colors.amberAccent,
                  decoration: InputDecoration(
                    labelStyle: new TextStyle(
                      color: Colors.amberAccent,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.amberAccent, width: 1.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent),
                    ),
                    prefixIcon: new DropdownButton<String>(
                      underline: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.transparent))),
                      ),
                      icon: new Icon(Icons.keyboard_arrow_down),
                      items: x.currencies!.map((Currency value) {
                        return new DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        currencyController.text = value!;
                      },
                    ),
                    hintText: 'Currency',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    hoverColor: Colors.amberAccent,
                    focusColor: Colors.amberAccent,
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            BlocConsumer<CurrencyCubit, CurrencyStates>(
              listener: (context, state) {
                if (state is InsertCurrenciesToDatabaseState) {
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    // ignore: deprecated_member_use
                    FlatButton(
                        child: Text('save'),
                        onPressed: () {
                          WalletCubit.get(context).insertToDatabase(
                              walletName: nameController.text,
                              walletBalance: balanceController.text,
                              icon: image,
                              currencyId: CurrencyCubit.get(context)
                                  .getCurrencyId(
                                      currencyName: currencyController.text));
                        }),
                  ],
                );
              },
            )
          ]);
        },
      ),
    );
  }
}
