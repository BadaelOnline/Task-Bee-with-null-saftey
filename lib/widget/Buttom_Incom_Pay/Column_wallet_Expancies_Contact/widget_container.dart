import 'package:flutter/material.dart';

class widget_Container extends StatelessWidget {
  const widget_Container({
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
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 5, bottom: 5, right: 10),
                child: image),
            Text('$text')
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
