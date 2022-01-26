import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/services/bloc/contact/states.dart';
import 'package:taskBee/services/bloc/wallet/cubit.dart';
import 'package:taskBee/services/bloc/wallet/states.dart';
import 'package:taskBee/widget/Buttom_Incom_Pay/All_Visibility/all_visibiltiy_from_debtors.dart';
import 'package:taskBee/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/widget_container.dart';
import 'package:taskBee/widget/Buttom_Incom_Pay/custom_Text_Total.dart';
import 'package:flutter/material.dart';
import '../../custom_raisd_button.dart';
import '../../date_time_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../note_when_you_add_transaction.dart';

class FormDebtors extends StatefulWidget {
  const FormDebtors({Key? key}) : super(key: key);

  @override
  _FormDebtorsState createState() => _FormDebtorsState();
}

class _FormDebtorsState extends State<FormDebtors> {
  TextEditingController transactionDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double space1 = MediaQuery.of(context).size.height / 45;
    double space2 = MediaQuery.of(context).size.height / 25;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        child: ListView(
          children: [
            BlocConsumer<ContactCubit, ContactStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return widget_Container(
                  image: Image.asset(
                    'assets/homepage/person.png',
                    width: 40,
                    height: 40,
                  ),
                  text: ContactCubit.get(context).chosenContact != null
                      ? ContactCubit.get(context).chosenContact!.name
                      : "${getLang(context, "Contacts")}".toString(),
                  ontap: () =>
                      Navigator.of(context).pushNamed('/choosecontact'),
                );
              },
            ),
            SizedBox(
              height: space2,
            ),
            Custom_Text_Total(
              label: "${getLang(context, "Total")}".toString(),
            ),
            SizedBox(
              height: space2,
            ),
            BlocConsumer<WalletCubit, WalletStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return widget_Container(
                  image: Image.asset(
                    'assets/homepage/wallet.png',
                    width: 40,
                    height: 40,
                  ),
                  text: WalletCubit.get(context).chosenWallet != null
                      ? WalletCubit.get(context).chosenWallet!.name
                      : "${getLang(context, "Wallet")}".toString(),
                  ontap: () => Navigator.of(context).pushNamed('/choosewallet'),
                );
              },
            ),
            SizedBox(
              height: space1,
            ),
            Note_when_you_add_transaction(),
            SizedBox(
              height: space2,
            ),
            DateTimeWidget(
              transactionDateController: transactionDateController,
            ),
            SizedBox(
              height: space2,
            ),
            AllVisibility_Debtors(),
            SizedBox(
              height: space2,
            ),
            CustomRaisdButton(
              color: Colors.red,
              text: "${getLang(context, "Payy")}".toString(),
            ),
            SizedBox(
              height: space2,
            )
          ],
        ),
      ),
    );
  }
}
