import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/services/bloc/contact/states.dart';
import 'package:taskBee/widget/Contact/image.dart';
import 'package:taskBee/widget/Wallet/raised_button_wallets.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_text.dart';
import 'package:taskBee/widget/exchange_revenue_categoray/alert_dialog_categoray.dart';
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
          ContactCubit cubit = ContactCubit.get(context);
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
                  controller: nameController =
                      TextEditingController(text: '$contactName'),
                  prefix: Icons.person),
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
                              content: "${getLang(context, "dialog Add Name")}",
                              cancelMethod: () {
                                Navigator.of(context).pop();
                              },
                              submitMethod: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                  },
                  text: "${getLang(context, "Update")}"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 17,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialogCategoray(
                      x: 0,
                      color: Colors.red[700],
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[700],
                      ),
                      content: "${getLang(context, "dialog delete Name")}",
                      cancelMethod: () {
                        Navigator.of(context).pop();
                      },
                      submitMethod: () {
                        cubit.deleteContactFromDatabase(id: contactId);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                    ),
                  );
                },
                child: Text(
                  "${getLang(context, "Delete Name")}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
              )
              // update_button_update_cancel(
              //     contactId: contactId, nameController: nameController)
            ]),
          ));
        },
      ),
    );
  }
}
