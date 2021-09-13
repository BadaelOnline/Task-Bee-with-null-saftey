import 'package:financial/models/currency.dart';
import 'package:financial/screens/wallet/wallet_home.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UpdateBankAccount extends StatelessWidget {
  int? walletId;
  String? walletName;
  String? walletCurrency;
  String? walletBalance;
  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  int dropdownValue = 1;

  int? isID;
  String? image = 'assets/wallet/account.png';

  UpdateBankAccount({Key? key}) : super(key: key);

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
        Icon(Icons.wallet_giftcard),
        'Add Wallet',
      ),
      body: BlocConsumer<WalletCubit, WalletStates>(
        listener: (context, state) {
          if (state is UpdateWalletsToDatabaseState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => WalletHome()));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      image: DecorationImage(
                        alignment: Alignment.center,
                        scale: 6,

                        image: AssetImage(image!),
                        // fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      // border: Border.all(
                      //   color: Colors.amber[400],
                      //   width: 2,
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                  SizedBox(
                    height: 30,
                  ),
                  Custom_Text(
                      label: 'Wallet\n name',
                      controller: nameController =
                          TextEditingController(text: '$walletName'),
                      type: TextInputType.text,
                      onChange: (String value) {},
                      onSubmit: (String value) {},
                      onTap: () {}),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Custom_Text(
                            label: 'balance ',
                            controller: balanceController =
                                TextEditingController(text: '$walletBalance'),
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
                              // onSubmitted: (value) => _childInfo(context),
                              textAlign: TextAlign.right,
                              readOnly: true,
                              controller: currencyController =
                                  TextEditingController(
                                      text: '$walletCurrency'),
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
                              //                        onSubmitted: (value) =>  Navigator.push(
                              //                            context,
                              //                            MaterialPageRoute(builder: (context) => ChildInfo(children[0]))) ,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalletHome()));
                      }
                    },
                    builder: (context, state) {
                      var x = CurrencyCubit.get(context).currencies;
                      return Column(
                        children: [
                          SizedBox(
                            height: 50,
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
                                            currencyName:
                                                currencyController.text));
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
