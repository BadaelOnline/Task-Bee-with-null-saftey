import 'package:financial/common/applocal.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/widget/Contact/button_save_cancel.dart';
import 'package:financial/widget/Contact/image.dart';
import 'package:financial/widget/Wallet/raised_button_wallets.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:financial/widget/exchange_revenue_categoray/alert_dialog_categoray.dart';
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
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                image(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Custom_Text(
                  label: "${getLang(context, "Name")}",
                  controller: nameController,
                  prefix: Icons.person,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 7.5,
                ),

                RaisedButtonWallets(
                    onPressed: () {
                      nameController.text != ""
                          ? ContactCubit.get(context).insertToDatabase(
                              contactName: nameController.text,
                            )
                          : showDialog(
                              context: context,
                              builder: (_) => AlertDialogCategoray(
                                x: 1,
                                icon: Icon(
                                  Icons.report_problem_rounded,
                                  color: Colors.amberAccent,
                                  size: 45,
                                ),
                                content:
                                    "${getLang(context, "dialog Add Name")}",
                                cancelMethod: () {
                                  Navigator.of(context).pop();
                                },
                                submitMethod: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                    },
                    text: "${getLang(context, "Create")}"),
                // button_save_cancel(nameController: nameController)
              ]),
            ),
          );
        },
      ),
    );
  }
}
