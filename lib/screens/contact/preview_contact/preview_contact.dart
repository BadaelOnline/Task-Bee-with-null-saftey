import 'package:financial/widget/Contact/column_contact.dart';
import 'package:financial/widget/Contact/image.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class Preview_Contact extends StatefulWidget {
  const Preview_Contact({Key? key}) : super(key: key);

  @override
  _Preview_ContactState createState() => _Preview_ContactState();
}

class _Preview_ContactState extends State<Preview_Contact> {
  int? contactId;
  String? contactName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            Image.asset(
              'assets/homepage/person.png',
            ),
            'Preview Contact'),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                image(),
                Text(''),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ColumnContact(),
                ),
              ],
            ),
          ),
        ));
  }
}
