import 'package:financial/widget/Wallet/container_list_wallet.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class WalletsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image(
            image: AssetImage('assets/homepage/wallet.png'),
          ),
          'Add Wallet'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/dollar.png'),
                  text: 'Cash',
                  ontap: () =>
                      Navigator.of(context).pushNamed('/addCashWallet'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/account.png'),
                  text: 'Bank Account',
                  ontap: () =>
                      Navigator.of(context).pushNamed('/addBankAccount'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/card.png'),
                  text: 'Credit Card',
                  ontap: () =>
                      Navigator.of(context).pushNamed('/addCreditCard'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/credit-cards.png'),
                  text: 'Prepaid Card',
                  ontap: () =>
                      Navigator.of(context).pushNamed('/addPrepaidCard'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/revenue.png'),
                  text: 'Planner Save',
                  ontap: () =>
                      Navigator.of(context).pushNamed('/addPlannerSave'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
