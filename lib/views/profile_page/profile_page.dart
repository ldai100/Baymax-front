import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() => new ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Profile'),
    ));
  }
}