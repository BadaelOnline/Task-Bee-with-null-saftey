import 'package:financial/widget/Wallet/text_wallet_balance.dart';
import 'package:financial/widget/Wallet/transfer_wallet/all_visibility_wallets.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/date_time_widget.dart';
import 'package:flutter/material.dart';
import '../../../widget/Wallet/transfer_wallet/column_wallet.dart';

class Transfer_Wallet extends StatefulWidget {
  const Transfer_Wallet({Key? key}) : super(key: key);

  @override
  _Transfer_WalletState createState() => _Transfer_WalletState();
}

class _Transfer_WalletState extends State<Transfer_Wallet> {
  TextEditingController transactionDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image(
            image: AssetImage('assets/homepage/wallet.png'),
          ),
          'Wallets'),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    width: 35,
                    height: 35,
                    child: Image.asset(
                      'assets/wallet/transfer.png',
                    ),
                  ),
                ),
                Text('Transfering Between Wallets')
              ],
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            Column_Wallet(),
            SizedBox(
              height: 20,
            ),
            Text_Wallet_Balance(
              label: 'Amount',
            ),
            SizedBox(
              height: 20,
            ),
            DateTimeWidget(
              transactionDateController: transactionDateController,
            ),
            SizedBox(
              height: 20,
            ),
            AllVisibility_Wallets(),
            SizedBox(
              height: 15,
            ),
            CustomRaisdButton(
              text: 'Transfering',
            )
          ],
        ),
      ),
    );
  }
}
