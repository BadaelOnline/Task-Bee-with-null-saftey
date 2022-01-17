import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/widget/Buttom_Incom_Pay/Buttom_Income/Form_Debtors_Income.dart';
import 'package:taskBee/widget/Buttom_Incom_Pay/Buttom_Income/Form_Expencies_Income.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Add_Revenue extends StatefulWidget {
  @override
  _Add_RevenueState createState() => _Add_RevenueState();
}

// ignore: camel_case_types
class _Add_RevenueState extends State<Add_Revenue> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 18;
    return Scaffold(
      appBar: CustomAppBar(
        Image(
          image: AssetImage('assets/homepage/dollar.png'),
        ),
        "${getLang(context, "Income")}".toString(),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(children: [
          Container(
            height: height,
            color: Colors.white,
            child: TabBar(
              indicatorColor: Color(0xff16c8b1),
              tabs: [
                Container(
                  child: Text(
                    "${getLang(context, "Revnuee")}".toString(),
                    style: TextStyle(color: Colors.grey[800], fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "${getLang(context, "Recive Debts")}".toString(),
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
            child: Container(
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormExpencies_Income(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormDebtors_Income(),
                ),
                Center(
                  child: Text('Soon..'),
                ),
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
