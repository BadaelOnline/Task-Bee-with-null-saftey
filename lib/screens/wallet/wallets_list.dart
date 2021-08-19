import 'package:flutter/material.dart';
import 'add_bank_account.dart';
import 'add_cash_wallet.dart';
import 'add_credit_card.dart';
import 'add_planer_save.dart';
import 'add_priberd_card.dart';
import 'wallet_home.dart';

class WalletsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Wallet'),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/addCashWallet'),
                color: Colors.white,
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/dollar.png'),
                    ),
                  ),
                  title: Text(
                    'CASH',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/addBankAccount'),
                color: Colors.white,
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/account.png'),
                    ),
                  ),
                  title: Text(
                    'Bank Account',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/addCreditCard'),
                color: Colors.white,
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/card.png'),
                    ),
                  ),
                  title: Text(
                    'Credit Card',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () => Navigator.of(context).pushNamed('/addPrepaidCard'),
                color: Colors.white,
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/credit-cards.png'),
                    ),
                  ),
                  title: Text(
                    'Prepaid Card',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.white,
                onPressed: () => Navigator.of(context).pushNamed('/addPlannerSave'),
                child: ListTile(
                  horizontalTitleGap: 50,
                  leading: Container(
                    height: 35,
                    width: 35,
                    child: Image(
                      image: AssetImage('assets/wallet/revenue.png'),
                    ),
                  ),
                  title: Text(
                    'Planner Save',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
