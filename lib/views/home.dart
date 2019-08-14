import 'package:flutter/material.dart';
import 'collection_page/collection_page.dart';
import 'explore_page/explore_page.dart';
import 'profile_page/profile_page.dart';
import 'Draw.dart';


class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  //set explore page to be the current tab for home screen.
  

  //String appBarTitle = tabData[0]['text'];
  List<Widget> list = List();
  int _currentIndex = 0;

  //Create a list to store 3 tabs icons and text.
  static List tabData = [
    {'text': 'Explore', 'icon': Icon(Icons.explore)},
    {'text': 'Saved', 'icon': Icon(Icons.favorite)},
    {'text': 'Profile', 'icon': Icon(Icons.person)},
  ];

  List<BottomNavigationBarItem> myTabs = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }

    //Add 3 main pages to a list by using cascade notation.
    list
    ..add(ExplorePage())
    ..add(CollectionPage())
    ..add(ProfilePage());
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Draw(),
      // appBar: AppBar(
      //   title: Text(appBarTitle),
      // ),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: myTabs,

        currentIndex: _currentIndex,

        onTap: _itemTapped,
        
        
        type: BottomNavigationBarType.fixed,

        fixedColor: Color(0xFFC91B3A),
      ),
      );
  }

  void _itemTapped(int index) {
    setState(() {
      _currentIndex = index;
      //appBarTitle = tabData[index]['text'];
    });
  }
}
