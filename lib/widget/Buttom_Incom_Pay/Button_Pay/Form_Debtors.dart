import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/all_visibiltiy_from_debtors.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/widget_container.dart';
import 'package:financial/widget/Buttom_Incom_Pay/custom_Text_Total.dart';
import 'package:flutter/material.dart';
import '../../custom_raisd_button.dart';
import '../../date_time_widget.dart';

class FormDebtors extends StatefulWidget {
  const FormDebtors({Key? key}) : super(key: key);

  @override
  _FormDebtorsState createState() => _FormDebtorsState();
}

class _FormDebtorsState extends State<FormDebtors> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Custom_Text_Total(
                label: 'Total',
              ),
              SizedBox(
                height: 15,
              ),
              widget_Container(
                image: Image.asset(
                  'assets/homepage/wallet.png',
                  width: 40,
                  height: 40,
                ),
                text: 'Wallet',
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
              ),
              SizedBox(
                height: 15,
              ),
              DateTimeWidget(),
              SizedBox(
                height: 15,
              ),
              AllVisibility_Debtors(),
              SizedBox(
                height: 15,
              ),
              CustomRaisdButton(
                text: 'Save',
              )
            ],
          ),
        ),
      ),
    );
  }
}
