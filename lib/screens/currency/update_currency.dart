import 'package:taskBee/services/bloc/currency/cubit.dart';
import 'package:taskBee/services/bloc/currency/states.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UpdateCurrency extends StatelessWidget {
  int? currencyId;
  String? currencyName;

  TextEditingController nameController = TextEditingController();

  UpdateCurrency({Key? key, this.currencyId, this.currencyName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    currencyId = arguments['currencyId'];
    currencyName = arguments['currencyName'];
    return Scaffold(
      appBar: CustomAppBar(Icon(Icons.wallet_giftcard), 'Update Currency'),
      body: BlocConsumer<CurrencyCubit, CurrencyStates>(
        listener: (context, state) {
          if (state is UpdateCurrencyToDatabaseState) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return ListView(children: [
            SizedBox(
              height: 20,
            ),
            Custom_Text(
                label: 'Name Currency',
                controller: nameController =
                    TextEditingController(text: '$currencyName'),
                prefix: Icons.money,
                onTap: () {},
                type: TextInputType.text),
            SizedBox(
              height: 50,
            ),
            TextButton(
                child: Text('save'),
                onPressed: () {
                  CurrencyCubit.get(context).updateCurrencyDatabase(
                    isId: currencyId,
                    currencyName: nameController.text,
                  );
                })
          ]);
        },
      ),
    );
  }
}
