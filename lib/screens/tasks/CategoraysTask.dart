import 'package:flutter/material.dart';
import 'package:taskBee/services/bloc/task/cubit.dart';
import 'package:taskBee/services/bloc/task/cubit.dart';
import 'package:taskBee/services/bloc/task/states.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorayTask extends StatefulWidget {
  const CategorayTask({Key? key}) : super(key: key);

  @override
  _CategorayTaskState createState() => _CategorayTaskState();
}

class _CategorayTaskState extends State<CategorayTask> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskStates>(
      listener: (BuildContext context, TaskStates state) {},
      builder: (context, state) {
        TaskCubit taskCubit = TaskCubit.get(context);
        return Scaffold(
          appBar:
          CustomAppBar(Image.asset("assets/Tasks/iconTask.png"), 'Tasks Type'),
          body: GridView.builder(
              padding: EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 112,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: taskCubit.taskTypes!.length,
              itemBuilder: (BuildContext ctx, index) {
                return InkWell(
                  onTap: () =>
                      Navigator.of(context).pushNamed('/AddTask',
                          arguments: {
                            'type': taskCubit.taskTypes![index]
                          }),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          child: Image.asset(taskCubit.taskTypes![index].image.toString()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            taskCubit.taskTypes![index].type.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
