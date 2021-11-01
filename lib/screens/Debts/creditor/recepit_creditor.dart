import 'package:financial/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/widget_container.dart';
import 'package:financial/widget/Debts/all_visibility_without_installment.dart';
import 'package:financial/widget/Wallet/text_wallet_balance.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/date_time_widget.dart';
import 'package:flutter/material.dart';

class Recepit_creditor extends StatelessWidget {
  const Recepit_creditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? date;
    String? time;
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
              Text_Wallet_Balance(
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
