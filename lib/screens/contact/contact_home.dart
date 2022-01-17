import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/services/bloc/contact/states.dart';
import 'package:taskBee/widget/Contact/card_contact.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactHome extends StatefulWidget {
  @override
  _ContactHomeState createState() => _ContactHomeState();
}

class _ContactHomeState extends State<ContactHome> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactStates>(
      listener: (BuildContext context, ContactStates state) {},
      builder: (BuildContext context, ContactStates state) {
        ContactCubit cubit = ContactCubit.get(context);
        return Scaffold(
            appBar: CustomAppBar(
              Image.asset(
                'assets/homepage/person.png',
              ),
              "${getLang(context, "Contact")}",
            ),
            body:
                // Flexible(child: Search_Widget()),
                ListView.builder(
              itemCount: cubit.contacts!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: CardContact(
                    onTap: () => Navigator.of(context).pushNamed(
                        '/previewcontact',
                        arguments: {'contact': cubit.contacts![index]}),
                    delete: () {
                      cubit.deleteContactFromDatabase(
                          id: cubit.contacts![index].id);
                    },
                    edit: () {
                      print('contactId: ${cubit.contacts![index].id}');
                      print('contactId: ${cubit.contacts![index].name}');
                      Navigator.of(context)
                          .pushNamed('/updateContact', arguments: {
                        'contactId': cubit.contacts![index].id,
                        'contactName': cubit.contacts![index].name
                      });
                    },
                    name: cubit.contacts![index].name,
                  ),
                );
              },
            ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed(
                '/addContact',
              ),
            ));
      },
    );
  }
}
