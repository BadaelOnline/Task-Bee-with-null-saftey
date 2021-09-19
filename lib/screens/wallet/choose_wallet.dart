import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

class ChooseWallet extends StatefulWidget {
  const ChooseWallet({Key? key}) : super(key: key);

  @override
  _ChooseWalletState createState() => _ChooseWalletState();
}

class _ChooseWalletState extends State<ChooseWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            Image(
              image: AssetImage('assets/homepage/wallet.png'),
            ),
            'Choose Wallet'),
        body: Container(
          child: Center(
            child: Text('Soon..'),
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed('/walletsList'),
        ));
  }
}
