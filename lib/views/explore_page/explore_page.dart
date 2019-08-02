import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  @override
  ExplorePageState createState() => new ExplorePageState();
}

class ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Explore'),
    ));
  }
}
