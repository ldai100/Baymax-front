import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_first_app/views/post_detail.dart';
import 'CatAnimation.dart';
import '../post_list.dart';

class CollectionPage extends StatefulWidget {
  @override
  CollectionPageState createState() => new CollectionPageState();
}

class CollectionPageState extends State<CollectionPage> {
  final String url = "https://swapi.co/api/people";
  bool _loading=false;
  List _collectionList = [];
  double _lastPos=0.0;
  //ScrollController _controller = ScrollController();
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _loading=true;
    super.initState();
    this.getJsonData();
  }

  Future<dynamic> loadMore() async{

    var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var convertDataToJson = json.decode(response.body);

    setState((){
      _collectionList= _collectionList..addAll(convertDataToJson['results']);
      _loading=false;
    });
  }


  Future<dynamic> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    //print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      _collectionList = convertDataToJson['results'];
      _loading=false;
    });
  }

  // List _collectionList = ['I am Carol, a very good babysitter.','I am available 2:00 pm.','I am Dan. Nice to meet you.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.','Lorem ipsum dolor sit amet, consectetur adipiscing elit.'];



  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }



  Widget _renderList(context, index) {
    if (index==0) {
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

    return GestureDetector(
        onTap:(){
          Navigator.push(
              context,MaterialPageRoute(builder: (context)=>PostDetails())
          );
        },
      child: Container(
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
        child: UserCard(Uri.decodeComponent(_collectionList[index]['name']),index)
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    if (this._loading) {
      return CatAnimation();
    }
    _scrollController = ScrollController(initialScrollOffset: this._lastPos);
    //_scrollController.jumpTo(this._lastPos);
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo)
        {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent)
          {
            if(!_loading){
              setState((){
                this._lastPos=scrollInfo.metrics.maxScrollExtent;
                _loading=true;
                loadMore();
              });
            }

          }
          return true;
      },
      child: ListView.builder(
        //controller: _controller,
        itemBuilder: _renderList,
        itemCount: _collectionList == null ? 0 : _collectionList.length,
        controller: _scrollController,
      ),
    );
  }

}










