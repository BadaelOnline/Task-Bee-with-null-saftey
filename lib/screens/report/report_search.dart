import 'package:financial/models/contact.dart';
import 'package:financial/models/exchange_category.dart';
import 'package:financial/models/wallet.dart';
import 'package:financial/screens/report/report_search_result.dart';
import 'package:financial/screens/transaction/transaction_home.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/exchang_category/states.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ReportSearch extends StatelessWidget {
  TextEditingController contactIdController = TextEditingController();
  TextEditingController walletIdController = TextEditingController();
  TextEditingController exchangeIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(Icon(Icons.wallet_giftcard), 'Transaction By Contact'),
      body: BlocConsumer<TransactionCubit, TransactionStates>(
        listener: (context, state) {
          if (state is InsertTransactionsToDatabaseState) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => TransactionHome()));
          }
        },
        builder: (context, state) {
          return ListView(children: [
            SizedBox(
              height: 50,
            ),
            BlocConsumer<ContactCubit, ContactStates>(
              listener: (context, ContactStates state) {},
              builder: (context, ContactStates state) {
                var x = ContactCubit.get(context);
                // ignore: unrelated_type_equality_checks
                return TextField(
                  // onSubmitted: (value) => _childInfo(context),
                  textAlign: TextAlign.right,
                  readOnly: true,
                  controller: contactIdController,
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
                                bottom:
                                    BorderSide(color: Colors.transparent))),
                      ),
                      icon: new Icon(Icons.keyboard_arrow_down),
                      items: x.contacts!.map((Contact value) {
                        return new DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        contactIdController.text = value!;
                      },
                    ),
                    hintText: 'chose a Contact',
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
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<WalletCubit, WalletStates>(
              listener: (context, WalletStates state) {},
              builder: (context, WalletStates state) {
                var x = WalletCubit.get(context);
                // ignore: unrelated_type_equality_checks
                return TextField(
                  // onSubmitted: (value) => _childInfo(context),
                  textAlign: TextAlign.right,
                  readOnly: true,
                  controller: walletIdController,
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
                                bottom:
                                    BorderSide(color: Colors.transparent))),
                      ),
                      icon: new Icon(Icons.keyboard_arrow_down),
                      items: x.wallets!.map((Wallet value) {
                        return new DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        walletIdController.text = value!;
                      },
                    ),
                    hintText: 'Wallet',
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
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<ExchangeCubit, ExchangeStates>(
              listener: (context, ExchangeStates state) {},
              builder: (context, ExchangeStates state) {
                var x = ExchangeCubit.get(context);
                // ignore: unrelated_type_equality_checks
                return TextField(
                  // onSubmitted: (value) => _childInfo(context),
                  textAlign: TextAlign.right,
                  readOnly: true,
                  controller: exchangeIdController,
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
                                bottom:
                                    BorderSide(color: Colors.transparent))),
                      ),
                      icon: new Icon(Icons.keyboard_arrow_down),
                      items: x.exchanges!.map((ExchangeCategory value) {
                        return new DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        exchangeIdController.text = value!;
                      },
                    ),
                    hintText: 'Exchange Category',
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
                );
              },
            ),
            BlocConsumer<ContactCubit, ContactStates>(
              listener: (context, ContactStates states) {},
              builder: (context, ContactStates states) {
                return FlatButton(
                    child: Text('save'),
                    onPressed: () {
                      TransactionCubit.get(context)
                          .getTransactionByContactFromDatabase(
                              contactId: ContactCubit.get(context)
                                  .getContactId(
                                      contactName: contactIdController.text),
                              walletId: WalletCubit.get(context).getWalletId(
                                  walletName: walletIdController.text),
                              categoryId: ExchangeCubit.get(context)
                                  .getExchangeId(
                                      exchangeName:
                                          exchangeIdController.text));
                      int? x = ContactCubit.get(context).getContactId(
                          contactName: contactIdController.text);
                      int? y = WalletCubit.get(context)
                          .getWalletId(walletName: walletIdController.text);
                      int? z = ExchangeCubit.get(context).getExchangeId(
                          exchangeName: exchangeIdController.text);
                      print('************************************* $x **** $y **** $z');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReportSearchResult(
                                    contactId: x,
                                    walletId: y,
                                    categoryId: z,
                                  )));
                    });
              },
            )
          ]);
        },
      ),
    );
  }
}
