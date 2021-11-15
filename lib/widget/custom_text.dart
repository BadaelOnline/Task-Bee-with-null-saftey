import 'package:financial/common/applocal.dart';

import 'package:flutter/material.dart';

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
    String name = "${getLang(context, "Name")}".toString();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffeeeeee),
        ),
      ),
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          child: Text(
            name,
            style: TextStyle(fontSize: 15),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.2,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(name == "Name" ? 7.5 : 0),
                bottomLeft: Radius.circular(name == "Name" ? 7.5 : 0),
                topRight: Radius.circular(name == "Name" ? 0 : 7.5),
                bottomRight: Radius.circular(name == "Name" ? 0 : 7.5)),
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.bottomCenter,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Padding(
              padding: EdgeInsets.only(
                  left: name == "Name" ? 5 : 0, right: name == "الاسم" ? 5 : 0),
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
        // Container(
        //   alignment: Alignment.center,
        //   width: MediaQuery.of(context).size.width * 0.2,
        //   height: 50,
        //   child: Icon(prefix),
        //   decoration: BoxDecoration(
        //       color: Colors.grey[100],
        //       borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(8),
        //           bottomRight: Radius.circular(8))),
        // ),
      ]),
    );
  }
}
