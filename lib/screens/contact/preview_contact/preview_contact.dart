import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/models/contact.dart';
import 'package:taskBee/widget/Contact/column_contact.dart';
import 'package:taskBee/widget/Contact/image.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:flutter/material.dart';

class Preview_Contact extends StatelessWidget {
  Preview_Contact({Key? key}) : super(key: key);
  Contact? contact;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 20;
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    contact = arguments['contact'];
    return Scaffold(
      appBar: CustomAppBar(
        Image.asset(
          'assets/homepage/person.png',
        ),
        "${getLang(context, "Preview Contact")}",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: height,
              ),
              image(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                '${contact!.name}',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height,
              ),
              ColumnContact(
                contact: contact,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
