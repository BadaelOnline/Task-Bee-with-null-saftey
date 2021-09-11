import 'package:financial/widget/Button_Pay/Form_Expancies/All_Visibility/widget_container.dart';
import 'package:flutter/material.dart';

class Visibal_RepatedtransAction extends StatefulWidget {
  const Visibal_RepatedtransAction({Key? key}) : super(key: key);

  @override
  _Visibal_RepatedtransActionState createState() =>
      _Visibal_RepatedtransActionState();
}

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
          child: Widget_container(text: 'Repated Transaction'),
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
                      'Repeated :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                    'daily',
                    style: new TextStyle(fontSize: 12.0),
                  ),
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
                    'weekly',
                    style: new TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
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
                    style: new TextStyle(fontSize: 12.0),
                  ),
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
                    style: new TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
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
          ),
        ),
      ],
    );
  }
}
