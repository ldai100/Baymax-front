import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

// ...

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        Text('Basic date field (${format.pattern})'),
        DateTimeField(
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },
        ),
      ]),
    );
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("HH:mm");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        Text('Basic time field (${format.pattern})'),
        DateTimeField(
          format: format,
          onShowPicker: (context, currentValue) async {
            final time = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.convert(time);
          },
        ),
      ]),
    );
  }
}
class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        Text('Basic date & time field (${format.pattern})'),
        DateTimeField(
          format: format,
          onShowPicker: (context, currentValue) async {
            final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime:
                TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.combine(date, time);
            } else {
              return currentValue;
            }
          },
        ),
      ]),
    );
  }
}


















class TimePicker extends StatefulWidget {
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePicker> {

  var date; var time;
  Color backgroundColor= Colors.orange;
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () async{
                      var date1= await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate:  DateTime.now(),
                            lastDate: DateTime(2100));
                      setState(() {
                        this.date=date1;
                        print(this.date.toString());
                      });
                      },
                      child: ReusableCard(colour: backgroundColor,
                        cardChild: IconContent(icon:Icon(Icons.calendar_today,size:80.0) ,label: "Date",),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: ()async{
                         var time1 = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime( DateTime.now()),
                        );
                         setState(() {
                           this.time=time1;
                           print(this.time.toString());
                         });
                        return DateTimeField.convert(time);
                      },
                      child: ReusableCard(colour: backgroundColor,
                          cardChild: IconContent(icon: Icon(Icons.watch_later, size:80.0),label: "Time",)),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child:ReusableCard(colour: backgroundColor,cardChild: Column(
                children: <Widget>[
                  Text(getDate()),
                  Text(getTime()),
                ],
              ),),
            ),
          ],
        )
    );
  }

  String getTime(){
    if(this.time!=null){
      return this.time.toString();
    }
    return "";
  }

  String getDate(){
     if(this.date!=null){
       return this.date.toString();
     }
     return "";
  }
}

class IconContent extends StatelessWidget {

  final Icon icon;
  final String label;
  IconContent({this.icon,this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(
            height:15.0
        ),
        Text(label,style: TextStyle(
            fontSize: 18.0,
            //color: Color(0xFF8D8E98)
        ),)
      ],
    );
  }
}



//container
class ReusableCard extends StatelessWidget {

  final Color colour;
  final Widget cardChild;
  ReusableCard({@required this.colour,@required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(15.0),
      child:cardChild,
      decoration: BoxDecoration(
        color:colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}




