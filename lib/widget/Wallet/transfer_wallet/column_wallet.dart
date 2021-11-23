import 'package:financial/common/applocal.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:flutter/material.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:financial/widget/Wallet/transfer_wallet/custom_container_wallet.dart';

class Column_Wallet extends StatelessWidget {
  const Column_Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Text("${getLang(context, "From Wallet")}")],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        BlocConsumer<WalletCubit, WalletStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container_wallet(
              image: Container(
                  height: 35,
                  width: 35,
                  child: Image.asset(
                      WalletCubit.get(context).chosenWallet != null
                          ? WalletCubit.get(context).chosenWallet!.icon
                          : 'assets/wallet/wallet_gray.png')),
              text: WalletCubit.get(context).chosenWallet != null
                  ? WalletCubit.get(context).chosenWallet!.name
                  : "${getLang(context, "Choose Wallet")}",
              balanc: WalletCubit.get(context).chosenWallet != null
                  ? WalletCubit.get(context).chosenWallet!.balance
                  : '',
              ontap: () => Navigator.of(context).pushNamed('/choosewallet'),
            );
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 30,
        ),
        Row(
          children: [Text("${getLang(context, "To Wallet")}")],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        BlocConsumer<WalletCubit, WalletStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            CurrencyCubit currencyCubit = CurrencyCubit.get(context);
            return Container_wallet(
              image: Container(
                  height: 35,
                  width: 35,
                  child: Image.asset(
                      WalletCubit.get(context).chosenWallet != null
                          ? WalletCubit.get(context).chosenWallet!.icon
                          : 'assets/wallet/wallet_gray.png')),
              text: WalletCubit.get(context).chosenWallet != null
                  ? WalletCubit.get(context).chosenWallet!.name
                  : "${getLang(context, "Choose Wallet")}",
              balanc: WalletCubit.get(context).chosenWallet != null
                  ? WalletCubit.get(context).chosenWallet!.balance
                  : '',
              ontap: () => Navigator.of(context).pushNamed('/choosewallet'),
            );
          },
        ),
      ],
    );
  }
}
