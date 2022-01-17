import 'package:taskBee/services/bloc/currency/cubit.dart';
import 'package:taskBee/services/bloc/currency/states.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyCubit,CurrencyStates>(
      listener: (BuildContext context,CurrencyStates state){},
      builder: (BuildContext context, CurrencyStates state){

        CurrencyCubit cubit = CurrencyCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
              Icon(Icons.wallet_giftcard),
              'My Currency'),
          body:  ListView.builder(
                itemCount: cubit.currencies!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(cubit.currencies![index].name),
                        leading: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            cubit.deleteCurrencyFromDatabase(id: cubit.currencies![index].id);
                          },
                        ),
                        onTap: () => Navigator.of(context).pushNamed('/updateCurrency',
                            arguments: {
                              'currencyId': cubit.currencies![index].id,
                              'currencyName' :cubit.currencies![index].name
                            }),
                      ));
                },
              ),
          floatingActionButton:CustomFloatingActionButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed('/addCurrency'),)
        );
      },
    );
  }
}
