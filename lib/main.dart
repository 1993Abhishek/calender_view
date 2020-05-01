import 'package:calenderview/meeting.dart';
import 'package:calenderview/meeting_data_source.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calender View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  CalendarController _calendarController;

//  Map<CalendarFormat, String> _calenderFormat= [
//    CalendarFormat.week = "week"
//  ]

  bool _isWeekView = true;

  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _selectedDay = DateTime.now();

//    _calendarController = CalendarController();
//    _events = _events = {
//      _selectedDay.subtract(Duration(days: 30)): [
//        'Event A0',
//        'Event B0',
//        'Event C0'
//      ],
//      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
//      _selectedDay.subtract(Duration(days: 20)): [
//        'Event A2',
//        'Event B2',
//        'Event C2',
//        'Event D2'
//      ],
//      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
//      _selectedDay.subtract(Duration(days: 10)): [
//        'Event A4',
//        'Event B4',
//        'Event C4'
//      ],
//      _selectedDay.subtract(Duration(days: 4)): [
//        'Event A5',
//        'Event B5',
//        'Event C5'
//      ],
//      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
//      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
//      _selectedDay.add(Duration(days: 1)): [
//        'Event A8',
//        'Event B8',
//        'Event C8',
//        'Event D8'
//      ],
//      _selectedDay.add(Duration(days: 3)):
//          Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
//      _selectedDay.add(Duration(days: 7)): [
//        'Event A10',
//        'Event B10',
//        'Event C10'
//      ],
//      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
//      _selectedDay.add(Duration(days: 17)): [
//        'Event A12',
//        'Event B12',
//        'Event C12',
//        'Event D12'
//      ],
//      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
//      _selectedDay.add(Duration(days: 26)): [
//        'Event A14',
//        'Event B14',
//        'Event C14'
//      ],
//    };
    _selectedEvents = [];
  }

  List<Meeting> _getDataSource() {
    List<Meeting> meetings = [];
    final DateTime tomorrow = DateTime.now().add(Duration(days: 1));
    final DateTime startTime2 = DateTime(
      tomorrow.year,
      tomorrow.month,
      tomorrow.day,
      10,
      0,
      0,
    );
    final DateTime endTime2 = startTime2.add(
      const Duration(
        hours: 2,
        minutes: 40,
      ),
    );
    meetings.add(Meeting(
      'Clients Meeting',
      startTime2,
      endTime2,
      Colors.brown,
      false,
    ));

    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(
      today.year,
      today.month,
      today.day,
      13,
      30,
      45,
    );

    final DateTime endTime = startTime.add(
      const Duration(
        hours: 2,
      ),
    );
    meetings.add(
      Meeting(
        'Conference',
        startTime,
        endTime,
        const Color(0xFF0F8644),
        false,
      ),
    );
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: Padding(
          padding: EdgeInsets.only(top:10.0),
          child: AppBar(
//          centerTitle: true,
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.blue,
              ),
//          borderRadius: BorderRadius.all(
//            Radius.circular(40.0),
//          ),
            ),
            bottomOpacity: 0.5,
            backgroundColor: Colors.blueGrey,
            elevation: 3,
            toolbarOpacity: 0.6,
            title: Padding(
              padding: EdgeInsets.only(top: 40.0, left: 185),
              child: Text("Calendar"),
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
//              TableCalendar(
//                events: _events,
//                calendarController: _calendarController,
//                initialCalendarFormat: CalendarFormat.week,
//                dayHitTestBehavior: HitTestBehavior.translucent,
//              )
              Center(
                child: Card(
                  elevation: 5,
                  child: Text(
                    " Click to Change the Calendar View.. ",
                    style: TextStyle(
                      color: Colors.teal,
                      backgroundColor: Colors.lime,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Center(
                child: Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              Container(
                height: 10,
              ),
              _isWeekView
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _isWeekView = false;
                        });
                      },
                      child: Center(
                          child: Container(
                        height: 100,
                        width: 100,
                        child: Card(
                          elevation: 10,
                          color: Colors.amberAccent,
                          child: Center(
                            child: Text(
                              "Week View",
                            ),
                          ),
                        ),
                      )),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          _isWeekView = true;
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Card(
                            elevation: 10,
                            color: Colors.indigo,
                            child: Center(
                              child: Text(
                                "Day View",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              Container(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 480,
                child: Card(
                  elevation: 5,
                  child: SfCalendar(
                    view: _isWeekView ? CalendarView.week : CalendarView.day,
                    dataSource: MeetingDataSource(_getDataSource()),
                    monthViewSettings: MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment,
                    ),
                    initialDisplayDate: DateTime.now(),
                    appointmentTextStyle: TextStyle(fontSize: 18),
                    cellBorderColor: Colors.redAccent,
                    backgroundColor: Colors.greenAccent,
                    timeSlotViewSettings: TimeSlotViewSettings(
                      startHour: 10,
                      endHour: 19,
                      nonWorkingDays: <int>[DateTime.friday, DateTime.saturday],
                    ),
                    headerStyle: CalendarHeaderStyle(
                      textStyle: TextStyle(color: Colors.black54,fontSize: 22,),
                      textAlign: TextAlign.center,
                      backgroundColor: Colors.orange,
                    ),
                    firstDayOfWeek: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
