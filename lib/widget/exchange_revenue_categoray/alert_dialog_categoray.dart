import 'package:financial/common/applocal.dart';
import 'package:flutter/material.dart';

class AlertDialogCategoray extends StatelessWidget {
  String? content;
  Function()? submitMethod;
  Function()? cancelMethod;
  Icon? icon;
  Color? color;
  int? x;
  AlertDialogCategoray(
      {Key? key,
      this.cancelMethod,
      this.submitMethod,
      this.content,
      this.icon,
      this.color,
      this.x})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(children: [
        icon!,
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
          children: [
            x == 0
                ? Row(
                    children: [
                      TextButton(
                          onPressed: cancelMethod,
                          child: Text("${getLang(context, "Cancel")}",
                              style: TextStyle(color: Colors.black))),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                          onPressed: submitMethod,
                          child: Text(
                            "${getLang(context, "Ok")}",
                            style: TextStyle(color: color),
                          )),
                    ],
                  )
                : Row(
                    children: [
                      TextButton(
                          onPressed: submitMethod,
                          child: Text(
                            "${getLang(context, "Ok")}",
                            style: TextStyle(color: color),
                          )),
                    ],
                  )
          ],
        ),
      ],
    );
  }
}
