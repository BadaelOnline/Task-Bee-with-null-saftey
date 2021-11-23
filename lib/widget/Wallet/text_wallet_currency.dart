import 'package:financial/common/constant/constants.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';

// ignore: camel_case_types
class Text_Wallet_Name extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final onTap;
  final String? label;
  final IconData? prefix;
  final bool? isClickable;
  // final String? namecurrency;

  const Text_Wallet_Name({
    Key? key,
    this.controller,
    this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.label,
    this.prefix,
    this.isClickable,
    // this.namecurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lang = mySharedPreferences!.getString('lang');
    double height = MediaQuery.of(context).size.height / 13.7;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffeeeeee),
        ),
      ),
      height: height,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: Text(
            label.toString(),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.2,
          height: height,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(lang == 'en' ? 7.5 : 0),
                  bottomLeft: Radius.circular(lang == 'en' ? 7.5 : 0),
                  topRight: Radius.circular(lang == 'en' ? 0 : 7.5),
                  bottomRight: Radius.circular(lang == 'en' ? 0 : 7.5))),
        ),
        Container(
          alignment: Alignment.center,
          height: height,
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]),
            autofocus: false,
            controller: controller,
            keyboardType: type,
            onFieldSubmitted: onSubmit,
            onChanged: onChange,
            enabled: isClickable,
            onTap: onTap,
          ),
        ),
        BlocConsumer<CurrencyCubit, CurrencyStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return InkWell(
              onTap: () => Navigator.of(context).pushNamed('/choosecurrency'),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.2,
                height: height,
                child: Text(
                  CurrencyCubit.get(context).chosenCurrency != null
                      ? CurrencyCubit.get(context).chosenCurrency!.name
                      : kDefaultCurrency.code,
                  style: TextStyle(fontSize: 15),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(lang == 'en' ? 0 : 7.5),
                        bottomLeft: Radius.circular(lang == 'en' ? 0 : 7.5),
                        topRight: Radius.circular(lang == 'en' ? 7.5 : 0),
                        bottomRight: Radius.circular(lang == 'en' ? 7.5 : 0))),
              ),
            );
          },
        ),
      ]),
    );
  }
}
