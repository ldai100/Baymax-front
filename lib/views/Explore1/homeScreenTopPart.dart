import 'package:flutter/material.dart';

import 'CustomShapeClipper.dart';
import 'homeScreenBottomPart.dart';
import 'list.dart';
import 'choiceChip.dart' as customChoiceChip;


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
            Expanded(
              flex:2,
              child: ClipPath(clipper: CustomShapeClipper(),
                child: Container(
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
                              child: customChoiceChip.ChoiceChip(Icons.child_care,"Babies",isBabySelected),
                              onTap: (){
                                setState(() {
                                  isBabySelected = true;
                                });
                              }),
                            SizedBox(width: 20.0),
                            InkWell(
                              child: customChoiceChip.ChoiceChip(Icons.folder_shared,"Babysitters",!isBabySelected),
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
            ),
              Expanded(flex:1,child:HomeScreenBottomPart(isSelected: isBabySelected,)),
          ],
        ),
      ],
    );
  }
}