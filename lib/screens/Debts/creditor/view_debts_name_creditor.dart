import 'package:taskBee/widget/Debts/Card_Creditor/card_in_view_contact.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class ViewDebts_Name_Creditor extends StatelessWidget {
  const ViewDebts_Name_Creditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
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
                      'Basel Alsafadi ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(Creditor)',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[500]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
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
                        '12000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[500]),
                      ),
                      Text('S.P')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card_In_ViewContact_Creditor(
                contact: 'anas',
                currency: 'S.P',
                datetime: '12/7/2021   12:00 PM',
                deleteTransaction: () {},
                note: 'For svu',
                updateTransaction: () {},
                paidMoney: '1200',
                walletType: 'Cash',
                iconMoneyType: Image.asset('assets/wallet/dollar.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
