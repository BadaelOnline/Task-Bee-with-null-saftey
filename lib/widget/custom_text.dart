import 'package:financial/common/applocal.dart';

import 'package:flutter/material.dart';

import '../main.dart';

// ignore: camel_case_types
class Custom_Text extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final onTap;
  final String? label;
  final IconData? prefix;
  final bool? isClickable;

  const Custom_Text({
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
    var lang = mySharedPreferences!.getString('lang');
    double height = MediaQuery.of(context).size.height / 13.7;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffeeeeee),
        ),
      ),
      height: height,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          child: Text(
            label.toString(),
            style: TextStyle(fontSize: 15),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.2,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(lang == 'en' ? 7.5 : 0),
                bottomLeft: Radius.circular(lang == 'en' ? 7.5 : 0),
                topRight: Radius.circular(lang == 'en' ? 0 : 7.5),
                bottomRight: Radius.circular(lang == 'en' ? 0 : 7.5)),
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            height: height,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Padding(
              padding: EdgeInsets.only(
                  left: lang == 'en' ? 5 : 0, right: lang == 'en' ? 5 : 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                controller: controller,
                keyboardType: type,
                onFieldSubmitted: onSubmit,
                onChanged: onChange,
                enabled: isClickable,
                onTap: onTap,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
