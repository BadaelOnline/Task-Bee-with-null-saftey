import 'package:flutter/material.dart';

class Container_wallet extends StatelessWidget {
  const Container_wallet({
    Key? key,
    this.ontap,
    this.text,
    required this.image,
    this.balanc,
    this.currency,
  }) : super(key: key);

  final ontap;
  final String? text;
  final Widget image;
  final String? balanc;
  final String? currency;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 5, bottom: 5, right: 10),
                child: image),
            Text('$text'),
            SizedBox(
              width: 25,
            ),
            Text(balanc != null ? '$balanc' : ''),
            Text(currency != null ? "$balanc" : '')
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
