import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/widget/Wallet/widget_reports_wallet/card_fix_postions_in_page_reports.dart';
import 'package:taskBee/widget/Wallet/widget_reports_wallet/circle_percentages.dart';
import 'package:taskBee/widget/Wallet/widget_reports_wallet/multi_date.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class PlannerSaveReports extends StatefulWidget {
  const PlannerSaveReports({Key? key}) : super(key: key);

  @override
  _PlannerSaveReportsState createState() => _PlannerSaveReportsState();
}

class _PlannerSaveReportsState extends State<PlannerSaveReports> {
  String image = 'assets/wallet/revenue.png';
  int? walletId;
  String? walletName;
  String? walletCurrency;
  String? walletBalance;

  int x = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    walletId = arguments['walletId'];
    walletName = arguments['walletName'];
    walletCurrency = arguments['currencyId'];
    walletBalance = arguments['walletBalance'];
    image = arguments['image'];
    return Scaffold(
        appBar: CustomAppBar(
          Image(
            image: AssetImage('assets/homepage/wallet.png'),
          ),
          "${getLang(context, "Reports Saving Wallet")}",
          // "${getLang(context, "Add Wallet")}",
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card_Fixpostion_in_Page_reports(
                      image: image,
                      walletName: walletName,
                      walletBalance: walletBalance,
                      walletCurrency: walletCurrency),
                  x == 0 ? Text("") : PercentIndicator(),
                ],
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              x == 0 ? x = 1 : x = 0;
            });
          },
          backgroundColor: Colors.white,
          child: Icon(
            x == 0 ? Icons.pie_chart : Icons.list,
            color: Colors.grey[500],
            size: 30,
          ),
        ));
  }
}
