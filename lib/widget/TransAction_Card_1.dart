import 'package:taskBee/common/applocal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class TransactionCard extends StatelessWidget {
  final String? titleExchange;
  final String? datetime;
  final Image? iconMoneyType;
  final String? walletType;
  final String? contact;
  final String? note;
  final String? totalMoney;
  final Image? imageWallet;
  final String? attachments;
  final String? currencyName;
  final String? paidMoney;
  final Image? iconExchange;
  final String? restMoney;
  final String? currency;
  final Function()? deleteTransaction;
  final Function()? updateTransaction;

  const TransactionCard({
    Key? key,
    this.titleExchange,
    this.datetime,
    this.iconMoneyType,
    this.walletType,
    this.contact,
    this.note,
    this.totalMoney,
    this.imageWallet,
    this.attachments,
    this.currencyName,
    this.paidMoney,
    this.iconExchange,
    this.restMoney,
    this.currency,
    this.deleteTransaction,
    this.updateTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = mySharedPreferences!.getString('lang');
    return Card(
      margin: EdgeInsets.all(10),
      // elevation: 1.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: lang == 'en' ? 10 : 0,
                        right: lang == 'en' ? 0 : 10),
                    child: Row(children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/homepage/masaref.png',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: lang == 'en' ? 8 : 0,
                            right: lang == 'en' ? 0 : 8),
                        child: Text(
                          "${getLang(context, "Purchases and Spending")}",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ),
                    ]),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: IconButton(
                              onPressed: updateTransaction,
                              icon: Icon(
                                Icons.edit,
                                size: 20,
                              ),
                            ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: deleteTransaction,
                              icon: Icon(
                                Icons.delete,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 3,
              child: Divider(
                color: Colors.grey[400],
                endIndent: 13,
                indent: 13,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  right: lang == 'en' ? 15 : 0, left: lang == 'en' ? 0 : 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                        onPressed: () {}, icon: iconExchange!),
                                  ),
                                  Container(
                                    child: Text(
                                      titleExchange!,
                                      // style: TextStyle(
                                      //     fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      contact!,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.list,
                                        color: Colors.grey[500],
                                      ))),
                              Container(
                                child: Text(
                                  note!,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            datetime!,
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(walletType!),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${getLang(context, "Total")}:"
                                          .toString(),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      totalMoney!,
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    currency != 'no currency for this wallet'
                                        ? Text(currency!)
                                        : CircularProgressIndicator(),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${getLang(context, "Paid")}:".toString(),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      paidMoney!,
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    currency != 'no currency for this wallet'
                                        ? Text(currency!)
                                        : CircularProgressIndicator(),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${getLang(context, "Rest")}:".toString(),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      restMoney!,
                                      style: TextStyle(
                                        color: Colors.red[500],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    currency != 'no currency for this wallet'
                                        ? Text(currency!)
                                        : CircularProgressIndicator(),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
