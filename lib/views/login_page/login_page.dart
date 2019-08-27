import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_first_app/views/home.dart';

class LoginPage extends StatefulWidget {

  static String tag = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 130,
              child: Image.asset('login_img/babyLogo.png'),
            ),
            SizedBox(height:30.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.0,),
                Container(
                  width: 250.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.orange[300],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.google, color: Colors.pink,),
                          SizedBox(width: 10.0,),
                          Text(
                            'Sign in with Google',
                            style: TextStyle(color: Colors.white, fontSize: 15.0),
                            ),
                        ],
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);
                      }
                    ),
                  ),
                ),
                Container(
                  width: 250.0,
                  child: Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.orange[300],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(FontAwesomeIcons.facebook, color: Colors.blue,),
                          SizedBox(width: 10.0,),
                          Text(
                            'Sign in with Facebook',
                            style: TextStyle(color: Colors.white, fontSize: 15.0),
                            ),
                        ],
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);
                      }
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
