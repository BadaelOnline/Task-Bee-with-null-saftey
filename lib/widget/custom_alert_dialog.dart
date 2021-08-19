

import 'package:flutter/material.dart';

import 'custom_raisd_button.dart';

Widget customAlertDialog({
  String? title,
  String? content,
  Function()? submitMethod,
  Function()? cancelMethod,
}) {
  return AlertDialog(
    content: Text(content!),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    contentTextStyle: TextStyle(color: Colors.black38, fontSize: 15),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomRaisdButton(onPressed: submitMethod, text: 'ok'),
          SizedBox(
            width: 30,
          ),
          CustomRaisdButton(onPressed: cancelMethod, text: 'cancel'),
        ],
      ),
    ],
  );
}