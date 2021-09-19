import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/all_visibiltiy_from_debtors.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/widget_container.dart';
import 'package:financial/widget/Buttom_Incom_Pay/custom_text_recive.dart';
import 'package:flutter/material.dart';

import '../../custom_raisd_button.dart';
import '../../date_time_widget.dart';

// ignore: camel_case_types
class FormDebtors_Income extends StatefulWidget {
  const FormDebtors_Income({Key? key}) : super(key: key);

  @override
  _FormDebtors_IncomeState createState() => _FormDebtors_IncomeState();
}

// ignore: camel_case_types
class _FormDebtors_IncomeState extends State<FormDebtors_Income> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Custom_Text_recive(
                label: 'Total',
              ),
              SizedBox(
                height: 25,
              ),
              widget_Container(
                image: Image.asset(
                  'assets/homepage/wallet.png',
                  width: 40,
                  height: 40,
                ),
                text: 'Wallet',
                ontap: () => Navigator.of(context).pushNamed('/choosewallet'),
              ),
              SizedBox(
                height: 15,
              ),
              widget_Container(
                image: Image.asset(
                  'assets/homepage/person.png',
                  width: 40,
                  height: 40,
                ),
                text: 'Contact',
                ontap: () => Navigator.of(context).pushNamed('/choosecontact'),
              ),
              SizedBox(
                height: 25,
              ),
              DateTimeWidget(),
              SizedBox(
                height: 25,
              ),
              AllVisibility_Debtors(),
              SizedBox(
                height: 15,
              ),
              CustomRaisdButton(
                text: 'Recive',
              )
            ],
          ),
        ),
      ),
    );
  }
}
