import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Padding(padding: const EdgeInsets.only(left: 8.0), child: image),
            SizedBox(
              width: 15,
            ),
            Text(
              '$title',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ]),
          Row(
            children: [
              Container(
                child: Text(
                  '$balance',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[700]),
                ),
                padding: EdgeInsets.all(5),
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
                padding: EdgeInsets.all(5),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: deleteMethod,
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
