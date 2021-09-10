import 'package:financial/widget/Form_Pay_Expencies/2-All_Visibility.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_contact.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_expencies.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_wallet.dart';
import 'package:financial/widget/custom_FormField_pad.dart';
import 'package:financial/widget/date_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:financial/widget/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormExpencies extends StatefulWidget {
  const FormExpencies({Key? key}) : super(key: key);

  @override
  _FormExpenciesState createState() => _FormExpenciesState();
}

class _FormExpenciesState extends State<FormExpencies> {
  TextEditingController totalController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController exchangeIdController = TextEditingController();
  TextEditingController walletIdController = TextEditingController();
  TextEditingController contactIdController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();

  bool isVisabile = false;
  bool isVisabile2 = false;
  bool isVisabile3 = false;
  bool isVisabile4 = false;

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
                CustomTextFormField(
                    label: 'Total',
                    controller: totalController,
                    type: TextInputType.number),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormFieldPayd(
                  controller: paidController,
                  label: 'Paid',
                  type: TextInputType.number,
                ),
                // CustomTextFormField(
                //     label: 'Paid',
                //     controller: paidController,
                //     type: TextInputType.number),
                SizedBox(
                  height: 20,
                ),
                Widget_Container_wallet(),
                SizedBox(
                  height: 20,
                ),
                widget_container_expencies(),
                SizedBox(
                  height: 20,
                ),

                widget_Container_contact(),
                SizedBox(
                  height: 20,
                ),
                //Date_Time_Widget//
                DateTimeWidget(),
                SizedBox(
                  height: 20,
                ),
                //////////////////////////////////////
                //Visibility_Widget_All_widget_Pay
                /////////////////////////////////////
                AllVisibility(),
                SizedBox(
                  height: 50,
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}
