import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:taskBee/services/bloc/contact/cubit.dart';
import 'package:taskBee/widget/Tasks/Public/card_filter_task.dart';
import 'package:taskBee/widget/custom_appBar.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class FilterTasksScreen extends StatefulWidget {
  const FilterTasksScreen({Key? key}) : super(key: key);

  @override
  _FilterTasksScreenState createState() => _FilterTasksScreenState();
}

class _FilterTasksScreenState extends State<FilterTasksScreen> {
  List<bool> visibile = [];
  List<String> images = [
    'assets/Tasks/other.png',
    'assets/Tasks/clock.png',
    'assets/Tasks/danger.png',
    'assets/homepage/person.png',
    'assets/Tasks/bookb.png',
  ];

  List<String> type = [
    'Type Tasks',
    'Time Duiration',
    'Important',
    'Contacts',
    'Coursess'
  ];
//////////////////////////////////////////////////////// type /////////
  List<ListItem<String>> list = [];
  List<String> selectedType = [];
  void populateData() {
    for (int i = 0; i < 15; i++) list.add(ListItem<String>(name[i]));
  }

  final List image = [
    'assets/Tasks/work.png',
    'assets/Tasks/shopping.png',
    'assets/Tasks/calls.png',
    'assets/Tasks/doctor.png',
    'assets/Tasks/suitable.png',
    'assets/Tasks/travile.png',
    'assets/Tasks/personal.png',
    'assets/Tasks/entertainment.png',
    'assets/Tasks/sport.png',
    'assets/Tasks/exam.png',
    'assets/Tasks/homework.png',
    'assets/Tasks/lectures.png',
    'assets/Tasks/studytimes.png',
    'assets/Tasks/special lesson.png',
    'assets/Tasks/other.png',
  ];
  final List<String> name = [
    'Work',
    'Shopping',
    'Calls',
    'Treatment',
    'Suitable',
    'Travile',
    'Personal',
    'Entertainment',
    'Sport',
    'Exam',
    'Homework',
    'Lectures',
    'Study Times',
    'Special Lesson',
    'Other'
  ];
////////////////////////////////////////////////////////imprtant /////
  List<String> imagesImprtant = [
    'assets/Tasks/A.png',
    'assets/Tasks/B.png',
    'assets/Tasks/C.png',
    'assets/Tasks/D.png',
    'assets/Tasks/E.png'
  ];
  final List<String> important = [
    'very important',
    'important',
    'medium importance',
    'low importance',
    'not important'
  ];
  List<ListItemImportant<String>> listImportant = [];
  List<String> selectedImportant = [];
  void populateDataImportant() {
    for (int i = 0; i < 5; i++)
      listImportant.add(ListItemImportant<String>(imagesImprtant[i]));
  }

///////////////////////////////////////// duration ////
  String? _startDate;
  String? _endDate;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args != null) {
      setState(() {
        _startDate =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString();

        _endDate = DateFormat('dd/MM/yyyy')
            .format(args.value.endDate ?? args.value.startDate)
            .toString();
        print(_startDate);
        print(_endDate);
        type[1] = 'From  ' + '$_startDate' + '  To  ' '$_endDate';
      });
    }
  }

  //////////////////////// list contact////

  List<ListItemContact<String>> listContact = [];
  List<String> selectedContact = [];

  void populateDataContact() {
    ContactCubit cubit = ContactCubit.get(context);
    for (int i = 0; i < cubit.contacts!.length; i++)
      listContact.add(ListItemContact<String>(cubit.contacts![i].name));
    print(cubit.contacts!.length);
  }

  @override
  void initState() {
    super.initState();
    visibile = List<bool>.filled(5, false);
    populateData();
    populateDataImportant();
    populateDataContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Image.asset("assets/Tasks/iconTask.png"), 'Filter Tasks'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, indexx) {
                    return Column(
                      children: [
                        CardFilterTask(
                          ontap: () {
                            setState(() {
                              visibile[indexx] = !visibile[indexx];
                            });
                          },
                          type: Text(
                            type[indexx],
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                          imagee: images[indexx],
                          icon: Transform.rotate(
                            angle: visibile[indexx] == false
                                ? 90 * pi / 180
                                : -90 * pi / 180,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                            ),
                          ),
                        ),
                        Visibility(
                            visible: visibile[indexx],
                            child: indexx == 0
                                ? Container(
                                    height: 400,
                                    child: Flexible(
                                      child: ListView.builder(
                                          itemCount: image.length,
                                          itemBuilder:
                                              (BuildContext ctx, index) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  list[index].isSelected =
                                                      !list[index].isSelected;
                                                  list[index].isSelected == true
                                                      ? selectedType.add(
                                                          list[index]
                                                              .data
                                                              .toString())
                                                      : selectedType.remove(
                                                          list[index]
                                                              .data
                                                              .toString());
                                                  selectedType.isEmpty
                                                      ? type[0] = type[0]
                                                      : type[0] =
                                                          'Tasks Type ' +
                                                              selectedType
                                                                  .length
                                                                  .toString() +
                                                              " " +
                                                              selectedType
                                                                  .join(',');

                                                  print(selectedType);
                                                  print(listContact.length);
                                                });
                                              },
                                              child: Container(
                                                height: 50,
                                                color: list[index].isSelected
                                                    ? Colors.grey[100]
                                                    : Colors.white,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 25,
                                                        height: 25,
                                                        child: Image.asset(
                                                            image[index]
                                                                .toString()),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          name[index]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  )
                                : indexx == 1
                                    ? SfDateRangePicker(
                                        view: DateRangePickerView.month,
                                        selectionMode:
                                            DateRangePickerSelectionMode.range,
                                        onSelectionChanged: _onSelectionChanged,
                                      )
                                    : indexx == 2
                                        ? Container(
                                            height: 250,
                                            child: Flexible(
                                              child: ListView.builder(
                                                  itemCount:
                                                      listImportant.length,
                                                  itemBuilder:
                                                      (BuildContext ctx,
                                                          index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          listImportant[index]
                                                                  .isSelected =
                                                              !listImportant[
                                                                      index]
                                                                  .isSelected;
                                                          listImportant[index]
                                                                      .isSelected ==
                                                                  true
                                                              ? selectedImportant.add(
                                                                  listImportant[
                                                                          index]
                                                                      .important
                                                                      .toString())
                                                              : selectedImportant.remove(
                                                                  listImportant[
                                                                          index]
                                                                      .important
                                                                      .toString());
                                                          listImportant.isEmpty
                                                              ? type[2] =
                                                                  type[2]
                                                              : type[2] = 'Important ' +
                                                                  selectedImportant
                                                                      .length
                                                                      .toString();

                                                          print(listImportant);
                                                          print(listContact
                                                              .length);
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        color:
                                                            listImportant[index]
                                                                    .isSelected
                                                                ? Colors
                                                                    .grey[100]
                                                                : Colors.white,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 25,
                                                                height: 25,
                                                                child: Image.asset(
                                                                    imagesImprtant[
                                                                            index]
                                                                        .toString()),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  important[
                                                                          index]
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          )
                                        : indexx == 3
                                            ? Container(
                                                height: 200,
                                                child: Flexible(
                                                  child: ListView.builder(
                                                      itemCount:
                                                          listContact.length,
                                                      itemBuilder:
                                                          (context, indexxxxx) {
                                                        return InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              listContact[indexxxxx]
                                                                      .isSelected =
                                                                  !listContact[
                                                                          indexxxxx]
                                                                      .isSelected;

                                                              listContact[indexxxxx]
                                                                          .isSelected ==
                                                                      true
                                                                  ? selectedContact.add(listContact[
                                                                          indexxxxx]
                                                                      .contact
                                                                      .toString())
                                                                  : selectedContact.remove(listContact[
                                                                          indexxxxx]
                                                                      .contact
                                                                      .toString());
                                                              listContact
                                                                      .isEmpty
                                                                  ? type[3] =
                                                                      type[3]
                                                                  : type[3] = 'Contacts ' +
                                                                      selectedContact
                                                                          .length
                                                                          .toString() +
                                                                      ' ' +
                                                                      selectedContact
                                                                          .join(
                                                                              ',');
                                                            });
                                                          },
                                                          child: Container(
                                                            color: listContact[
                                                                        indexxxxx]
                                                                    .isSelected
                                                                ? Colors
                                                                    .grey[100]
                                                                : Colors.white,
                                                            height: 50,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                      width: 35,
                                                                      height:
                                                                          35,
                                                                      child: Image
                                                                          .asset(
                                                                              'assets/contact/contact.png')),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    height: 35,
                                                                    child: Text(
                                                                        listContact[indexxxxx]
                                                                            .contact),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                ),
                                              )
                                            : Text('$indexx')),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed('/ViewResultFilterScreen'),
                child: Text(
                  'Ok',
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem<T> {
  bool isSelected = false;
  T data;
  ListItem(this.data);
}

class ListItemImportant<T> {
  bool isSelected = false;
  T important;
  ListItemImportant(this.important);
}

class ListItemContact<T> {
  bool isSelected = false;
  T contact;
  ListItemContact(this.contact);
}
