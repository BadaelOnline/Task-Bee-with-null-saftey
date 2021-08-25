import 'package:financial/widget/custom_appBar.dart';
import 'package:financial/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DebtsForm extends StatefulWidget {
  @override
  _DebtsFormState createState() => _DebtsFormState();
}

class _DebtsFormState extends State<DebtsForm> {
  String? date;
  String? time;

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
    }
  }

  bool isVisabile = false;
  bool isVisabile2 = false;
  int val = -1;
  // bool value = false;

  TextEditingController totaldebt = TextEditingController();
  TextEditingController installment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Container(
          child: Image(
            image: AssetImage('assets/icons/1.png'),
          ),
        ),
        'Debts',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: FlatButton(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Image(
                        height: 40,
                        image: AssetImage(
                          'assets/icons/2.png',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Contact',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: CustomTextFormField(
                label: 'Total Debt',
                controller: totaldebt,
                // onChange: (String val) {},
                // onSubmit: (String val) {},
                type: TextInputType.number,
                // onTap: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.grey[200],
              child: FlatButton(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Image(
                        height: 40,
                        image: AssetImage(
                          'assets/icons/5.png',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Wallet',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      // border: Border.all(color: Colors.amber[400]!, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            icon: Image.asset(
                              "assets/wallet/clock.png",
                            ),
                            onPressed: () {
                              selectedTodotime(context);
                            }),
                        Center(
                          child: time == null
                              ? Text(TimeOfDay(
                                      minute: timeOfDay.minute,
                                      hour: timeOfDay.hour)
                                  .format(context))
                              : Text(
                                  '$time',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      //border: Border.all(color: Colors.amber[400]!, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            icon: Image.asset("assets/wallet/calendar.png"),
                            onPressed: () {
                              selectedTodoDate(context);
                            }),
                        Center(
                          child: date == null
                              ? Text(DateFormat('yyyy-MM-dd').format(dateTime))
                              : Text(
                                  '$date',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(2),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber[400]!, width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                child: isVisabile == false
                    ? Icon(Icons.arrow_drop_down)
                    : Icon(Icons.arrow_drop_up),
                onTap: () {
                  setState(() {
                    isVisabile = !isVisabile;
                  });
                },
              ),
            ),
            Visibility(
              visible: isVisabile,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'entitlement :',
                          style: TextStyle(color: Colors.blue),
                          textAlign: TextAlign.left,
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  InkWell(
                                    child: isVisabile2 == false
                                        ? Icon(Icons.arrow_drop_down)
                                        : Icon(Icons.arrow_drop_up),
                                    onTap: () {
                                      setState(() {
                                        isVisabile2 = !isVisabile2;
                                      });
                                    },
                                  ),
                                  Text('Installment System'),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: isVisabile2,
                              child: Column(
                                // mainAxisAlignment:
                                //    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Radio(
                                        value: 0,
                                        groupValue: val,
                                        onChanged: (value) {
                                          setState(() {
                                            value = val;
                                          });
                                        },
                                      ),
                                      Text(
                                        'daily',
                                        style: new TextStyle(fontSize: 12.0),
                                      ),
                                      Radio(
                                        value: 1,
                                        groupValue: val,
                                        onChanged: (value) {
                                          setState(() {
                                            value = val;
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
                                        value: 2,
                                        groupValue: val,
                                        onChanged: (value) {
                                          setState(() {
                                            value = val;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Monthly',
                                        style: new TextStyle(fontSize: 12.0),
                                      ),
                                      Radio(
                                        value: 3,
                                        groupValue: val,
                                        onChanged: (value) {
                                          setState(() {
                                            value = val;
                                          });
                                        },
                                        activeColor: Colors.amber,
                                      ),
                                      Text(
                                        'yearly',
                                        style: new TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                  CustomTextFormField(
                                    controller: installment,
                                    label: 'installment',
                                    type: TextInputType.number,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      //border: Border.all(color: Colors.amber[400]!, width: 1.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            icon: Image.asset(
                                              "assets/wallet/calendar.png",
                                              color: Colors.grey,
                                            ),
                                            onPressed: () {
                                              selectedTodoDate(context);
                                            }),
                                        Center(
                                          child: date == null
                                              ? Text(DateFormat('yyyy-MM-dd')
                                                  .format(dateTime))
                                              : Text(
                                                  '$date',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 60,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      //border: Border.all(color: Colors.amber[400]!, width: 1.0),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.notifications,
                                              color: Colors.grey,
                                              size: 35,
                                            )),
                                        Center(
                                          child: Text('Transaction alert'),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: ListTile(
                      leading: Icon(Icons.details),
                      title: Text(
                        'Details',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: ListTile(
                      leading: Icon(Icons.photo),
                      title: Text(
                        'Photos',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.green[400],
                  ),
                  margin: EdgeInsets.all(20),
                  height: 40,
                  width: 120,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                        child: Text(
                      'Receipt',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red[400],
                  ),
                  margin: EdgeInsets.all(20),
                  height: 40,
                  width: 120,
                  child: InkWell(
                    onTap: () {},
                    child: Center(
                        child: Text(
                      'Pay',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
