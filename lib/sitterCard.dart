import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.simpleCurrency();


List<SitterCard> sitterCardList =[
  SitterCard('sitter_img/apple.png', '8/8/2019', '28', 14.0, 'Flushing', 'apple'),
  SitterCard('sitter_img/banana.png', '8/6/2019', '27', 12.5, 'Flushing', 'banana'),
  SitterCard('sitter_img/mango.png', '12/8/2019', '29', 17, 'Flushing', 'mango'),
  SitterCard('sitter_img/orange.png', '10/8/2019', '33', 11, 'Flushing', 'orange'),
  SitterCard('sitter_img/cherry.png', '10/8/2019', '25', 11, 'Flushing', 'cherry'),

];

class SitterCard extends StatelessWidget {

  final String sitterImgPath, sitterDate, sitterAge, sitterlocation, sitterTitle;
  final double  sitterPricePerHour;

  SitterCard(this.sitterImgPath, this.sitterDate, this.sitterAge, this.sitterPricePerHour,this.sitterlocation, this.sitterTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)
            ),
            child: Stack(
            children: <Widget>[
                Container(
                  height: 193.0,
                  width: 160.0,
                  child: Image.asset(sitterImgPath, fit: BoxFit.cover),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 65.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black, Colors.black.withOpacity(0.1),
                        ]),
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(sitterTitle, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.0)),
                          Row(
                            children: <Widget>[
                              Text(
                                sitterAge,
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14.0)),
                              SizedBox(width: 8,),
                              Text(
                                sitterlocation,
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18.0)),
                            ],
                          ),
                        ]
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 5.0,),
              Text(sitterDate, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(width: 5.0,),
              Text('${formatCurrency.format(sitterPricePerHour)}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
            ],
          ),
        ],
      ),
    );
  }
}
