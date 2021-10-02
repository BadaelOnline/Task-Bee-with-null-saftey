import 'package:financial/services/bloc/bmi/cubit.dart';
import 'package:financial/services/bloc/bmi/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BmiArchives extends StatelessWidget {
  double? bmi;
  double? getBmi;
  DateTime date = DateTime.now();
  final dateformat = DateFormat('dd/MM/yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            Image(
              image: AssetImage('assets/homepage/pmi.png'),
            ),
            'BMI Archives'),
        body: BlocConsumer<BmiCubit, BmiStates>(
          listener: (context, BmiStates state) {
            if (state is GetBmiArguments) {
              BmiCubit.get(context).getBmi = bmi;
            }
            if (state is InsertBmiToDatabaseState) {
              Navigator.of(context).pushNamed(
                '/BmiArchives',
              );
            }
          },
          builder: (context, state) {
            BmiCubit cubit = BmiCubit.get(context);
            return ListView.builder(
              itemCount: cubit.bmis!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(8),

                  /// color: Colors.white70,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'length',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              '${cubit.bmis![index].length} Cm',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              '${cubit.bmis![index].weight} Kg',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'BMI',
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              '${double.parse(cubit.calculatBmi(weight: cubit.bmis![index].weight, length: cubit.bmis![index].length).toString()).toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dateformat.format(date),
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                              IconButton(
                                onPressed: () {
                                  cubit.deleteBmiFromDataBase(
                                      id: BmiCubit.get(context)
                                          .bmis![index]
                                          .id);
                                },
                                icon: Image.asset(
                                  'assets/homepage/cancel.png',
                                  scale: 10,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Health status',
                            style: TextStyle(
                                color: cubit.colorBMIText(),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            BmiCubit.get(context).displayBMIText(),
                            style: TextStyle(
                                color: cubit.colorBMIText(),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
