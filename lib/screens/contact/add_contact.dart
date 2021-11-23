import 'package:financial/common/applocal.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/widget/Contact/button_save_cancel.dart';
import 'package:financial/widget/Contact/image.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          "${getLang(context, "Add Contact")}"),
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
                image(),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Custom_Text(
                    label: "${getLang(context, "Name")}",
                    controller: nameController,
                    prefix: Icons.person,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                button_save_cancel(nameController: nameController)
              ]),
            ),
          );
        },
      ),
    );
  }
}
