import 'package:financial/screens/contact/update_contact.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_contact.dart';

class ContactHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactStates>(
      listener: (BuildContext context, ContactStates state) {},
      builder: (BuildContext context, ContactStates state) {
        ContactCubit cubit = ContactCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title: Text('My Contact'),
              centerTitle: true,
              backgroundColor: Colors.amber[400],
            ),
            body:  ListView.builder(
                  itemCount: cubit.contacts!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                              onPressed: () {
                                cubit.deleteContactFromDatabase(
                                    id: cubit.contacts![index].id);
                              },
                          ),
                          contentPadding: EdgeInsets.all(8.0),
                            title: Row(
                              children: [
                                Image.asset(
                                  'assets/image/user.png',
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(cubit.contacts![index].name),
                              ],
                            ),
                            onTap: () {
                            print('contactId: ${cubit.contacts![index].id}');
                            print('contactId: ${cubit.contacts![index].name}');
                              Navigator.of(context).pushNamed(
                                  '/updateContact',
                                  arguments: {
                                    'contactId': cubit.contacts![index].id,
                                    'contactName' :cubit.contacts![index].name
                                  }
                              );
                            }

                            // pushReplacement(
                            //             context,
                            //             MaterialPageRoute(
                            //             builder: (context) => UpdateContact(
                            //         contactId: cubit.contacts![index].id,
                            //         contactName: cubit.contacts![index].name,
                            //       ))),
                    ));
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
