import 'package:financial/common/constant/constants.dart';
import 'package:financial/services/bloc/currency/cubit.dart';
import 'package:financial/services/bloc/currency/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class Text_Installment_debts extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final onTap;
  final String? label;
  final IconData? prefix;
  final bool? isClickable;
  final String? namecurrency;

  const Text_Installment_debts({
    Key? key,
    this.controller,
    this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.label,
    this.prefix,
    this.isClickable,
    this.namecurrency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffeeeeee),
        ),
      ),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: Text(
            label.toString(),
            style: TextStyle(fontSize: 15),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.175,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8))),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: MediaQuery.of(context).size.width * 0.45,
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
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
            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.175,
              height: 50,
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
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8))),
            );
          },
        ),
      ]),
    );
  }
}
