import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/screens/contact/contact_home.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/widget/Wallet/raised_button_wallets.dart';
import 'package:flutter/material.dart';

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
        RaisedButtonWallets(
            onPressed: () {
              ContactCubit.get(context).insertToDatabase(
                contactName: nameController.text,
              );
            },
            text: "${getLang(context, "Save")}"),
        RaisedButtonWallets(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ContactHome()));
            },
            text: "${getLang(context, "Cancel")}"),
      ],
    );
  }
}
