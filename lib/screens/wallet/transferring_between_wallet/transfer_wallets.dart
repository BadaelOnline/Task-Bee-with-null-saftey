import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/widget/Wallet/raised_button_wallets.dart';
import 'package:taskBee/widget/Wallet/text_wallet_balance.dart';
import 'package:taskBee/widget/Wallet/transfer_wallet/all_visibility_wallets.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_raisd_button.dart';
import 'package:taskBee/widget/date_time_widget.dart';
import 'package:taskBee/widget/note_when_you_add_transaction.dart';
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
        // "${getLang(context, "Wallets")}",
        "${getLang(context, "Transfering Between Wallets")}",
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Column_Wallet(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Text_Wallet_Balance(
              label: "${getLang(context, "Total")}",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            Note_when_you_add_transaction(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            DateTimeWidget(
              transactionDateController: transactionDateController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            AllVisibility_Wallets(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 35,
            ),
            RaisedButtonWallets(
              text: "${getLang(context, "Transfer")}",
            )
          ],
        ),
      ),
    );
  }
}
