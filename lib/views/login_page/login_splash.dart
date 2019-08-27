import 'package:flutter/material.dart';
import 'package:flutter_first_app/views/login_page/login_page.dart';

class LoginSplash extends StatefulWidget {
  @override
  _LoginSplashState createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {

  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(seconds: 2),(){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'login_img/babyLogo.png',
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.lighten,
            ),
        ],
      ),  
    );
  }
}