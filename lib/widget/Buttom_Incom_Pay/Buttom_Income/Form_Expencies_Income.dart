import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/All_Visibility.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/column_wallet_expancies_contact.dart';
import 'package:financial/widget/Buttom_Incom_Pay/custom_Text_Total.dart';
import 'package:financial/widget/date_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../custom_raisd_button.dart';
import '../custom_text_recive.dart';

// ignore: camel_case_types
class FormExpencies_Income extends StatefulWidget {
  const FormExpencies_Income({Key? key}) : super(key: key);

  @override
  _FormExpencies_IncomeState createState() => _FormExpencies_IncomeState();
}

// ignore: camel_case_types
class _FormExpencies_IncomeState extends State<FormExpencies_Income> {
  TextEditingController totalController = TextEditingController();
  TextEditingController paidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        child: BlocConsumer<TransactionCubit, TransactionStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(children: [
                Custom_Text_Total(
                    label: 'Total',
                    controller: totalController,
                    type: TextInputType.number),
                SizedBox(
                  height: 15,
                ),
                Custom_Text_recive(
                  controller: paidController,
                  label: 'Recived',
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: 25,
                ),
                Column_Wallet_Expancies_contact(),
                SizedBox(
                  height: 25,
                ),
                DateTimeWidget(),
                SizedBox(
                  height: 25,
                ),
                AllVisibility(),
                SizedBox(
                  height: 15,
                ),
                CustomRaisdButton(
                  text: 'Recive',
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}
