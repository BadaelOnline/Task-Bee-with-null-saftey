import 'package:flutter/material.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/services/bloc/contact/states.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseContactTasks extends StatefulWidget {
  ChooseContactTasks({
    Key? key,
  }) : super(key: key);

  @override
  _ChooseContactTasksState createState() => _ChooseContactTasksState();
}

class _ChooseContactTasksState extends State<ChooseContactTasks> {
  String? name;
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactStates>(
      listener: (BuildContext context, ContactStates state) {},
      builder: (BuildContext context, ContactStates state) {
        ContactCubit cubit = ContactCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(
              Image.asset("assets/Tasks/iconTask.png"), 'Select Contact'),
          body: ListView.builder(
            itemCount: cubit.contacts!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        name = cubit.contacts![index].name;
                        number = index;
                        print(name);
                      });
                      Navigator.of(context).pop();
                    },
                    selected: number == index,
                    selectedTileColor: Colors.grey[200],
                    leading: Container(
                        width: 35,
                        height: 35,
                        child: Icon(
                          Icons.person,
                          color: Colors.blue,
                          size: 35,
                        )),
                    title: Text(
                      cubit.contacts![index].name,
                    ),
                  ));
            },
          ),
        );
      },
    );
  }
}
