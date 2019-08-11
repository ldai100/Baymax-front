
import 'package:flutter/material.dart';
import 'Refesh.dart';
import 'package:flutter_first_app/views/Draw.dart';

class SaveHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Save Page"),
        ),

        body: SafeArea(
      child: Container(
       // child:new View()
        child:Refresh()
      ),
    ));
  }
}
//using refresh








class View extends StatelessWidget {
  const View({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Container> list=[];



    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(child: Text('D')),
          title: Text('1'),
          subtitle: Text('Sample Data'),
        ),
        ListTile(
          leading: CircleAvatar(child: Text('D')),
          title: Text('1'),
          subtitle: Text('Sample Data'),
        ),
        ListTile(
          leading: CircleAvatar(child: Text('D')),
          title: Text('1'),
          subtitle: Text('Sample Data'),
        ),
        ListTile(
         leading: CircleAvatar(child: Text('D')),
         title: Text('1'),
         subtitle: Text('Sample Data'),
       ),
        ListTile(
          leading: CircleAvatar(child: Text('D')),
          title: Text('1'),
          subtitle: Text('Sample Data'),
        ),
      ],
    );
  }
}

