import 'package:flutter/material.dart';


class UserCard extends StatefulWidget {

  final String name;
  final int index;
  UserCard(this.name,this.index);

  @override
  _UserCardState createState() => _UserCardState(this.name,this.index);
}

class _UserCardState extends State<UserCard> {

  String name;
  final int index;
  _UserCardState(this.name,this.index);

  @override
  Widget build(BuildContext context) {
    if(this.index==1){
      this.name="Tom";
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 115.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50.0,
              child: dogCard,
            ),
            Positioned(top: 7.5, child: Container(
               width:100,
               height:100,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: new NetworkImage(
                            "https://tu.jiuwa.net/pic/20190107/1546869411485245.jpeg")
                    )
                )

            )),
          ],
        ),
      ),
    );
  }
  Widget get dogCard {
    // A new container
    // The height and width are arbitrary numbers for styling.
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("${this.name}",
                  style: Theme.of(context).textTheme.headline),
              Text("${this.name}",
                  style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': 5 / 10')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}





