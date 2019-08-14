import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.simpleCurrency();

List<BabyCard> babyCardList =[
  BabyCard('https://tu.jiuwa.net/pic/20190107/1546869411485245.jpeg', '8/6/2019', '4 months', 12.0, 'Flushing', 'candy'),
  BabyCard('https://tu.jiuwa.net/pic/20190107/1546869411485245.jpeg', '12/8/2019', '5 months', 17.0, 'Flushing', 'mason'),
  BabyCard('https://tu.jiuwa.net/pic/20190107/1546869411485245.jpeg', '10/8/2019', '2 months', 11.0, 'Flushing', 'wen'),
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
                  height: 70.0,
                  width: 70.0,
                  child: CircleAvatar(backgroundImage: NetworkImage(babyImgPath),)
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