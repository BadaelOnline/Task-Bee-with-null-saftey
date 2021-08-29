import 'package:financial/widget/Drawer_Widget.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyHomePage extends StatelessWidget {
  String formattedDate = DateFormat("yyyy MMMM").format(DateTime.now());

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey[600],
        ),
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.asset(
                  'assets/homepage/navigation.png',
                  height: 25,
                  width: 25,
                ),
              ),
              Container(
                child: Image.asset(
                  'assets/homepage/logo-task-bee.png',
                  height: 110,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              formattedDate,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14, left: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Widget_InCome(),
                Widget_Pay(),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
            child: Button_AllTransAction(),
          ),
          Divider(
            color: Colors.amber,
            thickness: 1,
          ),
          First_Section(),
          Divider(
            color: Colors.amber,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SfCalendar(
              todayTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.grey[700]),
              allowedViews: [
                CalendarView.day,
                CalendarView.week,
                CalendarView.month,
                CalendarView.schedule
              ],
              headerHeight: 50,
              allowViewNavigation: true,
              showDatePickerButton: true,
              showNavigationArrow: true,
              todayHighlightColor: Colors.amber[400],
              selectionDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
              showCurrentTimeIndicator: true,
              cellBorderColor: Colors.white,
              scheduleViewSettings: ScheduleViewSettings(
                appointmentItemHeight: 70,
              ),
              view: CalendarView.month,
              dataSource: MeetingDataSource(_getDataSource()),
              monthViewSettings: MonthViewSettings(
                  appointmentDisplayMode:
                      MonthAppointmentDisplayMode.appointment),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Text('Family & Heailth Care',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54)),
          ),
          Family_Health(),
          Container(
            alignment: Alignment.center,
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Text('Business & projects',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54)),
          ),
          Business_Project(),
          Slogan(),
        ],
      )),
    );
  }
}

class Slogan extends StatelessWidget {
  const Slogan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.amber[400]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'One of ',
            style: TextStyle(color: Colors.grey[700]),
          ),
          Text('Badael Online ', style: TextStyle(color: Colors.blueAccent)),
          Text('projects', style: TextStyle(color: Colors.grey[700]))
        ],
      ),
    );
  }
}

class Business_Project extends StatelessWidget {
  const Business_Project({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            children: [
              Image.asset(
                'assets/homepage/work group.png',
                height: 60,
                width: 60,
              ),
              SizedBox(
                height: 5,
              ),
              Text('Work Group')
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/homepage/project.png',
                height: 60,
                width: 60,
              ),
              SizedBox(
                height: 5,
              ),
              Text('Project')
            ],
          ),
        ]),
      ),
    );
  }
}

class Family_Health extends StatelessWidget {
  const Family_Health({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/homepage/pmi.png',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('BMI'),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/homepage/study.png',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Study')
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/homepage/heart.png',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Health'),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/homepage/chilld.png',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Children')
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/homepage/medicen.png',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Medicine'),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/homepage/notes.png',
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Notes')
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class First_Section extends StatelessWidget {
  const First_Section({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/debtsHome'),
                  child: Image.asset(
                    'assets/homepage/qrood.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                Text('Debts')
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/contactHome'),
                  child: Image.asset(
                    'assets/homepage/person.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                Text('Contacts')
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/homepage/dollar.png',
                  height: 40,
                  width: 40,
                ),
                Text('Revnue'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/exchangeHome'),
                  child: Image.asset(
                    'assets/homepage/masaref.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                Text('Expensise')
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/walletHome'),
                  child: Image.asset(
                    'assets/homepage/wallet.png',
                    height: 40,
                    width: 40,
                  ),
                ),
                Text('Wallets')
              ],
            )
          ],
        ));
  }
}

class Button_AllTransAction extends StatelessWidget {
  const Button_AllTransAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: MediaQuery.of(context).size.width * 1,
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
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          'All Transactions',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        ),
      ),
    );
  }
}

class Widget_Pay extends StatelessWidget {
  const Widget_Pay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/expensesHome'),
      child: Container(
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/homepage/minus.png',
                  height: 35,
                  width: 35,
                ),
                Text(
                  'Pay',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ],
            ),
            Column(
              children: [
                Divider(
                  color: Color(0xfff24d4d),
                  thickness: 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '100,500.00 ',
                      style: TextStyle(
                          color: Color(0xfff24d4d),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'S.P',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xfff24d4d),
                  thickness: 0.5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Widget_InCome extends StatelessWidget {
  const Widget_InCome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/revenuesHome'),
      child: Container(
        height: 180,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 5,
            ),
            Column(
              children: [
                Image.asset(
                  'assets/homepage/plus.png',
                  height: 35,
                  width: 35,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Income',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ],
            ),
            Column(
              children: [
                Divider(
                  color: Color(0xff16b6a1),
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '100,500.00 ',
                      style: TextStyle(
                          color: Color(0xff16b6a1),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'S.P',
                      style: TextStyle(
                          color: Color(0xff16b6a1),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  color: Color(0xff16b6a1),
                  thickness: 1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
