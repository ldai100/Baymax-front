import 'dart:async';
import 'package:flutter/material.dart';




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
        onRefresh: refreshList,
        key: refreshKey,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) => ListTile(
            title: Text(list[i]),
          ),
        ),

      ),
    );
  }
}