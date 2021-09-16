import 'package:financial/services/bloc/bmi/cubit.dart';
import 'package:financial/services/bloc/bmi/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiHome extends StatelessWidget {
  TextEditingController lengthController = TextEditingController();
  TextEditingController weightController = TextEditingController();

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
          return Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text('length'),
                    Custom_Text(
                      controller: lengthController,
                      type: TextInputType.number,
                    ),
                    Text('cm'),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Row(
                  children: [
                    Text('weight'),
                    Custom_Text(
                      controller: weightController,
                      type: TextInputType.number,
                    ),
                    Text('Kg'),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  RaisedButton(
                    onPressed: () {},
                    child: Text('calculation'),
                    hoverColor: Color(0xff17D1B8),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    child: Text('archives'),
                    color: Color(0xff17D1B8),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
