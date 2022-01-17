import 'package:taskBee/widget/Buttom_Incom_Pay/All_Visibility/widget_container.dart';
import 'package:flutter/material.dart';
import 'Text_debts_installment.dart';
import 'date_debts.dart';

// ignore: camel_case_types
class Visibal_Installment extends StatefulWidget {
  const Visibal_Installment({Key? key}) : super(key: key);

  @override
  _Visibal_InstallmentState createState() => _Visibal_InstallmentState();
}

// ignore: camel_case_types
class _Visibal_InstallmentState extends State<Visibal_Installment> {
  bool isVisabile2 = false;

  var val;
  TextEditingController datetime = TextEditingController();

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
            text: 'Entitlement',
            image: Icon(
              Icons.done_all,
              color: Colors.black,
            ),
          ),
        ),
        Visibility(
          visible: isVisabile2,
          child: Column(
            children: [
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'installment system :',
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
                          'Daily',
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
                          'Weekly',
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
                          'Monthly',
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
                          'yearly',
                          style: TextStyle(fontSize: 11.75),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, bottom: 5, right: 10),
                  child: Text_Installment_debts(
                    label: 'Total',
                  ),
                ),
              ]),
              Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 20, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              'Date of the first installment :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 5, bottom: 5, right: 10),
                        child: DateWidget_Debts(
                          transactionDateController: datetime,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Transaction alert :',
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
                      Text('Before one day'),
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
                      Text('Before Two days'),
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
                      Text('At the same time'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
