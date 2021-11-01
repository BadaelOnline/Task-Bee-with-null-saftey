import 'package:financial/models/bmi.dart';
import 'package:financial/services/bloc/bmi/cubit.dart';
import 'package:financial/services/bloc/bmi/states.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLinerIndecator extends StatelessWidget {
  double? bmi;
  // final CircleAvatar icon;

  // final String type;
  // final Function choseIcon;
  // final String totalExchange;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit, BmiStates>(
        listener: (context, BmiStates state) {
      if (state is GetBmiArguments) {
        BmiCubit.get(context).getBmi = bmi;
      }
    }, builder: (context, state) {
      BmiCubit cubit = BmiCubit.get(context);
      bmi = cubit.getBmi;

      return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.blue, Colors.green, Colors.orange, Colors.red],
        )),
        child: LinearPercentIndicator(
          //leaner progress bar
          animation: true,
          animationDuration: 1000,
          lineHeight: 70.0,
          percent: bmi! / 100,
          // curve: Curves.linearToEaseOut,
          linearStrokeCap: LinearStrokeCap.butt,
          clipLinearGradient: true,
          padding: EdgeInsets.all(35),

          progressColor: Colors.white10,
          widgetIndicator: Column(
            children: [
              Icon(
                Icons.arrow_drop_up,
                size: 45,
                color: Colors.white,
              ),
              Text(
                double.parse(cubit.getBmi.toString()).toStringAsFixed(2),
                style: TextStyle(color: Colors.black38),
              ),
            ],
          ),

          backgroundColor: Colors.white10,

          // linearGradientBackgroundColor: LinearGradient(colors: [
          //   Colors.blue,
          //   Colors.green,
          // ], tileMode: TileMode.clamp),
        ),
      );
    });
  }
}
