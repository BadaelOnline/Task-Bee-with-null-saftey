import 'package:flutter/material.dart';

class detailes_wallet_in_page_reports extends StatelessWidget {
  const detailes_wallet_in_page_reports({
    Key? key,
    required this.image,
    required this.walletName,
    // required this.walletBalance,
    // required this.walletCurrency,
  }) : super(key: key);

  final String? image;
  final String? walletName;
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
          child: Image.asset(image!),
        ),
        Text(walletName!),
        // Text(
        //   walletBalance!,
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        // Text(walletCurrency!)
      ],
    );
  }
}
