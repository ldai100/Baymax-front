import 'package:flutter/material.dart';
import 'views/home.dart';
import 'package:fluro/fluro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'My Flutter App',
     home: Home(),
   );
 }
}