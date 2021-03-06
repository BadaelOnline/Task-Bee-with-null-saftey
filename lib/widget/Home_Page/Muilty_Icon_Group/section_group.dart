import 'package:taskBee/common/applocal.dart';
import 'package:flutter/material.dart';

import 'icon_text.dart';

// ignore: camel_case_types
class Section_Group extends StatelessWidget {
  const Section_Group({
    Key? key,
  }) : super(key: key);

  final duoble = 40.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon_Text(
                icon: Image.asset(
                  'assets/homepage/qrood.png',
                  height: duoble,
                  width: duoble,
                ),
                text: "${getLang(context, "Debts")}",
                onTap: () => Navigator.of(context).pushNamed('/debtsHome')),
            Icon_Text(
              icon: Image.asset(
                'assets/homepage/person.png',
                height: duoble,
                width: duoble,
              ),
              text: "${getLang(context, "Contact")}",
              onTap: () => Navigator.of(context).pushNamed('/contactHome'),
            ),
            Icon_Text(
              icon: Image.asset(
                'assets/homepage/dollar.png',
                height: duoble,
                width: duoble,
              ),
              text: "${getLang(context, "Revnue")}",
              onTap: () =>
                  Navigator.of(context).pushNamed('/revenueCategoryHome'),
            ),
            Icon_Text(
              icon: Image.asset(
                'assets/homepage/masaref.png',
                height: duoble,
                width: duoble,
              ),
              text: "${getLang(context, "Expensise")}",
              onTap: () => Navigator.of(context).pushNamed('/exchangeHome'),
            ),
            Icon_Text(
              icon: Image.asset(
                'assets/homepage/wallet.png',
                height: duoble,
                width: duoble,
              ),
              text: "${getLang(context, "Wallets")}",
              onTap: () => Navigator.of(context).pushNamed('/walletHome'),
            ),
          ],
        ));
  }
}
