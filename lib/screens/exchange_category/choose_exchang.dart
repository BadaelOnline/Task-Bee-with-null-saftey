import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

class ChooseExchang extends StatefulWidget {
  const ChooseExchang({Key? key}) : super(key: key);

  @override
  _ChooseExchangState createState() => _ChooseExchangState();
}

class _ChooseExchangState extends State<ChooseExchang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            Image(
              image: AssetImage('assets/homepage/masaref.png'),
            ),
            'Choose Expancies'),
        body: Container(
          child: Center(
            child: Text('Soon..'),
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed('/addExchange'),
        ));
  }
}
