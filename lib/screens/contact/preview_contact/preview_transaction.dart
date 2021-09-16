import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class Preview_Transaction extends StatelessWidget {
  const Preview_Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image.asset(
            'assets/contact/alltransaction.png',
          ),
          'TransAction Preview'),
    );
  }
}
