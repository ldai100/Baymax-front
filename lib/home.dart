import 'package:flutter/material.dart';
import 'save_history/save_history.dart';
import 'save_history/Detail.dart';

class Home extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
       title: Text('My Flutter App'),
     ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Home'),
         ),
         BottomNavigationBarItem(
           icon: GestureDetector(
               onTap: (){
                 Navigator.push(
                     context,MaterialPageRoute(builder: (context)=>SaveHistory())
                 );
               },
               child: new Icon(Icons.mail)),
           title: new Text('Messages'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile'),
         )
       ],
     ),
     );
  }
}











