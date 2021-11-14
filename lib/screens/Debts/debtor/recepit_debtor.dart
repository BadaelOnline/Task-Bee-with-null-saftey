import 'package:financial/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/widget_container.dart';
import 'package:financial/widget/Debts/Text_debts_installment.dart';
import 'package:financial/widget/Debts/all_visibility_without_installment.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/date_time_widget.dart';
import 'package:financial/widget/note_when_you_add_transaction.dart';
import 'package:flutter/material.dart';

class Recepitdebtor extends StatelessWidget {
  const Recepitdebtor({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 45,
                      child: Image.asset('assets/contact/contact.png')),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Adham Adwan ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(Debtor)',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[500]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Debt :'),
                      Text(
                        '1000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[500]),
                      ),
                      Text('USD')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
