import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5.0,
      child: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/wallet/dollars.png',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Purchases and Spending',
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
                            padding: EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              onPressed: deleteTransaction,
                              icon: Icon(
                                Icons.delete,
                                size: 20,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8.0),
                            child: IconButton(
                              onPressed: updateTransaction,
                              icon: Icon(
                                Icons.edit,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          datetime!,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[400],
              endIndent: 13,
              indent: 13,
            ),
            Container(
              padding: EdgeInsets.only(
                right: 15,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    child: IconButton(
                                        onPressed: () {}, icon: iconExchange!),
                                  ),
                                  Container(
                                    child: Text(
                                      titleExchange!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
                                    width: 45,
                                    height: 45,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                      size: 27,
                                    ),
                                    // child: IconButton(
                                    //   onPressed: () {},
                                    //   icon: Image.asset(
                                    //     'assets/image/user.png',
                                    //   ),
                                    // ),
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
                              Row(
                                children: [
                                  Container(
                                      width: 42,
                                      height: 42,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                            'assets/wallet/details.png',
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
                        ],
                      ),
                    ),
                    Column(
                      children: [
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
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total:'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Payed:'),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Rest:'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  totalMoney!,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  paidMoney!,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  restMoney!,
                                  style: TextStyle(
                                    color: Colors.red[500],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                currency != 'no currency for this wallet'
                                    ? Text(currency!)
                                    : CircularProgressIndicator(),
                                SizedBox(
                                  height: 5,
                                ),
                                currency != 'no currency for this wallet'
                                    ? Text(currency!)
                                    : CircularProgressIndicator(),
                                SizedBox(
                                  height: 5,
                                ),
                                currency != 'no currency for this wallet'
                                    ? Text(currency!)
                                    : CircularProgressIndicator(),
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
