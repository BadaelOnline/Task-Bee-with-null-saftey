import 'package:financial/widget/Debts/form_add_debts.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class DebtsForm extends StatefulWidget {
  @override
  _DebtsFormState createState() => _DebtsFormState();
}

class _DebtsFormState extends State<DebtsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Container(
          child: Image(
            image: AssetImage('assets/homepage/qrood.png'),
          ),
        ),
        'Debts',
      ),
      body: Form_Add_Debts(),
    );
  }
}
