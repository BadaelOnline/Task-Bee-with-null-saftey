import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SfCalendar(
        todayTextStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey[700]),
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
        monthViewSettings: MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
      ),
    );
  }
}
