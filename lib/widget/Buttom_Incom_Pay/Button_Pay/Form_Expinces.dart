import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/All_Visibility.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/column_wallet_expancies_contact.dart';
import 'package:financial/widget/Buttom_Incom_Pay/custom_Text_Total.dart';
import 'package:financial/widget/Buttom_Incom_Pay/custom_Text_pad.dart';
import 'package:financial/widget/date_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../custom_raisd_button.dart';

class FormExpencies extends StatefulWidget {
  const FormExpencies({Key? key}) : super(key: key);

  @override
  _FormExpenciesState createState() => _FormExpenciesState();
}

class _FormExpenciesState extends State<FormExpencies> {
  TextEditingController totalController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController transactionDateController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        child: BlocConsumer<TransactionCubit, TransactionStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(children: [
                Custom_Text_Total(
                    label: 'Total',
                    controller: totalController,
                    type: TextInputType.number),
                SizedBox(
                  height: 15,
                ),
                Custom_Text_Paid(
                  controller: paidController,
                  label: 'Paid',
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: 25,
                ),
                Column_Wallet_Expancies_contact(
                  cat: 'chooseexchang',
                ),
                SizedBox(
                  height: 25,
                ),
                DateTimeWidget(
                  transactionDateController: transactionDateController,
                ),
                SizedBox(
                  height: 25,
                ),
                AllVisibility(
                  descriptionController: descriptionController,
                ),
                SizedBox(
                  height: 15,
                ),
                BlocConsumer<WalletCubit, WalletStates>(
                  listener: (context, state) {
                    if (state is UpdateWalletsToDatabaseState) {
                      WalletCubit.get(context).chosenWallet = null;
                      ContactCubit.get(context).chosenContact = null;
                      ExchangeCubit.get(context).chosenCategory = null;
                      Navigator.of(context).pop();
                    }
                  },
                  builder: (context, state) {
                    return CustomRaisdButton(
                      onPressed: () {
                        int cId = ContactCubit.get(context).chosenContact!.id;
                        int eId = ExchangeCubit.get(context).chosenCategory!.id;
                        int wId = WalletCubit.get(context).chosenWallet!.id;
                        String walIcon =
                            WalletCubit.get(context).chosenWallet!.icon;
                        String walletBalance =
                            WalletCubit.get(context).chosenWallet!.balance;
                        int walBal = int.parse(walletBalance);
                        if (eId != null && wId != null && cId != null) {
                          if (int.parse(totalController.text) <= walBal) {
                            TransactionCubit.get(context).insertToDatabase(
                              contactId: cId,
                              description: descriptionController.text,
                              exchangeId: eId,
                              paid: paidController.text,
                              rest:
                                  '${int.parse(totalController.text) - int.parse(paidController.text)}',
                              total: totalController.text,
                              isIncome: 1,
                              transactionDate:
                                  transactionDateController.text == ''
                                      ? transactionDateController.text == null
                                          ? DateFormat('yyyy-MM-dd hh:mm aaa')
                                              .format(DateTime.now())
                                          : DateFormat('yyyy-MM-dd hh:mm aaa')
                                              .format(DateTime.now())
                                      : transactionDateController.text,
                              walletId: wId,
                            );
                            String walletBalance =
                                WalletCubit.get(context).chosenWallet!.balance;
                            int currencyId = WalletCubit.get(context)
                                .chosenWallet!
                                .currencyId;
                            int newBalance = int.parse(walletBalance) -
                                int.parse(totalController.text);
                            if (walletBalance != null && currencyId != null) {
                              WalletCubit.get(context).updateWalletDatabase(
                                  isId: wId,
                                  icon: walIcon,
                                  walletName: WalletCubit.get(context)
                                      .chosenWallet!
                                      .name,
                                  walletBalance: '$newBalance',
                                  currencyId: currencyId);
                            }
                          } else {
                            _showMyDialog(context);
                          }
                        }
                      },
                      text: 'Pay',
                    );
                  },
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('oops'),
        content: SingleChildScrollView(
          child: Text('sorry wallet balance less than total of transaction'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
