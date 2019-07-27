import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _PagesState();
  }
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pages"),
      ),
      body: Center(
        child: Text("information!"),
        ),
    );
  }
}