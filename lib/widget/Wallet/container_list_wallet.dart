import 'package:flutter/material.dart';

class Container_List_Wallet extends StatelessWidget {
  const Container_List_Wallet({
    Key? key,
    this.ontap,
    this.text,
    required this.image,
  }) : super(key: key);

  final ontap;
  final String? text;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 30, bottom: 5, right: 50),
              child: Container(
                child: image,
                height: 35,
                width: 35,
              ),
            ),
            Text(
              '$text',
              style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,

                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              )
            ]),
      ),
    );
  }
}
