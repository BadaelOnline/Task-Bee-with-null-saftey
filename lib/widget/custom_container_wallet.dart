import 'package:flutter/material.dart';


class CustomContainerWallet extends StatelessWidget {
  final String? title;
  final Widget? circleAvatar;
  final Function()? deleteMethod;
  final Function()? transactionMethod;
  final String? balance;
  final String? currency;
   CustomContainerWallet({
    Key? key, this.title, this.circleAvatar, this.deleteMethod, this.transactionMethod, this.balance,this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(5),
      color: Colors.white,
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(padding: EdgeInsets.only(left: 2), child: circleAvatar),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      '$title  ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[700]),
                    )),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  child: currency != 'no currency for this wallet' ?
                  Text(
                    '$currency',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[700]),
                  ):CircularProgressIndicator(),
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
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: transactionMethod,
                  icon: Icon(
                    Icons.report_outlined,
                    size: 20,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}