import 'package:financial/widget/Debts/Card_Debtor/card_in_home_debtor.dart';

import 'package:flutter/material.dart';

class Debtors extends StatelessWidget {
  const Debtors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: MediaQuery.of(context).size.height * 0.01,
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[200],
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 30, top: 5, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Debt :'),
                Text(
                  '1000',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green[500]),
                ),
                Text('USD')
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 55),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card_Home_Debtor(
                contact: 'Adham Adwan',
                totalMoney: '1000',
                currency: 'USD',
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
