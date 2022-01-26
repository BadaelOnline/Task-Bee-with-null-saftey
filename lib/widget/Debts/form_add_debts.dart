import 'package:flutter/material.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/services/bloc/contact/states.dart';
import 'package:taskBee/services/bloc/exchang_category/cubit.dart';
import 'package:taskBee/services/bloc/wallet/cubit.dart';
import 'package:taskBee/services/bloc/wallet/states.dart';
import 'package:taskBee/widget/Buttom_Incom_Pay/Column_wallet_Expancies_Contact/widget_container.dart';
import 'package:taskBee/widget/Debts/all_visibility_debts.dart';
import 'package:taskBee/widget/Wallet/text_wallet_balance.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../date_time_widget.dart';
import '../note_when_you_add_transaction.dart';

// ignore: camel_case_types
class Form_Add_Debts extends StatefulWidget {
  const Form_Add_Debts({Key? key}) : super(key: key);

  @override
  _Form_Add_DebtsState createState() => _Form_Add_DebtsState();
}

// ignore: camel_case_types
class _Form_Add_DebtsState extends State<Form_Add_Debts> {
  String? date;
  String? time;
  TextEditingController datetime = TextEditingController();
  TextEditingController total = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 20,
        ),
        child: Column(
          children: [
            BlocConsumer<ContactCubit, ContactStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                ContactCubit cubit = ContactCubit.get(context);
                return widget_Container(
                  image: Image.asset(
                      ExchangeCubit.get(context).chosenCategory != null
                          ? 'assets/contact/group.png'
                          : 'assets/homepage/person.png',
                      width: 40,
                      height: 40),
                  text: cubit.chosenContact != null
                      ? cubit.chosenContact!.name
                      : 'Contact',
                  ontap: () =>
                      Navigator.of(context).pushNamed('/choosecontact'),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text_Wallet_Balance(
              label: 'Total',
              controller: total,
              type: TextInputType.number,
            ),
            // COntainer2currency(
            //   label: 'Amount',
            // ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<WalletCubit, WalletStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return widget_Container(
                  image: Image.asset(
                    WalletCubit.get(context).chosenWallet != null
                        ? WalletCubit.get(context).chosenWallet!.icon
                        : 'assets/homepage/wallet.png',
                    width: 40,
                    height: 40,
                  ),
                  text: WalletCubit.get(context).chosenWallet != null
                      ? WalletCubit.get(context).chosenWallet!.name
                      : 'Wallet',
                  balanc: WalletCubit.get(context).chosenWallet != null
                      ? WalletCubit.get(context).chosenWallet!.balance
                      : '',
                  ontap: () => Navigator.of(context).pushNamed('/choosewallet'),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            Note_when_you_add_transaction(),
            SizedBox(
              height: 25,
            ),
            // Exchang_Currency(),

            DateTimeWidget(
              transactionDateController: datetime,
            ),
            SizedBox(
              height: 20,
            ),

            AllVisibility_Debts(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green[400],
                  ),
                  margin: EdgeInsets.all(20),
                  height: 40,
                  width: 120,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                        child: Text(
                      'Receipt',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red[400],
                  ),
                  margin: EdgeInsets.all(20),
                  height: 40,
                  width: 120,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                        child: Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
