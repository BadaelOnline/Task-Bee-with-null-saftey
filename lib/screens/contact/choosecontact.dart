import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/services/bloc/contact/states.dart';
import 'package:taskBee/widget/Contact/card_contact.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseContact extends StatefulWidget {
  const ChooseContact({Key? key}) : super(key: key);

  @override
  _ChooseContactState createState() => _ChooseContactState();
}

class _ChooseContactState extends State<ChooseContact> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ContactCubit cubit = ContactCubit.get(context);
        return Scaffold(
            appBar: CustomAppBar(
                Image(
                  image: AssetImage('assets/homepage/person.png'),
                ),
                'Choose Contact'),
            body: ListView.builder(
              itemCount: cubit.contacts!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: CardContact(
                      onTap:(){
                        cubit.choseContact(contact: cubit.contacts![index]);
                        Navigator.of(context).pop();
                      } ,
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
                  ),
                );
              },
            ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/addContact'),
            ));
      },
    );
  }
}
