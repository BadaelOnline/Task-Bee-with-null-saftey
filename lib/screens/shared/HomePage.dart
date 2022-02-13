import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/widget/Drawer_Widget.dart';
import 'package:taskBee/widget/Home_Page/Muilty_Icon_Group/section_group.dart';
import 'package:taskBee/widget/Home_Page/Business_Group/business_group.dart';
import 'package:taskBee/widget/Home_Page/Family_Heath_Group/family_health_group.dart';
import 'package:taskBee/widget/Home_Page/Public_Widget/appbar.dart';
import 'package:taskBee/widget/Home_Page/Public_Widget/buttom_all_transaction.dart';
import 'package:taskBee/widget/Home_Page/Public_Widget/container_income.dart';
import 'package:taskBee/widget/Home_Page/Public_Widget/container_pay.dart';
import 'package:taskBee/widget/Home_Page/Public_Widget/container_subject_title.dart';
import 'package:taskBee/widget/Home_Page/Public_Widget/end_text.dart';
import 'package:taskBee/widget/Home_Page/Public_Widget/first_date.dart';
import 'package:flutter/material.dart';
import 'package:taskBee/widget/Home_Page/Section_Tasks/tasks.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FirstDate(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14, left: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContainerPay(),
                ContainerIncome(),
              ],
            ),
          ),
          Button_AllTransAction(),
          Divider(
            color: Colors.amber,
            thickness: 1,
          ),
          Section_Group(),
          Divider(
            color: Colors.amber,
            thickness: 1,
          ),
          SectionTasks(),
          Title_container(
            text: "${getLang(context, "Family & Heailth Care")}",
          ),
          Family_Health(),
          Title_container(
            text: "${getLang(context, "Business & prjects")}",
          ),
          Business_Project(),
          Slogan(),
        ],
      )),
    );
  }
}
