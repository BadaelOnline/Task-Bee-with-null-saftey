import 'package:taskBee/services/bloc/currency/cubit.dart';
import 'package:taskBee/services/bloc/currency/states.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseCurrency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyCubit, CurrencyStates>(
      listener: (BuildContext context, CurrencyStates state) {},
      builder: (BuildContext context, CurrencyStates state) {
        CurrencyCubit cubit = CurrencyCubit.get(context);
        return Scaffold(
            appBar:
                CustomAppBar(Icon(Icons.wallet_giftcard), 'Choose Currency'),
            body: ListView.builder(
              itemCount: cubit.currencies!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child: Card(
                      child: ListTile(
                    contentPadding: EdgeInsets.all(8.0),
                    title: Center(
                      child: Text(
                        cubit.currencies![index].name,
                      ),
                    ),
                    onTap: () {
                      cubit.choseCurrency(currency: cubit.currencies![index]);
                      Navigator.of(context).pop();
                    },
                  )),
                );
              },
            ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/addCurrency'),
            ));
      },
    );
  }
}
