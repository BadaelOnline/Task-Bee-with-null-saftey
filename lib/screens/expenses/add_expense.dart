import 'package:financial/common/applocal.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Button_Pay/Form_Debtors.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Button_Pay/Form_Expinces.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  var lang = mySharedPreferences!.getString('lang');
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
    double height = MediaQuery.of(context).size.height / 18;
    return Scaffold(
      appBar: CustomAppBar(
        Image(
          image: AssetImage('assets/homepage/masaref.png'),
        ),
        "${getLang(context, "Pay")}".toString(),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(children: [
          Container(
            height: height,
            color: Colors.white,
            child: TabBar(
              indicatorColor: Colors.red,
              tabs: [
                Container(
                  child: Text(
                    "${getLang(context, "Expencies")}".toString(),
                    style: TextStyle(color: Colors.grey[800], fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "${getLang(context, "Pay Debts")}".toString(),
                    style: TextStyle(color: Colors.grey[800], fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "${getLang(context, "Projects")}".toString(),
                    style: TextStyle(color: Colors.grey[800], fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormExpencies(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormDebtors(),
              ),
              Center(
                child: Text('Soon..'),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
