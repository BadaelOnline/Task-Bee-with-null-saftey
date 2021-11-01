import 'package:financial/screens/Debts/tabs/creditors.dart';
import 'package:financial/screens/Debts/tabs/deptiors.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

class DebtsHome extends StatefulWidget {
  const DebtsHome({Key? key}) : super(key: key);

  @override
  _DebtsHomeState createState() => _DebtsHomeState();
}

class _DebtsHomeState extends State<DebtsHome> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
          Container(
            child: Image(
              image: AssetImage('assets/homepage/qrood.png'),
            ),
          ),
          'Debts',
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    // indicator: CircleTabIndicator(color: Colors.green, radius: 4),
                    isScrollable: true,
                    labelColor: Colors.black,
                    indicatorColor: Colors.red,
                    tabs: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          'Creditors',
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 15),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          'Debtors',
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 15),
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
                      child: Creditors(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Debtors(),
                    )
                  ]),
                ))
              ],
            )),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/debtsForm'),
        ),
      ),
    );
  }
}
