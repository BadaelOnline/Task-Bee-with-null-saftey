import 'package:financial/screens/contact/preview_contact/preview_debts.dart';
import 'package:financial/screens/contact/preview_contact/preview_project.dart';
import 'package:financial/screens/contact/preview_contact/preview_tasks.dart';
import 'package:financial/screens/contact/preview_contact/preview_team_work.dart';
import 'package:financial/screens/contact/preview_contact/preview_transaction.dart';
import 'package:financial/widget/Contact/widget_container_contact.dart';
import 'package:flutter/material.dart';

class ColumnContact extends StatefulWidget {
  const ColumnContact({Key? key}) : super(key: key);

  @override
  _ColumnContactState createState() => _ColumnContactState();
}

class _ColumnContactState extends State<ColumnContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Widget_Container_Contact(
          image: Image.asset('assets/contact/alltransaction.png'),
          text: 'Transactions',
          ontap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Preview_Transaction())),
        ),
        SizedBox(
          height: 15,
        ),
        Widget_Container_Contact(
          image: Image.asset('assets/contact/debtes.png'),
          text: 'Debtes',
          ontap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Preview_Debts())),
        ),
        SizedBox(
          height: 15,
        ),
        Widget_Container_Contact(
          image: Image.asset('assets/contact/task.png'),
          text: 'Tasks',
          ontap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Preview_Tasks())),
        ),
        SizedBox(
          height: 15,
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
          height: 15,
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
