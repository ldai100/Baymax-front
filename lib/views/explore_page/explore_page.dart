import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExplorePage extends StatefulWidget {
  @override
  ExplorePageState createState() => new ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  final String url = "https://swapi.co/api/people";

  List _collectionList = [];

  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }
  
  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"}
      );

      print(response.body);

      setState((){
        var convertDataToJson = json.decode(response.body);
        _collectionList = convertDataToJson['results'];
      });

  }

  // List _collectionList = ['I am Carol, a very good babysitter.','I am available 2:00 pm.','I am Dan. Nice to meet you.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.'];

  ScrollController _scrollController = new ScrollController();

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  Widget _renderList(context, index) {
    if (index == 0) {
      return Container(
        height: 40.0,
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.warning,
              size: 22.0,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text('Restart the simulator will lose all data.'),
          ],
        ),
      );
    }
    

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      margin: const EdgeInsets.only(bottom: 7.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: const Color(0xFFd0d0d0),
            blurRadius: 1.0,
            spreadRadius: 2.0,
            offset: Offset(3.0, 2.0),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          Icons.person_outline,
          size: 30.0,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          Uri.decodeComponent(_collectionList[index]['name']),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 17.0),
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
        onTap: () {
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_collectionList.length == 0) {
      return ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              // Image.asset(
              //   'assets/images/nothing.png',
              //   fit: BoxFit.contain,
              //   width: MediaQuery.of(context).size.width / 2,
              // ),
              Text('No collection, go to explore it.'),
            ],
          ),
        ],
      );
    }
    
    return ListView.builder(
      itemBuilder: _renderList,
      itemCount: _collectionList == null ? 0 : _collectionList.length,
      controller: _scrollController,
    );
  }
}
