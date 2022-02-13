import 'package:flutter/material.dart';
import 'package:taskBee/widget/Tasks/Public/button_add_cancel.dart';
import '../../card_of_visible_add_task.dart';
import 'package:intl/intl.dart';

class AddRepated extends StatefulWidget {
  const AddRepated({
    Key? key,
  }) : super(key: key);

  @override
  _AddRepatedState createState() => _AddRepatedState();
}

class _AddRepatedState extends State<AddRepated> {
  String? addaleart;
  int val = 0;
  int vval = 0;
  late FixedExtentScrollController _controller;
  late FixedExtentScrollController _controllerday;
  String? everytitle;
  String? numbertitle;
  String fortitle = '';
  String? fornumbertitle;
  String? repetition;
  List<String> selectdayofweek = [];
  List<ListItem<String>> list = [];
  void populateData() {
    List<String> day = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    for (int i = 0; i < 7; i++) list.add(ListItem<String>(day[i]));
  }

  List<String> day = ["Day", "Week", "Month"];
  List<String> number = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
  ];

  String? date;
  final DateFormat workerHistoryDateTimeFormat =
      DateFormat('dd MMMM yyyy - h:mm a');

  DateTime dateTime = DateTime.now();

  selectedTodoDate(BuildContext context) async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      dateTime = pickedDate;
      date = DateFormat('yyyy - MMMM - dd').format(pickedDate);
    }
  }

  @override
  void initState() {
    super.initState();
    populateData();
    _controller = FixedExtentScrollController();
    _controllerday = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return CardOfVisibibleAddTask(
        ontap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setStatee) {
                    return Container(
                      color: Color(0xFF737373),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          color: Colors.white,
                        ),
                        child: Wrap(
                          children: [
                            Spacer(),
                            RadioListTile(
                                title: Text('every day'),
                                value: 1,
                                groupValue: val,
                                onChanged: (int? value) {
                                  setStatee(() {
                                    val = value!;
                                  });
                                }),
                            RadioListTile(
                                title: Text('weekly'),
                                value: 2,
                                groupValue: val,
                                onChanged: (int? value) {
                                  setStatee(() {
                                    val = value!;
                                  });
                                }),
                            val == 2
                                ? Flexible(
                                    child: Container(
                                    padding: EdgeInsets.only(left: 15),
                                    alignment: Alignment.center,
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: list.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            setStatee(() {
                                              list[index].isSelected =
                                                  !list[index].isSelected;
                                              list[index].isSelected == true
                                                  ? selectdayofweek.add(
                                                      list[index]
                                                          .data
                                                          .toString())
                                                  : selectdayofweek.remove(
                                                      list[index]
                                                          .data
                                                          .toString());
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color:
                                                          list[index].isSelected
                                                              ? Colors.blue
                                                              : Colors.grey),
                                                  color: list[index].isSelected
                                                      ? Colors.blue
                                                      : Colors.white),
                                              child: Text(
                                                list[index].data,
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ))
                                : SizedBox(
                                    height: 1,
                                  ),
                            val == 3
                                ? SizedBox(
                                    height: 15,
                                  )
                                : SizedBox(
                                    height: 1,
                                  ),
                            RadioListTile(
                                title: val == 3
                                    ? Row(
                                        children: [
                                          Text('every'),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              child: ListWheelScrollView(
                                                useMagnifier: true,
                                                magnification: 1.5,
                                                children: [
                                                  ...number
                                                      .map((String number) {
                                                    return Text(number);
                                                  }).toList()
                                                ],
                                                controller: _controller,
                                                onSelectedItemChanged:
                                                    (value) => numbertitle =
                                                        number[value]
                                                            .toString(),
                                                itemExtent: 20,
                                                perspective: 0.001,
                                                diameterRatio: 1.2,
                                                physics:
                                                    FixedExtentScrollPhysics(),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Container(
                                              width: 80,
                                              height: 40,
                                              child: ListWheelScrollView(
                                                useMagnifier: true,
                                                magnification: 1.5,
                                                children: <Widget>[
                                                  ...day.map((String name) {
                                                    return Text(
                                                      name,
                                                    );
                                                  }).toList()
                                                ],
                                                controller: _controllerday,
                                                itemExtent: 20,
                                                perspective: 0.001,
                                                diameterRatio: 1.2,
                                                onSelectedItemChanged:
                                                    (value) => everytitle =
                                                        day[value].toString(),
                                                physics:
                                                    FixedExtentScrollPhysics(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Text('every'),
                                value: 3,
                                groupValue: val,
                                onChanged: (int? value) {
                                  setStatee(() {
                                    val = value!;
                                  });
                                }),
                            val == 2 || val == 3
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: Column(
                                      children: [
                                        Divider(
                                          thickness: 1,
                                        ),
                                        Text('Duration'),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        RadioListTile(
                                            title: vval == 1
                                                ? Row(
                                                    children: [
                                                      Text('duration'),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Flexible(
                                                        child: Container(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              ListWheelScrollView(
                                                            useMagnifier: true,
                                                            magnification: 1.5,
                                                            children: [
                                                              ...number.map(
                                                                  (String
                                                                      number) {
                                                                return Text(
                                                                    number);
                                                              }).toList()
                                                            ],
                                                            controller:
                                                                _controller,
                                                            onSelectedItemChanged: (value) =>
                                                                fornumbertitle =
                                                                    number[value]
                                                                        .toString(),
                                                            itemExtent: 20,
                                                            perspective: 0.001,
                                                            diameterRatio: 1.2,
                                                            physics:
                                                                FixedExtentScrollPhysics(),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: Container(
                                                          width: 80,
                                                          height: 40,
                                                          child:
                                                              ListWheelScrollView(
                                                            useMagnifier: true,
                                                            magnification: 1.5,
                                                            children: <Widget>[
                                                              ...day.map((String
                                                                  name) {
                                                                return Text(
                                                                  name,
                                                                );
                                                              }).toList()
                                                            ],
                                                            controller:
                                                                _controllerday,
                                                            itemExtent: 20,
                                                            perspective: 0.001,
                                                            diameterRatio: 1.2,
                                                            onSelectedItemChanged:
                                                                (value) => fortitle =
                                                                    day[value]
                                                                        .toString(),
                                                            physics:
                                                                FixedExtentScrollPhysics(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Text('duration'),
                                            value: 1,
                                            groupValue: vval,
                                            onChanged: (int? value) {
                                              setStatee(() {
                                                vval = value!;
                                              });
                                            }),
                                        RadioListTile(
                                            title: vval != 2
                                                ? Text('until')
                                                : Row(
                                                    children: [
                                                      date == null
                                                          ? Text('until')
                                                          : Row(
                                                              children: [
                                                                Text('until'),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  '$date',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15),
                                                                ),
                                                              ],
                                                            )
                                                    ],
                                                  ),
                                            value: 2,
                                            groupValue: vval,
                                            onChanged: (int? value) {
                                              setStatee(() {
                                                vval = value!;
                                                selectedTodoDate(context);
                                              });
                                            }),
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    height: 1,
                                  ),
                            ButtonAddCancel(
                              add: () {
                                setState(() {
                                  ////////////////////////////////////////////////////
                                  ///this is choice case fo user
                                  date == null
                                      ? date = ''
                                      : date = 'For ' + date.toString();
                                  fornumbertitle == null
                                      ? fornumbertitle = ''
                                      : fornumbertitle =
                                          'For ' + fornumbertitle.toString();
                                  fortitle == null
                                      ? fortitle = ''
                                      : fortitle = fortitle;
                                  ///////////////////////////////////////////////////
                                  ///this function for alwan

                                  repetition = val == 1
                                      ? 'Every Day'
                                      : val == 2
                                          ? 'Every ' +
                                              selectdayofweek
                                                  .join(",")
                                                  .toString() +
                                              ' ' +
                                              fornumbertitle.toString() +
                                              ' ' +
                                              fortitle.toString() +
                                              ' ' +
                                              date.toString()
                                          : val == 3
                                              ? 'Every ' +
                                                  numbertitle.toString() +
                                                  ' ' +
                                                  everytitle.toString() +
                                                  ' ' +
                                                  fornumbertitle.toString() +
                                                  ' ' +
                                                  fortitle.toString() +
                                                  date.toString()
                                              : 'every';
                                  Navigator.of(context).pop();
                                });
                              },
                              cancel: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              });
        },
        title: repetition == null
            ? Text('repetition',
                style: TextStyle(
                    color: Color(0xff5A5A5A),
                    fontWeight: FontWeight.bold,
                    fontSize: 15))
            : Text(repetition.toString(),
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
        image: 'assets/Tasks/repeat.png');
  }
}

class ListItem<T> {
  bool isSelected = false;
  T data;
  ListItem(this.data);
}
