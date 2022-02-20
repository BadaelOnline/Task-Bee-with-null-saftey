import 'package:flutter/material.dart';
import 'package:taskBee/widget/Tasks/ButtonContainerFilterTaskHome.dart';
import 'package:taskBee/widget/custom_appBar.dart';

class ViewResultFilterScreen extends StatefulWidget {
  const ViewResultFilterScreen({Key? key}) : super(key: key);

  @override
  _ViewResultFilterScreenState createState() => _ViewResultFilterScreenState();
}

class _ViewResultFilterScreenState extends State<ViewResultFilterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            Image.asset("assets/Tasks/iconTask.png"), 'Filter Tasks'),
        body: Stack(children: [
          Positioned(
              top: MediaQuery.of(context).size.height * 0.01,
              child: Column(children: [
                Container(
                    height: 61,
                    width: MediaQuery.of(context).size.width,
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
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, right: 24, left: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ButtonContainerFilterTaskHome(
                                title: 'Done',
                                icon: Image.asset('assets/Tasks/yes.png'),
                                ontap: () {},
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              ButtonContainerFilterTaskHome(
                                title: 'Pending',
                                icon: Image.asset('assets/Tasks/pending.png'),
                                ontap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
              ]))
        ]));
  }
}
