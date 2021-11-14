import 'package:financial/common/applocal.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/All_Visibility.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/column_wallet_expancies_contact.dart';
import 'package:financial/widget/Buttom_Incom_Pay/custom_Text_Total.dart';
import 'package:financial/widget/date_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../custom_raisd_button.dart';
import '../../note_when_you_add_transaction.dart';
import '../custom_text_recive.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class FormExpencies_Income extends StatefulWidget {
  const FormExpencies_Income({Key? key}) : super(key: key);

  @override
  _FormExpencies_IncomeState createState() => _FormExpencies_IncomeState();
}

// ignore: camel_case_types
class _FormExpencies_IncomeState extends State<FormExpencies_Income> {
  TextEditingController totalController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController transactionDateController = TextEditingController();
  TextEditingController restController = TextEditingController();

  String? hint;

  @override
  Widget build(BuildContext context) {
    double space1 = MediaQuery.of(context).size.height / 45;
    double space2 = MediaQuery.of(context).size.height / 25;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        child: BlocConsumer<TransactionCubit, TransactionStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ListView(children: [
              Custom_Text_Total(
                label: "${getLang(context, "Total")}".toString(),
                controller: totalController,
                type: TextInputType.number,
                onChange: (string) {
                  setState(() {
                    hint = totalController.text;
                  });
                },
              ),
              SizedBox(
                height: space1,
              ),
              Custom_Text_recive(
                controller: paidController,
                hint: hint,
                label: "${getLang(context, "Recived")}".toString(),
                type: TextInputType.number,
              ),
              SizedBox(
                height: space2,
              ),
              Column_Wallet_Expancies_contact(
                cat: 'chooseRevenue',
              ),
              SizedBox(
                height: space1,
              ),
              Note_when_you_add_transaction(
                des: descriptionController,
              ),
              SizedBox(
                height: space2,
              ),
              DateTimeWidget(
                transactionDateController: transactionDateController,
              ),
              SizedBox(
                height: space2,
              ),
              AllVisibility(
                descriptionController: descriptionController,
              ),
              SizedBox(
                height: space2,
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
                    color: Color(0xff16c8b1),
                    onPressed: () {
                      int cId = ContactCubit.get(context).chosenContact!.id;
                      int eId = ExchangeCubit.get(context).chosenCategory!.id;
                      int wId = WalletCubit.get(context).chosenWallet!.id;
                      String walIcon =
                          WalletCubit.get(context).chosenWallet!.icon;
                      if (eId != null && wId != null && cId != null) {
                        TransactionCubit.get(context).insertToDatabase(
                          contactId: cId,
                          description: descriptionController.text,
                          exchangeId: eId,
                          paid: paidController.text,
                          rest:
                              '${int.parse(totalController.text) - int.parse(paidController.text)}',
                          total: totalController.text,
                          isIncome: 0,
                          transactionDate: transactionDateController.text == ''
                              ? transactionDateController.text == null
                                  ? DateFormat('yyyy-MM-dd hh:mm aaa')
                                      .format(DateTime.now())
                                  : DateFormat('yyyy-MM-dd hh:mm aaa')
                                      .format(DateTime.now())
                              : transactionDateController.text,
                          // '${date != null ? date : DateFormat('yyyy-MM-dd').format(dateTime)} ${time != null ? time : TimeOfDay(minute: timeOfDay.minute, hour: timeOfDay.hour).format(context)}',
                          walletId: wId,
                        );
                        String walletBalance = WalletCubit.get(context)
                            .getWalletBalance(
                                walletName: WalletCubit.get(context)
                                    .chosenWallet!
                                    .name);
                        int currencyId = WalletCubit.get(context)
                            .getWalletCurrency(
                                walletName: WalletCubit.get(context)
                                    .chosenWallet!
                                    .name);
                        int newBalance = int.parse(walletBalance) +
                            int.parse(totalController.text);
                        if (walletBalance != null && currencyId != null) {
                          WalletCubit.get(context).updateWalletDatabase(
                              icon: walIcon,
                              isId: wId,
                              walletName:
                                  WalletCubit.get(context).chosenWallet!.name,
                              walletBalance: '$newBalance',
                              currencyId: currencyId);
                        }
                      }
                    },
                    text: "${getLang(context, "Recive")}".toString(),
                  );
                },
              ),
              SizedBox(
                height: space2,
              )
            ]);
          },
        ),
      ),
    );
  }
}
