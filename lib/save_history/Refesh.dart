import 'dart:async';
import 'package:flutter/material.dart';
import 'Detail.dart';



class Refresh extends StatefulWidget {
  @override
  _RefreshState createState() => new _RefreshState();
}
class _RefreshState extends State<Refresh> {
  List<String> list=[]; //default data
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  int counter=2;

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList(){
    setState((){
      list=['data 1','data 2','data 3','data 4','data 5'];
    });

  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);

    //this is the place for HTTP called updated
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      for(int i=0;i<list.length;i++){
        list[i]='Data ${(i+1)*counter}';
      }
      counter++;
    });

    return null;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: RefreshIndicator(
        onRefresh: refreshList,   //refresh,scroll  action trigger

        key: refreshKey,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            // itemBuilder function will be called list.length time
            // return any widget
            return GestureDetector(
              onTap: (){
               // print('print...............................');
                // pop up new page and pass data to it



              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
                child: Card(
                  color: Colors.deepOrangeAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      list[i],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        ),

      ),
    );
  }
}