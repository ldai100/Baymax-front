import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  //var isBabySelected = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
          child:HomeScreenTopPart()
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
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ClipPath(clipper: CustomShapeClipper(),
              child: Container(
                height: 300.0,
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
                    //SizedBox(height: 50.0),
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
                          // controller: TextEditingController(text:'ENTER HERE TO SEARCH'),
                          decoration: InputDecoration(
                            hintText: 'ENTER HERE TO SEARCH',
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
        ),
        HomeScreenBottomPart1(isBabySelected)
      ],
    );
  }
  Widget HomeScreenBottomPart1(bool isBabySelected){
    List<BabyCard> babyCardList =[
      BabyCard('https://inews.gtimg.com/newsapp_match/0/9226724603/0', '8/8/2019', 'Six months', '14', 'Flushing', 'andy'),
      BabyCard('https://inews.gtimg.com/newsapp_match/0/9226724603/0', '8/6/2019', 'Four months', '12', 'Flushing', 'candy'),
      BabyCard('https://inews.gtimg.com/newsapp_match/0/9226724603/0', '12/8/2019', 'Five months', '17', 'Flushing', 'mason'),
      BabyCard('https://inews.gtimg.com/newsapp_match/0/9226724603/0', '10/8/2019', 'Two months', '11', 'Flushing', 'wen'),
    ];

    List<SitterCard> SitterCardList =[
      SitterCard('https://img0.pconline.com.cn/pconline/1906/24/12706418_85586000_thumb.jpg', '8/8/2019', '28', '14', 'Flushing', 'apple'),
      SitterCard('https://img0.pconline.com.cn/pconline/1906/24/12706418_85586000_thumb.jpg', '8/6/2019', '27', '12', 'Flushing', 'banana'),
      SitterCard('https://img0.pconline.com.cn/pconline/1906/24/12706418_85586000_thumb.jpg', '12/8/2019', '29', '17', 'Flushing', 'mango'),
      SitterCard('https://img0.pconline.com.cn/pconline/1906/24/12706418_85586000_thumb.jpg', '10/8/2019', '33', '11', 'Flushing', 'orange'),
      SitterCard('https://tu.jiuwa.net/pic/20190107/1546869411485245.jpeg', '10/8/2019', '25', '11', 'Flushing', 'cherry'),
    ];
    print(isBabySelected);

    if(isBabySelected){
      print("true return");
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
                  Text('View ALL(12)',style: TextStyle(fontSize: 14.0),),
                ]
            ),
          ),
          Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: babyCardList,
            ),
          ),
        ],
      );
    }else{
      print("false return");
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
                  Text('View ALL(12)',style: TextStyle(fontSize: 14.0),),
                ]
            ),
          ),
          Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: SitterCardList,
            ),
          ),
        ],
      );
    }

  }
}


//helper class
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

class CustomShapeClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * .5, size.height - 35.0);
    var firstControlPoint = Offset(size.width  * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width * 0.75, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);


    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class BabyCard extends StatelessWidget {
  final String babyImgPath, babyDate, babyAge, babyPricePerHour, babylocation, babyTitle;

  BabyCard(this.babyImgPath, this.babyDate, this.babyAge, this.babyPricePerHour, this.babylocation, this.babyTitle);

  @override
  Widget build(BuildContext context) {
    print(this.babyImgPath);
    return Stack(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          child: CircleAvatar(backgroundImage:NetworkImage(babyImgPath)),
        ),
      ],
    );
  }
}
class SitterCard extends StatelessWidget {

  final String sitterImgPath, sitterDate, sitterAge, sitterPricePerHour, sitterlocation, sitterTitle;

  SitterCard(this.sitterImgPath, this.sitterDate, this.sitterAge, this.sitterPricePerHour,this.sitterlocation, this.sitterTitle);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          child: CircleAvatar(backgroundImage:NetworkImage(sitterImgPath)),
        ),
      ],
    );
  }
}