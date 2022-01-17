import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/widget/Wallet/raised_button_wallets.dart';
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
      RaisedButtonWallets(
          text: "${getLang(context, "Update")}",
          onPressed: () {
            ContactCubit.get(context).updateContactDatabase(
              isId: contactId,
              contactName: nameController.text,
            );
          }),
      RaisedButtonWallets(
          text: "${getLang(context, "Cancel")}",
          onPressed: () {
            Navigator.of(context).pop();
          }),
    ]);
  }
}
