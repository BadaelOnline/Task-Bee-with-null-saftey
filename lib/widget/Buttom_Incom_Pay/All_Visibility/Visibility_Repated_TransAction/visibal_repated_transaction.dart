import 'package:taskBee/common/applocal.dart';
import 'package:flutter/material.dart';

import '../widget_container.dart';

// ignore: camel_case_types
class Visibal_RepatedtransAction extends StatefulWidget {
  const Visibal_RepatedtransAction({Key? key}) : super(key: key);

  @override
  _Visibal_RepatedtransActionState createState() =>
      _Visibal_RepatedtransActionState();
}

// ignore: camel_case_types
class _Visibal_RepatedtransActionState
    extends State<Visibal_RepatedtransAction> {
  bool isVisabile2 = false;

  var val;

  bool adayago = false;
  bool towdayago = false;
  bool sameday = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isVisabile2 = !isVisabile2;
            });
          },
          child: Widget_container(
              text: "${getLang(context, "Repated Transaction")}".toString(),
              image: Container(
                  height: 25,
                  width: 25,
                  child: Image.asset('assets/homepage/repeat.png'))),
        ),
        Visibility(
          visible: isVisabile2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      "${getLang(context, "Repeted")} :".toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                      ),
                      Text(
                        "${getLang(context, "Daily")}".toString(),
                        style: TextStyle(fontSize: 11.75),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                      ),
                      Text(
                        "${getLang(context, "Weekly")}".toString(),
                        style: TextStyle(fontSize: 11.75),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                      ),
                      Text(
                        "${getLang(context, "Monthly")}".toString(),
                        style: TextStyle(fontSize: 11.75),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                      ),
                      Text(
                        "${getLang(context, "Yearly")}".toString(),
                        style: TextStyle(fontSize: 11.75),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      "${getLang(context, "Transaction alert")} :".toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: adayago,
                    onChanged: (value) {
                      setState(() {
                        adayago = !adayago;
                      });
                    },
                  ),
                  Text(
                    "${getLang(context, "Befor one day")}".toString(),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: towdayago,
                    onChanged: (value) {
                      setState(() {
                        towdayago = !towdayago;
                      });
                    },
                  ),
                  Text(
                    "${getLang(context, "Befor tow day")}".toString(),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: sameday,
                    onChanged: (value) {
                      setState(() {
                        sameday = !sameday;
                      });
                    },
                  ),
                  Text(
                    "${getLang(context, "At the same time")}".toString(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
