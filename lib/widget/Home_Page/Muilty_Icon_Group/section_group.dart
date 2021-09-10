import 'package:flutter/material.dart';

import 'icon_text.dart';

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
                text: 'Debts',
                onTap: () => Navigator.of(context).pushNamed('/debtsHome')),
            Icon_Text(
              icon: Image.asset(
                'assets/homepage/person.png',
                height: duoble,
                width: duoble,
              ),
              text: 'Contacts',
              onTap: () => Navigator.of(context).pushNamed('/contactHome'),
            ),
            Icon_Text(
              icon: Image.asset(
                'assets/homepage/dollar.png',
                height: duoble,
                width: duoble,
              ),
              text: 'Revnue',
            ),
            Icon_Text(
              icon: Image.asset(
                'assets/homepage/masaref.png',
                height: duoble,
                width: duoble,
              ),
              text: 'Expensise',
              onTap: () => Navigator.of(context).pushNamed('/exchangeHome'),
            ),
            Icon_Text(
              icon: Image.asset(
                'assets/homepage/wallet.png',
                height: duoble,
                width: duoble,
              ),
              text: 'Wallets',
              onTap: () => Navigator.of(context).pushNamed('/walletHome'),
            ),
          ],
        ));
  }
}
