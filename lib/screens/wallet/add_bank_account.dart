import 'package:financial/models/currency.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/custom_Text_Total.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'wallet_home.dart';
import 'wallets_list.dart';

// ignore: must_be_immutable
class AddBankAccount extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  int dropdownValue = 1;
  String image = 'assets/wallet/account.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bank Account Wallet'),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => WalletsList()));
          },
        ),
      ),
      body: BlocConsumer<WalletCubit, WalletStates>(
        listener: (context, state) {
          if (state is InsertWalletsToDatabaseState) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.all(15),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        image: DecorationImage(
                          alignment: Alignment.center,
                          scale: 8,

                          image: AssetImage(image),
                          // fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Bank Account',
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    CustomTextFormField(
                        label: 'Wallet\n name',
                        controller: nameController,
                        type: TextInputType.text,
                        onChange: (String value) {},
                        onSubmit: (String value) {},
                        onTap: () {}),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CustomTextFormField(
                              label: 'balance ',
                              controller: balanceController,
                              // prefix: Icons.account_balance,
                              type: TextInputType.number),
                        ),
                        BlocConsumer<CurrencyCubit, CurrencyStates>(
                          listener: (context, CurrencyStates state) {},
                          builder: (context, CurrencyStates state) {
                            var x = CurrencyCubit.get(context);
                            // ignore: unrelated_type_equality_checks
                            return Expanded(
                              flex: 1,
                              child: TextField(
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
                                    borderSide:
                                        BorderSide(color: Colors.amberAccent),
                                  ),
                                  prefixIcon: new DropdownButton<String>(
                                    underline: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.transparent))),
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
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (val) {},
                              checkColor: Colors.amber,
                            ),
                            Text('Hide Wallet'),
                          ],
                        ),
                        Text(
                            'The wallet and its balance will be hidden \n You can create any transactions even unhide'),
                      ],
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
            ),
          );
        },
      ),
    );
  }
}
