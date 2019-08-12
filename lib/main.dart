import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'CustomShapeClipper.dart';
import 'save_history/save_history.dart';
import 'list.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'My Flutter App',
     home: HomeScreen(),
   );
 }}
 ThemeData appTheme = 
  ThemeData(primaryColor: Color(0xFFF3891A),fontFamily: 'Oxygen');

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
        Column(
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
                  SizedBox(height: 1.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter here to make search',
                          contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 14.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius: BorderRadius.all(Radius.circular(30.0),),
                            child:InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
                              },
                              child: Icon(Icons.search, color: Colors.black),
                              ),
                          ),
                          border:InputBorder.none,
                          ),
                        ),
                    ),
                  ),
                  SizedBox(height: 20.0),
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
                  //SizedBox(height: 30.0),///
                ],
              ),
              ),
              ),
              HomeScreenBottomPart(isSelected: isBabySelected,),
          ],
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

class HomeScreenBottomPart extends StatefulWidget { 
   final bool isSelected;
   const HomeScreenBottomPart({Key key, this.isSelected}): super(key: key);

  @override
  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child:
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            SizedBox(width: 16.0,),
            Text('Recommendation', style: TextStyle(color: Colors.black, fontSize: 16.0),),
            Spacer(),
            InkWell(
              child: new Text('View ALL(12)',style: TextStyle(fontSize: 14.0, color: appTheme.primaryColor),),
              onTap: () => null,
              ),
            ]
          ),
        ),
        new Container(
          height: 210.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: getList(widget.isSelected),
          ),
        ),
      ],
    );
  }
}

List getList(bool isSelected){
  if(isSelected)
    return babyCardList;
  else
    return sitterCardList;
}

final formatCurrency = NumberFormat.simpleCurrency();

List<BabyCard> babyCardList =[
  BabyCard('baby_img/candy.png', '8/6/2019', '4 months', 12.0, 'Flushing', 'candy'),
  BabyCard('baby_img/mason.png', '12/8/2019', '5 months', 17.0, 'Flushing', 'mason'),
  BabyCard('baby_img/wen.png', '10/8/2019', '2 months', 11.0, 'Flushing', 'wen'),
];


class BabyCard extends StatelessWidget {
  final String babyImgPath, babyDate,babyAge, babylocation, babyTitle;
  final double babyPricePerHour;

  BabyCard(this.babyImgPath, this.babyDate, this.babyAge, this.babyPricePerHour, this.babylocation, this.babyTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)
            ),
            child: Stack(
            children: <Widget>[
                Container(
                  height: 193.0,
                  width: 160.0,
                  child: Image.asset(babyImgPath, fit: BoxFit.cover),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 65.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black, Colors.black.withOpacity(0.1),
                        ]),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(babyTitle, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.0)),
                          Row(
                            children: <Widget>[
                              Text(
                                babyAge,
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14.0)),
                              SizedBox(width: 8,),
                              Text(
                                babylocation,
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18.0)),
                            ],
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 5.0,),
              Text(babyDate, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(width: 5.0,),
              Text('${formatCurrency.format(babyPricePerHour)}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
            ],
          ),
        ],
      ),
    );
  }
}



List<SitterCard> sitterCardList =[
  SitterCard('sitter_img/apple.png', '8/8/2019', '28', 14.0, 'Flushing', 'apple'),
  SitterCard('sitter_img/banana.png', '8/6/2019', '27', 12.5, 'Flushing', 'banana'),
  SitterCard('sitter_img/mango.png', '12/8/2019', '29', 17, 'Flushing', 'mango'),
  SitterCard('sitter_img/orange.png', '10/8/2019', '33', 11, 'Flushing', 'orange'),
  SitterCard('sitter_img/cherry.png', '10/8/2019', '25', 11, 'Flushing', 'cherry'),

];

class SitterCard extends StatelessWidget {

  final String sitterImgPath, sitterDate, sitterAge, sitterlocation, sitterTitle;
  final double  sitterPricePerHour;

  SitterCard(this.sitterImgPath, this.sitterDate, this.sitterAge, this.sitterPricePerHour,this.sitterlocation, this.sitterTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)
            ),
            child: Stack(
            children: <Widget>[
                Container(
                  height: 193.0,
                  width: 160.0,
                  child: Image.asset(sitterImgPath, fit: BoxFit.cover),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 65.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black, Colors.black.withOpacity(0.1),
                        ]),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(sitterTitle, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.0)),
                          Row(
                            children: <Widget>[
                              Text(
                                sitterAge,
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14.0)),
                              SizedBox(width: 8,),
                              Text(
                                sitterlocation,
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18.0)),
                            ],
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 5.0,),
              Text(sitterDate, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(width: 5.0,),
              Text('${formatCurrency.format(sitterPricePerHour)}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
            ],
          ),
        ],
      ),
    );
  }
}
