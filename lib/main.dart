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
 ThemeData appTheme = 
  ThemeData(primaryColor: Color(0xFFF3891A),fontFamily: 'Oxygen');

    var isBabySelected = true;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
          HomeScreenBottomPart(),
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




class HomeScreenBottomPart extends StatefulWidget {
  @override
  _HomeScreenBottomPartState createState() => _HomeScreenBottomPartState();
}

class _HomeScreenBottomPartState extends State<HomeScreenBottomPart> {
  @override
  Widget build(BuildContext context) {
    if(isBabySelected){
      return Column(
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
              Text('View ALL(12)',style: TextStyle(fontSize: 14.0, color: appTheme.primaryColor),),
              ]
            ),
          ),
          Container(
            height: 210.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: babyCardList,
            ),
          ),
        ],
      );
    }else{
      return Column(
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
              Text('View ALL(12)',style: TextStyle(fontSize: 14.0, color: appTheme.primaryColor),),
              ]
            ),
          ),
          Container(
            height: 210.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: babyCardList,
            ),
          ),
        ],
      );
    }
  }
}





/*
class HomeScreenBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            Text('View ALL(12)',style: TextStyle(fontSize: 14.0, color: appTheme.primaryColor),),
            ]
          ),
        ),
        Container(
          height: 210.0,
          child: isBabySelected ? ListView(
            scrollDirection: Axis.horizontal,
            children: babyCardList,
          ):null,
        ),
      ],
    );
  }
}
*/

List<BabyCard> babyCardList =[
  BabyCard('baby_img/diamond.png', '8/8/2019', 'Six months', '14', 'Flushing', 'andy'),
  BabyCard('baby_img/candy.png', '8/6/2019', 'Four months', '12', 'Flushing', 'candy'),
  BabyCard('baby_img/mason.png', '12/8/2019', 'Five months', '17', 'Flushing', 'mason'),
  BabyCard('baby_img/wen.png', '10/8/2019', 'Two months', '11', 'Flushing', 'wen'),
];


class BabyCard extends StatelessWidget {
  final String babyImgPath, babyDate, babyAge, babyPricePerHour, babylocation, babyTitle;

  BabyCard(this.babyImgPath, this.babyDate, this.babyAge, this.babyPricePerHour, this.babylocation, this.babyTitle);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 210.0,
          width: 160.0,
          child: new Image.asset(babyImgPath, fit: BoxFit.cover),
        ),
      ],
    );
  }
}



List<SitterCard> SitterCardList =[
  SitterCard('sitter_img/apple.png', '8/8/2019', '28', '14', 'Flushing', 'apple'),
  SitterCard('sitter_img/banana.png', '8/6/2019', '27', '12', 'Flushing', 'banana'),
  SitterCard('sitter_img/mango.png', '12/8/2019', '29', '17', 'Flushing', 'mango'),
  SitterCard('sitter_img/orange.png', '10/8/2019', '33', '11', 'Flushing', 'orange'),
  SitterCard('sitter_img/cherry.png', '10/8/2019', '25', '11', 'Flushing', 'cherry'),

];

class SitterCard extends StatelessWidget {

  final String sitterImgPath, sitterDate, sitterAge, sitterPricePerHour, sitterlocation, sitterTitle;

  SitterCard(this.sitterImgPath, this.sitterDate, this.sitterAge, this.sitterPricePerHour,this.sitterlocation, this.sitterTitle);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 210.0,
          width: 160.0,
          child: new Image.asset(sitterImgPath, fit: BoxFit.cover),
        ),
      ],
    );
  }
}


/*
var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);

var homeScreenBottomPart = Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        SizedBox(width: 16.0,),
        Text('Current Watched Items', style: TextStyle(color: Colors.black, fontSize: 16.0),),
        Spacer(),
        Text('View ALL(12)',style: TextStyle(fontSize: 14.0, color: appTheme.primaryColor),),
        ]
      ),
    ],
  );

  */