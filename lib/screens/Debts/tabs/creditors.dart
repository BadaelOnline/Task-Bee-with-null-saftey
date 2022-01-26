import 'package:financial/widget/Debts/Card_Creditor/card_in_home_creditor.dart';
import 'package:flutter/material.dart';

class Creditors extends StatelessWidget {
  const Creditors({Key? key}) : super(key: key);

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
                  '15000',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red[700]),
                ),
                Text('S.P')
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Card_Home_Creditor(
                contact: 'Basel Alsafadi',
                currency: 'S.P',
                totalMoney: '15000',
              ),
              Card_Home_Creditor(
                contact: 'Basel Alsafadi',
                currency: 'S.P',
                totalMoney: '15000',
              ),
              Card_Home_Creditor(
                contact: 'Basel Alsafadi',
                currency: 'S.P',
                totalMoney: '15000',
              ),
              Card_Home_Creditor(
                contact: 'Basel Alsafadi',
                currency: 'S.P',
                totalMoney: '15000',
              ),
              Card_Home_Creditor(
                contact: 'Basel Alsafadi',
                currency: 'S.P',
                totalMoney: '15000',
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
