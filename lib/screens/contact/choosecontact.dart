import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

class ChooseContact extends StatefulWidget {
  const ChooseContact({Key? key}) : super(key: key);

  @override
  _ChooseContactState createState() => _ChooseContactState();
}

class _ChooseContactState extends State<ChooseContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            Image(
              image: AssetImage('assets/homepage/person.png'),
            ),
            'Choose Contact'),
        body: Container(
          child: Center(
            child: Text('Soon..'),
          ),
        ),
        floatingActionButton: CustomFloatingActionButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed('/addContact'),
        ));
  }
}
