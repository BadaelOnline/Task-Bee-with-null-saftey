import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/widget/Home_Page/Public_Widget/first_date.dart';
import 'package:taskBee/widget/Wallet/widget_reports_wallet/date_day_month_year.dart';
import 'package:taskBee/widget/Wallet/widget_reports_wallet/date_year.dart';
import 'package:taskBee/widget/Wallet/widget_reports_wallet/multi_date.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import 'detailes_categoray.dart';

// ignore: camel_case_types
class Card_Fixpostion_in_Page_reports_Categoray extends StatefulWidget {
  const Card_Fixpostion_in_Page_reports_Categoray({
    Key? key,
    required this.categoryIcon,
    required this.categorayName,
    // required this.walletBalance,
    // required this.walletCurrency,
  }) : super(key: key);

  final String? categoryIcon;
  final String? categorayName;
  // final String? walletBalance;
  // final String? walletCurrency;

  @override
  _Card_Fixpostion_in_Page_reports_CategorayState createState() =>
      _Card_Fixpostion_in_Page_reports_CategorayState();
}

// ignore: camel_case_types
class _Card_Fixpostion_in_Page_reports_CategorayState
    extends State<Card_Fixpostion_in_Page_reports_Categoray> {
  int val = 2;

  @override
  Widget build(BuildContext context) {
    var lang = mySharedPreferences!.getString('lang');
    return Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(lang == 'en' ? 5 : 0),
                        topLeft: Radius.circular(lang == 'en' ? 0 : 5),
                        bottomLeft: Radius.circular(lang == 'en' ? 0 : 5),
                        bottomRight: Radius.circular(lang == 'en' ? 5 : 0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500]!.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: detailes_Categoray_in_page_reports(
                    categoryIcon: widget.categoryIcon,
                    categorayName: widget.categorayName,
                    // walletBalance: widget.walletBalance,
                    // walletCurrency: widget.walletCurrency,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 90,
          ),
          Row(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(lang == 'en' ? 5 : 0),
                        topLeft: Radius.circular(lang == 'en' ? 0 : 5),
                        bottomLeft: Radius.circular(lang == 'en' ? 0 : 5),
                        bottomRight: Radius.circular(lang == 'en' ? 5 : 0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500]!.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '15000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[700]),
                      ),
                      Text('USD'),
                      // Text('')
                    ],
                  )),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 90,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: val,
                  onChanged: (int? value) {
                    setState(() {
                      val = value!;
                    });
                  },
                ),
                Text(
                  "${getLang(context, "This month")}".toString(),
                  style: TextStyle(fontSize: 11.75),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 3,
                  groupValue: val,
                  onChanged: (int? value) {
                    setState(() {
                      val = value!;
                    });
                  },
                ),
                Text(
                  "${getLang(context, "This year")}".toString(),
                  style: TextStyle(fontSize: 11.75),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 4,
                  groupValue: val,
                  onChanged: (int? value) {
                    setState(() {
                      val = value!;
                    });
                  },
                ),
                Text(
                  "${getLang(context, "Custom Date")}".toString(),
                  style: TextStyle(fontSize: 11.75),
                ),
              ],
            ),
            Text('')
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height / 90,
          ),
          val == 4
              ? Multidate()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    val == 1
                        ? DateDayMonthYear()
                        : val == 3
                            ? DateYear()
                            : FirstDate(),
                  ],
                ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 90,
          ),
        ]));
  }
}
