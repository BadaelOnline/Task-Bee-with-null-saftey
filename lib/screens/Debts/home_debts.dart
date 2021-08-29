import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_floating_action_button.dart';

import 'package:flutter/material.dart';

class DebtsHome extends StatefulWidget {
  const DebtsHome({Key? key}) : super(key: key);

  @override
  _DebtsHomeState createState() => _DebtsHomeState();
}

class _DebtsHomeState extends State<DebtsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: CustomAppBar(
          Container(
            child: Image(
              image: AssetImage('assets/homepage/qrood.png'),
            ),
          ),
          'Debts',
        ),
        body: Stack(
          children: [
            TabBar(
              // padding: EdgeInsets.all(15),
              indicatorColor: Colors.amber[400],
              labelPadding: EdgeInsets.all(15),
              tabs: [
                Container(
                  child: Text(
                    'Creditors / theirs',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Container(
                  child: Text(
                    'Debtors / on them',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
            TabBarView(children: [
              Icon(Icons.car_rental),
              Icon(Icons.ac_unit),
            ])
          ],
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/debtsForm'),
        ),
      ),
    );
  }
}
