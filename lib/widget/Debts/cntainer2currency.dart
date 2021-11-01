import 'package:flutter/material.dart';

// ignore: camel_case_types
class COntainer2currency extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final onTap;
  final String? label;
  final IconData? prefix;
  final bool? isClickable;

  const COntainer2currency({
    Key? key,
    this.controller,
    this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.label,
    this.prefix,
    this.isClickable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: Colors.grey[200]!,
        ),
      ),
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: Text(
            label.toString(),
            style: TextStyle(fontSize: 15),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.2,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 24,
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                  autofocus: false,
                  controller: controller,
                  keyboardType: type,
                  onFieldSubmitted: onSubmit,
                  onChanged: onChange,
                  enabled: isClickable,
                  onTap: onTap,
                ),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  height: 24,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    '12000000',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.2,
              height: 24,
              child: Text(
                'USD',
                style: TextStyle(fontSize: 15),
              ),
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
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                  )),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.2,
              height: 24,
              child: Text('S.P',
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
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
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(8))),
            ),
          ],
        ),
      ]),
    );
  }
}
