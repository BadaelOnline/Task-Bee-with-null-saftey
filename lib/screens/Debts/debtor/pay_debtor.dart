import 'package:taskBee/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/widget_container.dart';
import 'package:taskBee/widget/Debts/Text_debts_installment.dart';
import 'package:taskBee/widget/Debts/all_visibility_without_installment.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/date_time_widget.dart';
import 'package:taskBee/widget/note_when_you_add_transaction.dart';
import 'package:flutter/material.dart';

class Paydebtor extends StatelessWidget {
  const Paydebtor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController datetime = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        Container(
          child: Image(
            image: AssetImage('assets/homepage/qrood.png'),
          ),
        ),
        'Debts',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text_Installment_debts(
                label: 'Total',
                type: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              widget_Container(
                image: Image.asset(
                  'assets/homepage/wallet.png',
                  width: 40,
                  height: 40,
                ),
                text: 'Wallet',
                balanc: '',
                ontap: () => Navigator.of(context).pushNamed('/choosewallet'),
              ),
              SizedBox(
                height: 15,
              ),
              Note_when_you_add_transaction(),
              SizedBox(
                height: 20,
              ),
              DateTimeWidget(
                transactionDateController: datetime,
              ),
              SizedBox(
                height: 20,
              ),
              AllVisibility_Debts_without_installment()
            ],
          ),
        ),
      ),
    );
  }
}
