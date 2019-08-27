import 'package:flutter/material.dart';
import 'package:flutter_first_app/views/login_page/login_splash.dart';

import 'views/home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: LoginSplash(),
    );
  }
}


































