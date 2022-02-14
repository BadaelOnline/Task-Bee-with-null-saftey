import 'package:flutter/material.dart';
import 'package:taskBee/models/task/task_type.dart';
import 'package:taskBee/services/bloc/task/cubit.dart';
import 'package:taskBee/services/bloc/task/states.dart';
import 'package:taskBee/widget/Tasks/Date_Time_tasks/section_date_time.dart';
import 'package:taskBee/widget/Tasks/List_Courses/list_courses.dart';
import 'package:taskBee/widget/Tasks/MoreOpstions/visibility_more_opstions.dart';
import 'package:taskBee/widget/Tasks/Public/buttom_switch.dart';
import 'package:taskBee/widget/Tasks/Public/name_and_image_task.dart';
import 'package:taskBee/widget/Tasks/custom_appbar_add_task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController title = TextEditingController();
  TaskType? type;
  bool isSwitched = false;
  bool visibile1 = false;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    type = arguments['type'];
    return BlocConsumer<TaskCubit, TaskStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        TaskCubit taskCubit = TaskCubit.get(context);
        return Scaffold(
            appBar: CustomAppBarTask(
                Image.asset("assets/Tasks/iconTask.png"),
                'Add Task',
                    () {
                  taskCubit.insertTaskToDatabase(
                      taskName: title.text,
                      stDate: 'stDate',
                      enDate: 'enDate',
                      stTime: 'stTime',
                      enTime: 'enTime',
                      isAllDay: 1,
                      isActive: 1,
                      isAppear: 1,
                      typeId: type!.id,
                      importanceId: 1,
                      statusId: 1
                  );
                    }),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(children: [
                      NameImageTask(
                        type: type!.type.toString(),
                        image: type!.image.toString(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            decoration: new InputDecoration(
                                hintText: type!.type == 'Calls'
                                    ? 'Contact'
                                    : 'Title'),
                            controller: title,
                          ),
                        ),
                      ),
                      type!.type == 'Lectures'
                          ? SimpleAccountMenu(
                              course: taskCubit.course,
                              onChange: (index) {
                                print(index);
                              },
                            )
                          : type!.type == 'Calls'
                              ? Container(
                                  height: 35,
                                  width: 35,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                        'assets/Tasks/call_contact.png'),
                                  ),
                                )
                              : SizedBox(
                                  width: 1,
                                )
                    ]),
                    SectionDateTime(),
                    ButtomSwitch(),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    VisibilityMoreOptions()
                  ],
                ),
              ),
            ));
      },
    );
  }
}
