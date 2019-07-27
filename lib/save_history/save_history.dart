import 'package:flutter/material.dart';
import 'page/Pages.dart';


class SaveHistory extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _SaveHistoryState();
  }
}

class _SaveHistoryState extends State<SaveHistory> {

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
       title: Text('Save and History'),
     ),
     body:SafeArea(
       child: new View(),
     ),
     );
  }
}


class View extends StatelessWidget {
  const View({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
           padding: const EdgeInsets.all(8.0),
           children: <Widget>[
             GestureDetector(
                 onTap: (){              
                   Navigator.push(
                   context,MaterialPageRoute(builder: (context)=>Pages())
                   );
                 },
                 child: Container(
                 height: 50,
                 color: Colors.amber[600],
                 child: const Center(child: Text('Entry A')),
               ),
             ),
             Container(
               height: 50,
               color: Colors.amber[500],
               child: const Center(child: Text('Entry B')),
             ),
             Container(
               height: 50,
               color: Colors.amber[100],
               child: const Center(child: Text('Entry C')),
             ),
           ],
         );
  }
}