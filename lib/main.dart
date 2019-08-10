import 'package:flutter/material.dart';
import 'CustomShapeClipper.dart';
import 'save_history/save_history.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'My Flutter App',
     home: HomeScreen(),
   );
 }}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
        ],
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

class HomeScreenTopPart extends StatefulWidget {

  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {

  var isBabySelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            color: Colors.orange,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.location_on,color: Colors.white,),
                      tooltip: 'comfirm current location',
                      onPressed: null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Text('You Are Looking for', style:TextStyle(fontSize: 24.0, color: Colors.white,),textAlign: TextAlign.center,),
              SizedBox(height: 20.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: ChoiceChip(Icons.child_care,"Babies",isBabySelected),
                    onTap: (){
                      setState(() {
                        isBabySelected = true;
                      });
                    }),
                  SizedBox(width: 20.0),
                  InkWell(
                    child: ChoiceChip(Icons.folder_shared,"Babysitters",!isBabySelected),
                    onTap: (){
                      setState(() {
                        isBabySelected = false;
                      });
                    },),
                ],
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  child: TextField(
                    controller: TextEditingController(text:'ENTER HERE TO SEARCH'),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                      suffixIcon: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(Radius.circular(30.0),),
                        child:Icon(Icons.search, color: Colors.black,),
                      ),
                      border:InputBorder.none,
                      ),
                    ),
                ),
              ),
            ],
          ),
            ),
          ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {

  final IconData icon;
  final String text;
  final bool isSelected;
  ChoiceChip(this.icon,this.text,this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected ? BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0)
        ),
      ): null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(widget.icon,size: 25.0,color:Colors.white,),
          SizedBox(width:4.0),
          Text(widget.text,style: TextStyle(color: Colors.white,fontSize: 20.0),),
        ],
      ),
    );
  }
}