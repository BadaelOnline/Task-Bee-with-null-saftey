import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Card_In_ViewContact_Creditor extends StatelessWidget {
  final String? datetime;
  final Widget? iconMoneyType;
  final String? walletType;
  final String? contact;
  final String? note;

  final String? paidMoney;

  final String? currency;
  final Function()? deleteTransaction;
  final Function()? updateTransaction;

  const Card_In_ViewContact_Creditor({
    Key? key,
    this.datetime,
    this.iconMoneyType,
    this.walletType,
    this.contact,
    this.note,
    this.paidMoney,
    this.currency,
    this.deleteTransaction,
    this.updateTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0) //
              ),
        ),
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
                          'assets/homepage/qrood.png',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Debts',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            datetime!,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              child: Divider(
                color: Colors.grey[400],
                endIndent: 13,
                indent: 13,
              ),
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
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                      size: 27,
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
                              Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    child: Icon(
                                      Icons.list_outlined,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                  ),
                                  Container(
                                    child: Text(note!),
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
                            Container(
                              height: 25,
                              width: 25,
                              child: iconMoneyType,
                            ),
                            SizedBox(
                              width: 5,
                            ),
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
                                Text('Amount:'),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  paidMoney!,
                                  style: TextStyle(
                                    //view contact from creditors
                                    color: Colors.green[500],
                                    // view contact from Debptors
                                    // color: Colors.red[700],
                                    fontWeight: FontWeight.bold,
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
