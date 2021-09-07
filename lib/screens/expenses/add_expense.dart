import 'dart:html';

import 'package:financial/widget/Form_Pay_Expencies/widget_container_contact.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_description.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_expencies.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_image.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_repetedtransaction.dart';
import 'package:financial/widget/Form_Pay_Expencies/widget_container_wallet.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:financial/services/bloc/contact/cubit.dart';
import 'package:financial/services/bloc/datepicker/cubit.dart';
import 'package:financial/services/bloc/datepicker/state.dart';
import 'package:financial/services/bloc/exchang_category/cubit.dart';
import 'package:financial/services/bloc/transaction/cubit.dart';
import 'package:financial/services/bloc/transaction/states.dart';
import 'package:financial/services/bloc/wallet/cubit.dart';
import 'package:financial/services/bloc/wallet/states.dart';
import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final ImagePicker _picker = ImagePicker();

  TextEditingController totalController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  TextEditingController transactionDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController exchangeIdController = TextEditingController();
  TextEditingController walletIdController = TextEditingController();
  TextEditingController contactIdController = TextEditingController();
  TextEditingController descreptionController = TextEditingController();

  String? date;
  String? time;

  bool isVisabile = false;
  bool isVisabile2 = false;
  bool isVisabile3 = false;
  bool isVisabile4 = false;

  var val;

  bool adayago = false;
  bool towdayago = false;
  bool sameday = false;

  List<Asset> images = <Asset>[];

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Stack(children: [
          InkWell(
            onTap: () => setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(images);
              }));
            }),
            child: AssetThumb(
              asset: asset,
              width: 250,
              height: 250,
            ),
          ),
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              child: IconButton(
                  icon: Icon(
                    Icons.delete,
                  ),
                  onPressed: () => setState(() {
                        images.removeAt(index);
                      })),
            ),
          )
        ]);
      }),
    );
  }

  List<Asset> resultList = <Asset>[];

  void UploadCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('oops'),
          content: SingleChildScrollView(
            child: Text('sorry wallet balance less than total of transaction'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> loadAssets() async {
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "Camera"),
        materialOptions: MaterialOptions(
          startInAllView: true,
          actionBarColor: "#FCD71B",
          actionBarTitle: "Task Bee",
          allViewTitle: "All Photos",
          selectCircleStrokeColor: "#FCD71B",
          autoCloseOnSelectionLimit: true,
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      // _error = error;
    });
  }

  TimeOfDay timeOfDay = TimeOfDay.now();
  selectedTodotime(BuildContext context) async {
    var pickTime = await showTimePicker(
      context: context,
      initialTime: timeOfDay,
    );
    if (pickTime != null) {
      timeOfDay = pickTime;
      time = TimeOfDay(hour: pickTime.hour, minute: pickTime.minute)
          .format(context);
      DatePickerCubit.get(context).choseDate(date: date, time: time);
    }
  }

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
      date = DateFormat('yyyy-MM-dd').format(pickedDate);
      DatePickerCubit.get(context).choseDate(date: date, time: time);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
            Image(
              image: AssetImage('assets/homepage/masaref.png'),
            ),
            'Pay / Exchange'),
        body: Stack(children: [
          Container(
            height: 40,
            color: Colors.white,
            child: TabBar(
              indicatorColor: Colors.red,
              tabs: [
                Container(
                  child: Text(
                    'Expencies',
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  ),
                ),
                Container(
                  child: Text(
                    'Debtors',
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  ),
                ),
                Container(
                  child: Text(
                    'Projects',
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          TabBarView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                child: BlocConsumer<TransactionCubit, TransactionStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView(children: [
                        CustomTextFormField(
                            label: 'Total',
                            controller: totalController,
                            type: TextInputType.number),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            label: 'Paid',
                            controller: paidController,
                            type: TextInputType.number),
                        SizedBox(
                          height: 20,
                        ),
                        Widget_Container_wallet(),
                        SizedBox(
                          height: 20,
                        ),
                        widget_container_expencies(),
                        SizedBox(
                          height: 20,
                        ),
                        widget_Container_contact(),
                        SizedBox(
                          height: 20,
                        ),
                        //Date_Time_Widget//
                        BlocConsumer<DatePickerCubit, DatePickerStates>(
                          listener: (context, state) {
                            if (state is ChoseDateState) {
                              transactionDateController.text =
                                  DatePickerCubit.get(context).chosenDate!;
                            }
                          },
                          builder: (context, state) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => selectedTodotime(context),
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: Image.asset(
                                            "assets/wallet/clock.png",
                                          ),
                                          iconSize: 40,
                                          onPressed: () => {},
                                        ),
                                        Center(
                                          child: time == null
                                              ? Text(TimeOfDay(
                                                      minute: timeOfDay.minute,
                                                      hour: timeOfDay.hour)
                                                  .format(context))
                                              : Text(
                                                  '$time',
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () => selectedTodoDate(context),
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: Image.asset(
                                            "assets/wallet/calendar.png",
                                          ),
                                          iconSize: 40,
                                          onPressed: () {},
                                        ),
                                        Center(
                                          child: date == null
                                              ? Text(DateFormat('yyyy-MM-dd')
                                                  .format(dateTime))
                                              : Text(
                                                  '$date',
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        //widget_Visibility(11111)
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
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
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: InkWell(
                            child: isVisabile == false
                                ? Icon(
                                    Icons.arrow_drop_down,
                                    size: 35,
                                  )
                                : Icon(
                                    Icons.arrow_drop_up,
                                    size: 35,
                                  ),
                            onTap: () {
                              setState(() {
                                isVisabile = !isVisabile;
                              });
                              //
                            },
                          ),
                        ),
                        //////////////////////////////////////
                        //Visibility_Widget_All_widget_Pay
                        /////////////////////////////////////
                        Visibility(
                          visible: isVisabile,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVisabile2 = !isVisabile2;
                                    });
                                  },
                                  child: Widget_Container_Repatedtransaction(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                //////////////////////////////////////
                                //Visibility_Widget_RepetedTranaction
                                /////////////////////////////////////
                                Visibility(
                                  visible: isVisabile2,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5, bottom: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Repeated :',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Radio(
                                            value: 1,
                                            groupValue: val,
                                            onChanged: (value) {
                                              setState(() {
                                                val = value;
                                              });
                                            },
                                          ),
                                          Text(
                                            'daily',
                                            style:
                                                new TextStyle(fontSize: 12.0),
                                          ),
                                          Radio(
                                            value: 2,
                                            groupValue: val,
                                            onChanged: (value) {
                                              setState(() {
                                                val = value;
                                              });
                                            },
                                          ),
                                          Text(
                                            'weekly',
                                            style: new TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          Radio(
                                            value: 3,
                                            groupValue: val,
                                            onChanged: (value) {
                                              setState(() {
                                                val = value;
                                              });
                                            },
                                          ),
                                          Text(
                                            'Monthly',
                                            style:
                                                new TextStyle(fontSize: 12.0),
                                          ),
                                          Radio(
                                            value: 4,
                                            groupValue: val,
                                            onChanged: (value) {
                                              setState(() {
                                                val = value;
                                              });
                                            },
                                          ),
                                          Text(
                                            'yearly',
                                            style:
                                                new TextStyle(fontSize: 12.0),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 5, bottom: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Transaction alert :',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: adayago,
                                            onChanged: (value) {
                                              setState(() {
                                                adayago = !adayago;
                                              });
                                            },
                                          ),
                                          Text('Before one day'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: towdayago,
                                            onChanged: (value) {
                                              setState(() {
                                                towdayago = !towdayago;
                                              });
                                            },
                                          ),
                                          Text('Before Two days'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: sameday,
                                            onChanged: (value) {
                                              setState(() {
                                                sameday = !sameday;
                                              });
                                            },
                                          ),
                                          Text('At the same time'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVisabile3 = !isVisabile3;
                                    });
                                  },
                                  child: Widget_Container_Image(),
                                ),
                                //////////////////////////////////////
                                //Visibility_Widget_Image
                                /////////////////////////////////////
                                Visibility(
                                    visible: isVisabile3,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 175,
                                            child: Column(
                                              children: <Widget>[
                                                InkWell(
                                                  onTap: loadAssets,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(Icons
                                                              .add_a_photo_outlined),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "Upload Image",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          IconButton(
                                                              onPressed:
                                                                  UploadCamera,
                                                              icon: Icon(Icons
                                                                  .add_a_photo))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: buildGridView(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVisabile4 = !isVisabile4;
                                    });
                                  },
                                  child: Widget_container_descreption(),
                                ),

                                //////////////////////////////////////
                                //Visibility_Widget_description
                                /////////////////////////////////////
                                Visibility(
                                  visible: isVisabile4,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6, left: 6, right: 6),
                                    child: Container(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Enter your note',
                                        ),
                                        controller: descreptionController,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        BlocConsumer<WalletCubit, WalletStates>(
                          listener: (context, WalletStates state) {
                            if (state is UpdateWalletsToDatabaseState) {
                              Navigator.of(context).pop();
                            }
                          },
                          builder: (context, WalletStates state) {
                            return FlatButton(
                                child: Text('save'),
                                onPressed: () {
                                  int cId = ContactCubit.get(context)
                                      .getContactId(
                                          contactName:
                                              contactIdController.text);
                                  int eId = ExchangeCubit.get(context)
                                      .getExchangeId(
                                          exchangeName:
                                              exchangeIdController.text);
                                  int wId = WalletCubit.get(context)
                                      .getWalletId(
                                          walletName: walletIdController.text);
                                  String walIcon = WalletCubit.get(context)
                                      .getWalletIcon(
                                          walletName: walletIdController.text);
                                  String walletBalance =
                                      WalletCubit.get(context).getWalletBalance(
                                          walletName: walletIdController.text);
                                  int walBal = int.parse(walletBalance);
                                  if (eId != null &&
                                      wId != null &&
                                      cId != null) {
                                    if (int.parse(totalController.text) <=
                                        walBal) {
                                      TransactionCubit.get(context)
                                          .insertToDatabase(
                                        contactId: cId,
                                        description: descriptionController.text,
                                        exchangeId: eId,
                                        paid: paidController.text,
                                        rest:
                                            '${int.parse(totalController.text) - int.parse(paidController.text)}',
                                        total: totalController.text,
                                        isIncome: 1,
                                        transactionDate:
                                            '${date != null ? date : DateFormat('yyyy-MM-dd').format(dateTime)} ${time != null ? time : TimeOfDay(minute: timeOfDay.minute, hour: timeOfDay.hour).format(context)}',
                                        walletId: wId,
                                      );
                                      String walletBalance =
                                          WalletCubit.get(context)
                                              .getWalletBalance(
                                                  walletName:
                                                      walletIdController.text);
                                      int currencyId = WalletCubit.get(context)
                                          .getWalletCurrency(
                                              walletName:
                                                  walletIdController.text);
                                      int newBalance =
                                          int.parse(walletBalance) -
                                              int.parse(totalController.text);
                                      if (walletBalance != null &&
                                          currencyId != null) {
                                        WalletCubit.get(context)
                                            .updateWalletDatabase(
                                                isId: wId,
                                                icon: walIcon,
                                                walletName:
                                                    walletIdController.text,
                                                walletBalance: '$newBalance',
                                                currencyId: currencyId);
                                      }
                                    } else {
                                      _showMyDialog(context);
                                    }
                                  }
                                });
                          },
                        )
                      ]),
                    );
                  },
                ),
              ),
            ),
            Icon(Icons.ac_unit),
            Icon(Icons.ac_unit),
          ])
        ]),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  List<Asset> images = <Asset>[];
  DetailScreen(this.images);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) => Container(
                      margin: EdgeInsets.all(4),
                      width: MediaQuery.of(context).size.width,
                      child: AssetThumb(
                        quality: 100,
                        width: 600,
                        height: 800,
                        asset: images[index],
                      ),
                    ))));
  }
}
