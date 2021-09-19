import 'package:financial/widget/Buttom_Incom_Pay/Button_Pay/Form_Debtors.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Button_Pay/Form_Expinces.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  int x = 0;

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('oops'),
          content: SingleChildScrollView(
            child: Text('sorry wallet balance less than total of transaction'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: x,
      child: Scaffold(
        appBar: CustomAppBar(
            Image(
              image: AssetImage('assets/homepage/masaref.png'),
            ),
            'Pay'),
        body: Stack(children: [
          Container(
            height: 40,
            color: Colors.white,
            child: TabBar(
              indicatorColor: Colors.red,
              tabs: [
                Container(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        x = 0;
                      });
                      print('mmmmmmm');
                    },
                    child: Text(
                      'Expencies',
                      style: TextStyle(color: Colors.grey[800], fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Pay Debts',
                    style: TextStyle(color: Colors.grey[800], fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    'Projects',
                    style: TextStyle(color: Colors.grey[800], fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          TabBarView(children: [
            FormExpencies(),
            FormDebtors(),
            Center(
              child: Text('Soon..'),
            ),
          ])
        ]),
      ),
    );
  }
}
