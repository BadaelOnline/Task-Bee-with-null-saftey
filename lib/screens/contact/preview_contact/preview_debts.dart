import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class Preview_Debts extends StatelessWidget {
  const Preview_Debts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image.asset(
            'assets/contact/debtes.png',
          ),
          'Debtes Preview'),
    );
  }
}
