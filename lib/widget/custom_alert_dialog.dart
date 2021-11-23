import 'package:financial/common/applocal.dart';
import 'package:flutter/material.dart';

Widget customAlertDialog({
  String? content,
  Function()? submitMethod,
  Function()? cancelMethod,
}) {
  return AlertDialog(
    title: Row(children: [
      Icon(
        Icons.auto_delete_rounded,
        color: Colors.red[900],
      ),
      SizedBox(
        width: 10,
      ),
      Text("Alert"
          // "${getLang(context, "Alert")}"
          ),
    ]),
    content: Text(content!),
    contentTextStyle: TextStyle(color: Colors.grey[700], fontSize: 15),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: submitMethod,
              child: Text(
                "Ok"
                // "${getLang(context, "Ok")}"
                ,
                style: TextStyle(color: Colors.red[900]),
              )),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: cancelMethod,
              child: Text(
                  "Cancel"
                  // "${getLang(context, "Cancel")}"
                  ,
                  style: TextStyle(color: Colors.black))),
        ],
      ),
    ],
  );
}
