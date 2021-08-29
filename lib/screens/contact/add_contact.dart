import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_raisd_button.dart';
import 'package:financial/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_home.dart';

// ignore: must_be_immutable
class AddContact extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image(
            image: AssetImage('assets/homepage/person.png'),
          ),
          'Add Contact'),
      body: BlocConsumer<ContactCubit, ContactStates>(
        listener: (context, ContactStates state) {
          if (state is InsertContactsToDatabaseState) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/user.png',
                      width: 100,
                      height: 100,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      child: CustomTextFormField(
                          label: 'Name Contact',
                          controller: nameController,
                          prefix: Icons.person)),
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomRaisdButton(
                        onPressed: () {
                          ContactCubit.get(context).insertToDatabase(
                            contactName: nameController.text,
                          );
                        },
                        text: 'Save'),
                    CustomRaisdButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ContactHome()));
                        },
                        text: 'Cansel'),
                  ],
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
