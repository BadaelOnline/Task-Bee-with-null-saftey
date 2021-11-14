import 'package:financial/common/applocal.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/contact/states.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/exchang_category/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:flutter/material.dart';
import 'widget_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class Column_Wallet_Expancies_contact extends StatelessWidget {
  final String cat;

  const Column_Wallet_Expancies_contact({Key? key, required this.cat})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<WalletCubit, WalletStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            // print('******************************${WalletCubit.get(context).chosenWallet!.name}');
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
                  : "${getLang(context, "Wallet")}".toString(),
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
        BlocConsumer<ExchangeCubit, ExchangeStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return widget_Container(
              image: Image.asset(
                ExchangeCubit.get(context).chosenCategory != null
                    ? ExchangeCubit.get(context).chosenCategory!.icon
                    : 'assets/homepage/dollar.png',
                height: 40,
                width: 40,
              ),
              text: ExchangeCubit.get(context).chosenCategory != null
                  ? ExchangeCubit.get(context).chosenCategory!.name
                  : cat == 'chooseexchang'
                      ? "${getLang(context, "Expancies item")}".toString()
                      : "${getLang(context, "Revenue item")}".toString(),
              ontap: () => Navigator.of(context).pushNamed('/$cat'),
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
            ContactCubit cubit = ContactCubit.get(context);
            return widget_Container(
              image: Image.asset(
                ExchangeCubit.get(context).chosenCategory != null
                    ? 'assets/contact/group.png'
                    : 'assets/homepage/person.png',
                width: 40,
                height: 40,
              ),
              text: cubit.chosenContact != null
                  ? cubit.chosenContact!.name
                  : "${getLang(context, "Contacts")}".toString(),
              ontap: () => Navigator.of(context).pushNamed('/choosecontact'),
            );
          },
        ),
      ],
    );
  }
}
