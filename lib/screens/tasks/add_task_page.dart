import 'package:flutter/material.dart';
import 'package:taskBee/widget/Tasks/Date_Time_tasks/section_date_time.dart';
import 'package:taskBee/widget/Tasks/List_Courses/list_courses.dart';
import 'package:taskBee/widget/Tasks/MoreOpstions/visibility_more_opstions.dart';
import 'package:taskBee/widget/Tasks/Public/buttom_switch.dart';
import 'package:taskBee/widget/Tasks/Public/name_and_image_task.dart';
import 'package:taskBee/widget/Tasks/custom_appbar_add_task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController title = TextEditingController();
  String? type;
  String? image;
  bool isSwitched = false;
  bool visibile1 = false;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    type = arguments['type'];
    image = arguments['image'];
    return Scaffold(
        appBar: CustomAppBarTask(
            Image.asset("assets/Tasks/iconTask.png"), 'Add Task', () {}),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  NameImageTask(
                    type: type.toString(),
                    image: image.toString(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        decoration: new InputDecoration(
                            hintText: type == 'Calls' ? 'Contact' : 'Title'),
                        controller: title,
                      ),
                    ),
                  ),
                  type == 'Lectures'
                      ? SimpleAccountMenu(
                          course: ['Programming', 'Mathmatical', 'Analaysies'],
                          onChange: (index) {
                            print(index);
                          },
                        )
                      : type == 'Calls'
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
  }
}
