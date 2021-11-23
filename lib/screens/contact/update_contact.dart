import 'package:financial/common/applocal.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/widget/Contact/image.dart';
import 'package:financial/widget/Contact/update_button_update_cancel.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UpdateContact extends StatelessWidget {
  int? contactId;
  String? contactName;

  TextEditingController nameController = TextEditingController();

  UpdateContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    contactId = arguments['contactId'];
    contactName = arguments['contactName'];

    return Scaffold(
      appBar: CustomAppBar(
          Image(
            image: AssetImage('assets/homepage/person.png'),
          ),
          "${getLang(context, "Update Contact")}"),
      body: BlocConsumer<ContactCubit, ContactStates>(
        listener: (context, state) {
          if (state is UpdateContactsToDatabaseState) {
            Navigator.pop(context);
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
                child: Container(
                    child: Custom_Text(
                        label: "${getLang(context, "Name")}",
                        controller: nameController =
                            TextEditingController(text: '$contactName'),
                        prefix: Icons.person)),
              ),
              SizedBox(
                height: 100,
              ),
              update_button_update_cancel(
                  contactId: contactId, nameController: nameController)
            ])),
          );
        },
      ),
    );
  }
}
