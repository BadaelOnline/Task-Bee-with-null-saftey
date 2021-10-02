import 'package:financial/services/bloc/bmi/cubit.dart';
import 'package:financial/services/bloc/bmi/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_liner_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BmiShowResult extends StatelessWidget {
  double? weight;
  double? length;
  double? bmi;
  double? max;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final df = DateFormat('yyyy/MM/dd');
    return Scaffold(
      appBar: CustomAppBar(
          Image(
            image: AssetImage('assets/homepage/pmi.png'),
          ),
          'BMI'),
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
          weight = cubit.getWeight;
          length = cubit.getLength;
          bmi = cubit.getBmi;

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child: Text(
                          'length',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          'weight',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          'bmi',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400)),
                        height: 25,
                        width: 75,
                        child: Center(
                            child: Text(
                          '$length',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400)),
                        height: 25,
                        width: 75,
                        child: Center(
                            child: Text(
                          cubit.getWeight.toString(),
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400)),
                        height: 25,
                        width: 75,
                        child: Center(
                            child: Text(
                          double.parse(cubit.getBmi.toString())
                              .toStringAsFixed(2),
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  ),
                ),
                CustomLinerIndecator(),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        cubit.displayBMIText(),
                        style: TextStyle(
                            color: cubit.colorBMIText(),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      'Body Mass Index (Kg / m ^ 2)',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )),
                    Center(
                        child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        double.parse(cubit.getBmi.toString())
                            .toStringAsFixed(2),
                        style: TextStyle(
                            color: cubit.colorBMIText(),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Preferably your weight is between  : ',
                        style: TextStyle(),
                      ),
                      Text(
                        ' ${cubit.minWeight(length: length).toInt()}  -  ${cubit.maxWeight(length: length).toInt()}  ',
                        style: TextStyle(
                            color: Color(0xff17D1B8),
                            fontWeight: FontWeight.bold),
                      ),
                      Text('(Kg)'),
                    ],
                  ),
                ),
                // Divider(),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 25, horizontal: 1),
                //   child: Text(
                //     'Advice : Your healthy weight needs to be maintained within the normal range',
                //     style: TextStyle(),
                //   ),
                // ),
                Divider(),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                      child:
                          Text('Would you like to add to the BMI archive ?')),
                ),
                TextButton(
                  onPressed: () {
                    BmiCubit.get(context).insertToDateBase(
                      length: length,
                      weight: weight,
                    );
                    print('ok');
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.resolveWith(
                          (states) => Size(100, 25)),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Color(0xff17D1B8))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// getFormatedDate(_date) {
//   var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
//   var inputDate = inputFormat.parse(_date);
//   var outputFormat = DateFormat('dd/MM/yyyy');
//   return outputFormat.format(inputDate);
// }
