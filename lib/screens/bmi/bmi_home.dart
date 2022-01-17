import 'package:taskBee/services/bloc/bmi/cubit.dart';
import 'package:taskBee/services/bloc/bmi/states.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:floor/floor.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class BmiHome extends StatelessWidget {
  TextEditingController lengthController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image(
            image: AssetImage('assets/homepage/pmi.png'),
          ),
          'BMI'),
      body: BlocConsumer<BmiCubit, BmiStates>(
        listener: (context, BmiStates state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'length',
                        style: TextStyle(color: Colors.grey[500], fontSize: 20),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300)),
                        child: TextFormField(
                          controller: lengthController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(color: Colors.grey[500], fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('weight',
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 20)),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300)),
                        child: TextFormField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Text('Kg',
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 20)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          '/BmiArchives',
                        );
                      },
                      child: Text(
                        'archives',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.resolveWith(
                              (states) => Size(100, 25)),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0xff17D1B8))),
                    ),
                    TextButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.resolveWith(
                              (states) => Size(100, 25)),
                          side: MaterialStateBorderSide.resolveWith((states) =>
                              BorderSide(color: Color(0xff17D1B8)))),
                      onPressed: () {
                        bmi = BmiCubit.get(context).calculatBmi(
                          weight: double?.parse(weightController.text),
                          length: double?.parse(lengthController.text),
                        );
                        BmiCubit.get(context).getBmiArguments(
                          bmi: bmi,
                          weight: double?.parse(weightController.text),
                          length: double?.parse(lengthController.text),
                        );
                        Navigator.of(context).pushNamed(
                          '/BmiShowResult',
                        );
                      },
                      child: Text(
                        'calculation',
                        style: TextStyle(color: Color(0xff17D1B8)),
                      ),
                      // hoverColor: Color(0xff17D1B8),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
