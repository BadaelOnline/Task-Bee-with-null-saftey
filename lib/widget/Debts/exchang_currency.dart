import 'package:flutter/material.dart';

// ignore: camel_case_types
class Exchang_Currency extends StatefulWidget {
  const Exchang_Currency({Key? key}) : super(key: key);

  @override
  _Exchang_CurrencyState createState() => _Exchang_CurrencyState();
}

// ignore: camel_case_types
class _Exchang_CurrencyState extends State<Exchang_Currency> {
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 30,
                  height: 30,
                  child: Image.asset('assets/wallet/exchang_currencyy.png')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Exchange prices'),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber[400]!),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Text('USD')),
                    VerticalDivider(
                      color: Colors.amber[400],
                      thickness: 1,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text('1'))
                  ],
                ),
              ),
              Text(
                '=',
                style: TextStyle(color: Colors.amber[400], fontSize: 25),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.amber[400]!),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Text('S.P')),
                    VerticalDivider(
                      color: Colors.amber[400],
                      thickness: 1,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: TextFormField(
                            cursorColor: Colors.amber[400],
                            textAlign: TextAlign.center,
                            decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            controller: number,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
