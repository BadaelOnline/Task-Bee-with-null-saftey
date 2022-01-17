import 'package:taskBee/models/contact.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_debts.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_project.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_tasks.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_team_work.dart';
import 'package:taskBee/screens/contact/preview_contact/preview_transaction.dart';
import 'package:taskBee/services/bloc/transaction/cubit.dart';
import 'package:taskBee/services/bloc/transaction/states.dart';
import 'package:taskBee/widget/Contact/widget_container_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColumnContact extends StatelessWidget {
  const ColumnContact({Key? key, this.contact}) : super(key: key);
  final Contact? contact;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 40;
    return Column(
      children: [
        BlocConsumer<TransactionCubit, TransactionStates>(
          listener: (context, state) {
            if (state is GetTransactionsFromDatabaseFOrContactState) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Preview_Transaction()));
            }
          },
          builder: (context, state) {
            return Widget_Container_Contact(
              image: Image.asset('assets/contact/alltransaction.png'),
              text: 'Transactions',
              ontap: () {
                TransactionCubit.get(context)
                    .getTransactionByContactFromDatabase(
                        contactId: contact!.id, walletId: 0, categoryId: 0);
              },
            );
          },
        ),
        SizedBox(
          height: height,
        ),
        Widget_Container_Contact(
          image: Image.asset('assets/contact/debtes.png'),
          text: 'Debtes',
          ontap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Preview_Debts())),
        ),
        SizedBox(
          height: height,
        ),
        Widget_Container_Contact(
          image: Image.asset('assets/contact/task.png'),
          text: 'Tasks',
          ontap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Preview_Tasks())),
        ),
        SizedBox(
          height: height,
        ),
        Widget_Container_Contact(
          image: Container(
            child: Image.asset(
              'assets/contact/group.png',
            ),
          ),
          text: 'Team Work',
          ontap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Preview_TeamWork())),
        ),
        SizedBox(
          height: height,
        ),
        Widget_Container_Contact(
          image: Image.asset('assets/contact/projects.png'),
          text: 'Project',
          ontap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Preview_Project())),
        ),
      ],
    );
  }
}
