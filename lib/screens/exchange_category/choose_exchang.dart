import 'package:taskBee/services/bloc/exchang_category/cubit.dart';
import 'package:taskBee/services/bloc/exchang_category/cubit.dart';
import 'package:taskBee/services/bloc/exchang_category/states.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:taskBee/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseExchang extends StatefulWidget {
  const ChooseExchang({Key? key}) : super(key: key);

  @override
  _ChooseExchangState createState() => _ChooseExchangState();
}

class _ChooseExchangState extends State<ChooseExchang> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExchangeCubit, ExchangeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ExchangeCubit cubit = ExchangeCubit.get(context);
        return Scaffold(
            appBar: CustomAppBar(
                Image(
                  image: AssetImage('assets/homepage/masaref.png'),
                ),
                'Choose Expancies'),
            body: ListView.builder(
              itemCount: cubit.exchanges!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    cubit.choseCategory(category: cubit.exchanges![index]);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(1),
                    color: Colors.white,
                    child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child: cubit.exchanges![index].icon == ''
                                    ? Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(100.0)),
                                    border: Border.all(
                                      color: Colors.amber[400]!,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    cubit.exchanges![index].name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                            ],
                          ),

                        ],
                      ),
                    ]),
                  ),
                );
              },
            ),
            floatingActionButton: CustomFloatingActionButton(
              icon: Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed('/addExchange'),
            ));
      },
    );
  }
}
