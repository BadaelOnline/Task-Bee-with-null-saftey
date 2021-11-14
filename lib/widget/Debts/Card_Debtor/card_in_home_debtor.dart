import 'package:financial/widget/Debts/Card_Debtor/showdialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Card_Home_Debtor extends StatefulWidget {
  final String? contact;
  final String? totalMoney;
  final String? currency;
  final Function()? receipt;
  final Function()? pay;

  const Card_Home_Debtor({
    Key? key,
    this.currency,
    this.contact,
    this.totalMoney,
    this.receipt,
    this.pay,
  }) : super(key: key);

  @override
  _Card_Home_DebtorState createState() => _Card_Home_DebtorState();
}

class _Card_Home_DebtorState extends State<Card_Home_Debtor> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/viewdebtsdebtor'),
      child: Card(
          elevation: 2.0,
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 5),
                              child: Container(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                  'assets/contact/contact.png',
                                ),
                              ),
                            ),
                            Text(widget.contact!),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              widget.totalMoney!,
                              style: TextStyle(
                                  color: Colors.green[500],
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(widget.currency!),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              size: 25,
                              color: Colors.grey[500],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Container(
                            height: 34,
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'pay    ',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: () => Navigator.of(context)
                              .pushNamed('/recepitcreditor'),
                        ),
                        VerticalDivider(
                          color: Colors.grey[300],
                          thickness: 1,
                        ),
                        InkWell(
                          onTap: () => ShowDialogdebtor(context),
                          child: Container(
                            height: 34,
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              'recepit',
                              style: TextStyle(
                                  color: Colors.green[500],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
