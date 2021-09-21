import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/exchang_category/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseRevenue extends StatefulWidget {
  const ChooseRevenue({Key? key}) : super(key: key);

  @override
  _ChooseRevenueState createState() => _ChooseRevenueState();
}

class _ChooseRevenueState extends State<ChooseRevenue> {
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
              itemCount: cubit.revenues!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    cubit.choseCategory(category: cubit.revenues![index]);
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
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8.0),
                                child: cubit.revenues![index].icon == ''
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
                                                cubit.revenues![index].icon),
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
                                    cubit.revenues![index].name,
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
