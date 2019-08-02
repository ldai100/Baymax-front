import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  @override
  CollectionPageState createState() => new CollectionPageState();
}

class CollectionPageState extends State<CollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Saved'),
    ));
  }
}