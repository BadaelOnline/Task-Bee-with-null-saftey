import 'package:flutter/material.dart';

import '../../main.dart';

class Card_Wallet extends StatelessWidget {
  final String? title;
  final Widget? image;
  final Function()? deleteMethod;
  final Function()? transactionMethod;
  final String? balance;
  final String? currency;
  Card_Wallet({
    Key? key,
    this.title,
    this.deleteMethod,
    this.transactionMethod,
    this.balance,
    this.currency,
    this.image,
  }) : super(key: key);

  String cash = 'assets/wallet/dollar.png';

  @override
  Widget build(BuildContext context) {
    var lang = mySharedPreferences!.getString('lang');
    double height = MediaQuery.of(context).size.height / 10;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Padding(
                padding: EdgeInsets.only(
                    left: lang == 'en' ? 8 : 0, right: lang == 'en' ? 0 : 8),
                child: image),
            SizedBox(
              width: MediaQuery.of(context).size.width / 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // title!.length > 10 ? '${title!.substring(0, 10)}...' : title!,
                  '$title',

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 150,
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        '$balance',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 70,
                    ),
                    Container(
                      child: currency != 'no currency for this wallet'
                          ? Text(
                              '$currency',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[700]),
                            )
                          : CircularProgressIndicator(),
                    ),
                  ],
                ),
              ],
            ),
          ]),
          Row(
            children: [
              IconButton(
                onPressed: transactionMethod,
                splashRadius: 0.1,
                icon: Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
              // IconButton(
              //   onPressed: transactionMethod,
              //   icon: Icon(
              //     Icons.edit,
              //     size: 20,
              //     color: Colors.grey,
              //   ),
              // ),
              // IconButton(
              //   onPressed: deleteMethod,
              //   splashRadius: 0.1,
              //   icon: Icon(
              //     Icons.delete,
              //     size: 20,
              //     color: Colors.grey,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
