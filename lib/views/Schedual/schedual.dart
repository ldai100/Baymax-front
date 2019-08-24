
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  Calender({Key key}) : super(key: key);


  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> with TickerProviderStateMixin {

  Map<DateTime, List> _events;  //All events should be based on user
  List _selectedEvents;
  BuildContext _context;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();
    _events = {
      _selectedDay.subtract(Duration(days: 30)): ['Event A0', 'Event B0', 'Event C0'],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): ['Event A2', 'Event B2'],
      _selectedDay.subtract(Duration(days: 16)): ['Event A5', 'Event B5', 'Event C5','Event A5','Event A5','Event A5','Event A5''Event A5','Event A5','Event A5','Event A5','Event A5','Event A5','Event A5'],
      _selectedDay.subtract(Duration(days: 10)): ['Event A5', 'Event B5', 'Event C5','Event A5','Event A5','Event A5','Event A5''Event A5','Event A5','Event A5','Event A5','Event A5','Event A5','Event A5'],
      _selectedDay.subtract(Duration(days: 4)): ['Event A5', 'Event B5', 'Event C5','Event A5','Event A5','Event A5','Event A5''Event A5','Event A5','Event A5','Event A5','Event A5','Event A5','Event A5'],
    };
    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    this._context=context;
    return Scaffold(
      body:Center(child: _buildTableCalendar(),),
    );
  }


  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
        events: _events,
        calendarController: _calendarController,
        //holidays: _holidays,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: CalendarStyle(
          selectedColor: Colors.deepOrange[400],
          todayColor: Colors.deepOrange[200],
          markersColor: Colors.brown[700],
          outsideDaysVisible: false,
        ),
        headerStyle: HeaderStyle(
          formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
          formatButtonDecoration: BoxDecoration(
            color: Colors.deepOrange[400],
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        onDaySelected : _onDaySelected
    );
  }


  void _onDaySelected(DateTime day, List events)
  {
    setState(() {
      _selectedEvents = events;
      if(_selectedEvents.length!=0){
        showAlertDialog(this._context);
      }
    });
  }


  showAlertDialog(BuildContext context) {
    // set up the list options
    List<Widget> myEvents=[];
    for(int i=0;i<this._selectedEvents.length;i++){
      myEvents.add(
          SimpleDialogOption
            (
            child: Container(
              height: 45.0,
              child: Row(children:<Widget>[
                Icon(Icons.watch_later,color: Colors.orange,size: 30.0,),
                SizedBox(width:10.0),
                Text(this._selectedEvents[i])
              ]),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
      );
    }
    SimpleDialog dialog = SimpleDialog(
        title:  Row(children:<Widget>[
          Text(
            'Your Schedual',
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(width:10.0),
          FloatingActionButton(

            child:Icon(Icons.add),
            backgroundColor: Colors.orange,
          ),
        ]),
        children: myEvents
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

}