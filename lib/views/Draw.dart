import 'package:flutter/material.dart';
class Draw extends StatelessWidget {
  const Draw({
    Key key,
  }) : super(key: key);


  // the display of the drawer should be accorded to the User data   User.dart

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Pratap Kumar",style: TextStyle(color:Colors.black )),
            accountEmail: new Text("kprathap23@gmail.com",style: TextStyle(color:Colors.black )),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('assets/images/lake.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://tu.jiuwa.net/pic/20190107/1546869411485245.jpeg")),
          ),
          new ListTile(
              leading: Icon(Icons.library_music),
              title: new Text("Music"),
              onTap: () {
                Navigator.pop(context);
              }),
          new ListTile(
              leading: Icon(Icons.movie),
              title: new Text("Movies"),
              onTap: () {
                Navigator.pop(context);
              }),
          new ListTile(
              leading: Icon(Icons.shopping_cart),
              title: new Text("Shopping"),
              onTap: () {
                Navigator.pop(context);
              }),
          new ListTile(
              leading: Icon(Icons.apps),
              title: new Text("Apps"),
              onTap: () {
                Navigator.pop(context);
              }),
          new ListTile(
              leading: Icon(Icons.dashboard),
              title: new Text("Docs"),
              onTap: () {
                Navigator.pop(context);
              }),
          new ListTile(
              leading: Icon(Icons.settings),
              title: new Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              }),
          new Divider(),
          new ListTile(
              leading: Icon(Icons.info),
              title: new Text("About"),
              onTap: () {
                Navigator.pop(context);
              }),
          new ListTile(
              leading: Icon(Icons.power_settings_new),
              title: new Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}