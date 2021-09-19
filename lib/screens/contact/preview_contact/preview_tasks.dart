import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class Preview_Tasks extends StatelessWidget {
  const Preview_Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image.asset(
            'assets/contact/task.png',
          ),
          'Tasks Preview'),
    );
  }
}
