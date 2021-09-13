import 'package:financial/widget/Buttom_Incom_Pay/Buttom_Income/Form_Debtors_Income.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Buttom_Income/Form_Expencies_Income.dart';
import 'package:financial/widget/custom_appBar.dart';
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
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
            Image(
              image: AssetImage('assets/homepage/dollar.png'),
            ),
            'Income'),
        body: Stack(children: [
          Container(
            height: 40,
            color: Colors.white,
            child: TabBar(
              indicatorColor: Color(0xff16c8b1),
              tabs: [
                Container(
                  child: Text(
                    'Revenue',
                    style: TextStyle(color: Colors.grey[800], fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    'Recive Debts',
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
            FormExpencies_Income(),
            FormDebtors_Income(),
            Center(
              child: Text('Soon..'),
            ),
          ])
        ]),
      ),
    );
  }
}
