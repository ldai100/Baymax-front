import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.simpleCurrency();

List<BabyCard> babyCardList =[
  BabyCard('baby_img/candy.png', '8/6/2019', '4 months', 12.0, 'Flushing', 'candy'),
  BabyCard('baby_img/mason.png', '12/8/2019', '5 months', 17.0, 'Flushing', 'mason'),
  BabyCard('baby_img/wen.png', '10/8/2019', '2 months', 11.0, 'Flushing', 'wen'),
];


class BabyCard extends StatelessWidget {
  final String babyImgPath, babyDate,babyAge, babylocation, babyTitle;
  final double babyPricePerHour;

  BabyCard(this.babyImgPath, this.babyDate, this.babyAge, this.babyPricePerHour, this.babylocation, this.babyTitle);

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
                  child: Image.asset(babyImgPath, fit: BoxFit.cover),
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
                          Text(babyTitle, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.0)),
                          Row(
                            children: <Widget>[
                              Text(
                                babyAge,
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14.0)),
                              SizedBox(width: 8,),
                              Text(
                                babylocation,
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
              Text(babyDate, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(width: 5.0,),
              Text('${formatCurrency.format(babyPricePerHour)}', style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
            ],
          ),
        ],
      ),
    );
  }
}
