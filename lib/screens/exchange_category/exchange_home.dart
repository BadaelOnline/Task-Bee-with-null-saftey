import 'package:financial/common/applocal.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/exchang_category/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:financial/widget/exchange_revenue_categoray/card_categoray.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExchangeCubit, ExchangeStates>(
      listener: (BuildContext context, ExchangeStates state) {},
      builder: (BuildContext context, ExchangeStates state) {
        ExchangeCubit cubit = ExchangeCubit.get(context);
        return Scaffold(
            appBar: CustomAppBar(
                Image(
                  image: AssetImage('assets/homepage/masaref.png'),
                ),
                "${getLang(context, "Expensise")}"),
            body: ListView.builder(
                itemCount: cubit.exchanges!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('/reportpagecategoray', arguments: {
                          'categoryId': cubit.exchanges![index].id,
                          'categoryName': cubit.exchanges![index].name,
                          'categoryIcon': cubit.exchanges![index].icon
                        });
                      },
                      child: Card_Categoray(
                        image: cubit.exchanges![index].icon == ''
                            ? Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                  border: Border.all(
                                    color: Colors.amber[400]!,
                                    width: 2,
                                  ),
                                ),
                              )
                            : Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  image: DecorationImage(
                                    scale: 0.5,
                                    image: AssetImage(
                                        cubit.exchanges![index].icon),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                  border: Border.all(
                                    color: Colors.amber[400]!,
                                    width: 2,
                                  ),
                                ),
                              ),
                        title: cubit.exchanges![index].name,
                        edit: () {
                          Navigator.of(context).pushNamed(
                            '/updateExchange',
                            arguments: {
                              'categoryId': cubit.exchanges![index].id,
                              'categoryName': cubit.exchanges![index].name,
                              'categoryIcon': cubit.exchanges![index].icon,
                            },
                          );
                        },
                      ),
                    ),
                  );
                }),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/addExchange'),
            ));
      },
    );
  }
}
