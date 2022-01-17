import 'package:flutter/material.dart';

import '../../../main.dart';

class widget_Container extends StatelessWidget {
  const widget_Container({
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
    var lang = mySharedPreferences!.getString('lang');
    double height = MediaQuery.of(context).size.height / 13.7;
    return InkWell(
      onTap: ontap,
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: 5,
                    left: lang == 'en' ? 5 : 10,
                    bottom: 5,
                    right: lang == 'en' ? 10 : 5),
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
