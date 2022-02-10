import 'package:flutter/material.dart';
import 'package:taskBee/widget/Tasks/Public/button_add_cancel.dart';

import '../../card_of_visible_add_task.dart';

class AddPlaces extends StatefulWidget {
  const AddPlaces({Key? key}) : super(key: key);

  @override
  _AddPlacesState createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  double height = 170.0;
  int itemnumber = 1;
  int? number;
  List<TextEditingController> placescontroller = [
    for (int i = 1; i < 9; i++) TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    return CardOfVisibibleAddTask(
        ontap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, set) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: EdgeInsets.all(10),
                      child: Container(
                          padding: EdgeInsets.all(15),
                          width: double.infinity,
                          height: height,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Flexible(
                                child: ListView.builder(
                                    shrinkWrap: false,
                                    itemCount: itemnumber,
                                    itemBuilder: (
                                      context,
                                      index,
                                    ) {
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: TextFormField(
                                                decoration: InputDecoration(
                                                  hintText: 'Add Places',
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  disabledBorder:
                                                      InputBorder.none,
                                                ),
                                                cursorHeight: 25,
                                                controller:
                                                    placescontroller[index],
                                              )),
                                              index == 0
                                                  ? InkWell(
                                                      onTap: () {
                                                        set(() {
                                                          itemnumber =
                                                              itemnumber + 1;
                                                          height = height + 50;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.add,
                                                        size: 30,
                                                        color:
                                                            Color(0xff6F6F6F),
                                                      ),
                                                    )
                                                  : InkWell(
                                                      onTap: () {
                                                        set(() {
                                                          itemnumber =
                                                              itemnumber - 1;
                                                          height = height - 50;
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 30,
                                                        color:
                                                            Color(0xff6F6F6F),
                                                      ),
                                                    )
                                            ],
                                          ),
                                          Container(
                                            height: 2,
                                            child: Divider(
                                              thickness: 1,
                                              color: Color(0xffDADADA),
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              ButtonAddCancel(
                                add: () => setState(() {
                                  number = itemnumber;
                                  Navigator.of(context).pop();
                                }),
                                cancel: () => Navigator.of(context).pop(),
                              )
                            ],
                          )),
                    );
                  },
                );
              });
        },
        title: number == null
            ? Text('place',
                style: TextStyle(
                    color: Color(0xff5A5A5A),
                    fontWeight: FontWeight.bold,
                    fontSize: 15))
            : Text('place  $number',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
        image: 'assets/Tasks/gbs.png');
  }
}
