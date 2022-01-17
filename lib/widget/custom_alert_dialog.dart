import 'package:taskBee/common/applocal.dart';
import 'package:flutter/material.dart';

class AlertDialogWallet extends StatelessWidget {
  String? content;
  Function()? submitMethod;
  Function()? cancelMethod;
  AlertDialogWallet(
      {Key? key, this.cancelMethod, this.submitMethod, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(children: [
        Icon(
          Icons.delete,
          color: Colors.red[900],
        ),
        SizedBox(
          width: 10,
        ),
        Text("${getLang(context, "Alert")}"),
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
                  "${getLang(context, "Ok")}",
                  style: TextStyle(color: Colors.red[900]),
                )),
            SizedBox(
              width: 30,
            ),
            TextButton(
                onPressed: cancelMethod,
                child: Text("${getLang(context, "Cancel")}",
                    style: TextStyle(color: Colors.black))),
          ],
        ),
      ],
    );
  }
}
