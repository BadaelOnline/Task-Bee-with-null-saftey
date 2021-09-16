import 'package:financial/screens/contact/contact_home.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:flutter/material.dart';
import '../custom_raisd_button.dart';

class button_save_cancel extends StatelessWidget {
  const button_save_cancel({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  MaterialPageRoute(builder: (context) => ContactHome()));
            },
            text: 'Cansel'),
      ],
    );
  }
}
