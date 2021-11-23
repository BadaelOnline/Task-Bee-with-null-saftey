import 'package:financial/common/applocal.dart';
import 'package:financial/widget/Wallet/container_list_wallet.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class WalletsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double space = MediaQuery.of(context).size.height / 60;
    return Scaffold(
      appBar: CustomAppBar(
        Image(
          image: AssetImage('assets/homepage/wallet.png'),
        ),
        "${getLang(context, "Add Wallet")}",
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/dollar.png'),
                  text: "${getLang(context, "Cash")}",
                  ontap: () =>
                      Navigator.of(context).pushNamed('/addCashWallet'),
                ),
                SizedBox(
                  height: space,
                ),
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/account.png'),
                  text: "${getLang(context, "Bank Account")}",
                  ontap: () =>
                      Navigator.of(context).pushNamed('/addBankAccount'),
                ),
                SizedBox(
                  height: space,
                ),
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/card.png'),
                  text: "${getLang(context, "Credit Card")}",
                  ontap: () =>
                      Navigator.of(context).pushNamed('/addCreditCard'),
                ),
                SizedBox(
                  height: space,
                ),
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/credit-cards.png'),
                  text: "${getLang(context, "Prepaid Card")}",
                  ontap: () =>
                      Navigator.of(context).pushNamed('/addPrepaidCard'),
                ),
                SizedBox(
                  height: space,
                ),
                Container_List_Wallet(
                  image: Image.asset('assets/wallet/revenue.png'),
                  text: "${getLang(context, "Saving Wallet")}",
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
