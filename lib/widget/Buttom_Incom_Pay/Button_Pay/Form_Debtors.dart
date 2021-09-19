import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/Buttom_Incom_Pay/All_Visibility/all_visibiltiy_from_debtors.dart';
import 'package:financial/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/widget_container.dart';
import 'package:financial/widget/Buttom_Incom_Pay/custom_Text_Total.dart';
import 'package:flutter/material.dart';
import '../../custom_raisd_button.dart';
import '../../date_time_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormDebtors extends StatefulWidget {
  const FormDebtors({Key? key}) : super(key: key);

  @override
  _FormDebtorsState createState() => _FormDebtorsState();
}

class _FormDebtorsState extends State<FormDebtors> {
  TextEditingController transactionDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Custom_Text_Total(
                label: 'Total',
              ),
              SizedBox(
                height: 25,
              ),
              BlocConsumer<WalletCubit, WalletStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return widget_Container(
                    image: Image.asset(
                      'assets/homepage/wallet.png',
                      width: 40,
                      height: 40,
                    ),
                    text: WalletCubit.get(context).chosenWallet != null
                        ? WalletCubit.get(context).chosenWallet!.name
                        : 'Wallet',
                    ontap: () =>
                        Navigator.of(context).pushNamed('/choosewallet'),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              BlocConsumer<ContactCubit, ContactStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return widget_Container(
                    image: Image.asset(
                      'assets/homepage/person.png',
                      width: 40,
                      height: 40,
                    ),
                    text: ContactCubit.get(context).chosenContact != null
                        ? ContactCubit.get(context).chosenContact!.name
                        : 'Contact',
                    ontap: () =>
                        Navigator.of(context).pushNamed('/choosecontact'),
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
              DateTimeWidget(
                transactionDateController: transactionDateController,
              ),
              SizedBox(
                height: 25,
              ),
              AllVisibility_Debtors(),
              SizedBox(
                height: 15,
              ),
              CustomRaisdButton(
                text: 'Pay',
              )
            ],
          ),
        ),
      ),
    );
  }
}
