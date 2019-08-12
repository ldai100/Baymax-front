import 'package:flutter/material.dart';

import 'homeScreenTopPart.dart';
import 'save_history/save_history.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:HomeScreenTopPart(),
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
             child: Icon(Icons.mail)),
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
