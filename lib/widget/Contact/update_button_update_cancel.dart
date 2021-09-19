import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:flutter/material.dart';

import '../custom_raisd_button.dart';

class update_button_update_cancel extends StatelessWidget {
  const update_button_update_cancel({
    Key? key,
    required this.contactId,
    required this.nameController,
  }) : super(key: key);

  final int? contactId;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
    ]);
  }
}
