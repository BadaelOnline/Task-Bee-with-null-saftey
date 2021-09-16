import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class Preview_TeamWork extends StatelessWidget {
  const Preview_TeamWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image.asset(
            'assets/contact/group.png',
          ),
          'Team Work Preview'),
    );
  }
}
