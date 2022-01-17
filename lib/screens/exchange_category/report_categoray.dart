import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/exchange_revenue_categoray/card_in_view_report_categoray.dart';
import 'package:flutter/material.dart';

class ReportCategoray extends StatefulWidget {
  const ReportCategoray({Key? key}) : super(key: key);

  @override
  _ReportCategorayState createState() => _ReportCategorayState();
}

class _ReportCategorayState extends State<ReportCategoray> {
  int? categorayId;
  String? categoryName;
  String? categoryIcon;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    categorayId = arguments['categoryId'];
    categoryName = arguments['categoryName'];
    categoryIcon = arguments['categoryIcon'];
    return Scaffold(
      appBar: CustomAppBar(Image.asset('assets/homepage/masaref.png'),
          "${getLang(context, "Categoray Report")}"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card_Fixpostion_in_Page_reports_Categoray(
                categorayName: categoryName,
                categoryIcon: categoryIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
