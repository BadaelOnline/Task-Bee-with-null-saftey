import 'package:flutter/material.dart';

// ignore: camel_case_types
class detailes_Categoray_in_page_reports extends StatelessWidget {
  const detailes_Categoray_in_page_reports({
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
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 35,
          width: 35,
          child: Image.asset(categoryIcon!),
        ),
        Text(categorayName!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        // Text(
        //   "",
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        // Text(walletCurrency!)
      ],
    );
  }
}
