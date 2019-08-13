import 'package:flutter/material.dart';

import 'cards/sitterCard.dart';
import 'cards/babyCard.dart';

 ThemeData appTheme = 
  ThemeData(primaryColor: Color(0xFFF3891A),fontFamily: 'Oxygen');

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