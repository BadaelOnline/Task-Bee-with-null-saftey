import 'package:financial/models/contact.dart';
import 'package:financial/widget/Contact/column_contact.dart';
import 'package:financial/widget/Contact/image.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class Preview_Contact extends StatelessWidget {
  Preview_Contact({Key? key}) : super(key: key);
  Contact? contact;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    contact = arguments['contact'];
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${contact!.name}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ColumnContact(
                    contact: contact,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
