import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/widget/custom_raisd_button.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text('Update Contact'),
        backgroundColor: Colors.amber[400],
      ),
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
                    child: Custom_Text(
                        label: 'Name Contact',
                        controller: nameController =
                            TextEditingController(text: '$contactName'),
                        prefix: Icons.person)),
              ),
              SizedBox(
                height: 100,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                CustomRaisdButton(
                    text: 'Update',
                    onPressed: () {
                      ContactCubit.get(context).updateContactDatabase(
                        isId: contactId,
                        contactName: nameController.text,
                      );
                    }),
                CustomRaisdButton(
                    text: 'Cansel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ])
            ])),
          );
        },
      ),
    );
  }
}
