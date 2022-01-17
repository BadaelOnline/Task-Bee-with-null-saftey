import 'package:taskBee/common/applocal.dart';
import 'package:taskBee/screens/bmi/bmi_home.dart';
import 'package:flutter/material.dart';
import 'package:taskBee/services/bloc/task/cubit.dart';
import 'package:taskBee/services/bloc/task/states.dart';
import 'muilty_icon_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class Family_Health extends StatelessWidget {
  const Family_Health({
    Key? key,
  }) : super(key: key);

  final duoble = 60.0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    multi_icon_text(
                      icon1: InkWell(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/BmiHome'),
                        child: Image.asset(
                          'assets/homepage/pmi.png',
                          height: duoble,
                          width: duoble,
                        ),
                      ),
                      icon2: Image.asset(
                        'assets/homepage/study.png',
                        height: duoble,
                        width: duoble,
                      ),
                      text1: "${getLang(context, "BMI")}",
                      text2: "${getLang(context, "Study")}",
                    ),
                    multi_icon_text(
                      icon1: Image.asset(
                        'assets/homepage/heart.png',
                        height: duoble,
                        width: duoble,
                      ),
                      icon2: Image.asset(
                        'assets/homepage/chilld.png',
                        height: duoble,
                        width: duoble,
                      ),
                      text1: "${getLang(context, "Health")}",
                      text2: "${getLang(context, "Children")}",
                    ),
                    multi_icon_text(
                      icon1: Image.asset(
                        'assets/homepage/medicen.png',
                        height: duoble,
                        width: duoble,
                      ),
                      icon2: Image.asset(
                        'assets/homepage/notes.png',
                        height: duoble,
                        width: duoble,
                      ),
                      text1: "${getLang(context, "Medicine")}",
                      text2: "${getLang(context, "Notes")}",
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
