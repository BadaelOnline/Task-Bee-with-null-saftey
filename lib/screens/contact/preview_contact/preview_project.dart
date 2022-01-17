import 'package:taskBee/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class Preview_Project extends StatelessWidget {
  const Preview_Project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image.asset(
            'assets/contact/projects.png',
          ),
          'Project Preview'),
    );
  }
}
