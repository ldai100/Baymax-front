import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatCurrency = NumberFormat.simpleCurrency();


List<SitterCard> sitterCardList =[
  SitterCard('https://img0.pconline.com.cn/pconline/1906/24/12706418_85586000_thumb.jpg', '8/8/2019', '28', 14.0, 'Flushing', 'apple'),
  SitterCard('https://img0.pconline.com.cn/pconline/1906/24/12706418_85586000_thumb.jpg', '8/6/2019', '27', 12.5, 'Flushing', 'banana'),
  SitterCard('https://img0.pconline.com.cn/pconline/1906/24/12706418_85586000_thumb.jpg', '12/8/2019', '29', 17, 'Flushing', 'mango'),
  SitterCard('https://img0.pconline.com.cn/pconline/1906/24/12706418_85586000_thumb.jpg', '10/8/2019', '33', 11, 'Flushing', 'orange'),
  SitterCard('https://img0.pconline.com.cn/pconline/1906/24/12706418_85586000_thumb.jpg', '10/8/2019', '25', 11, 'Flushing', 'cherry'),

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
                  height: 70.0,
                  width: 70.0,
                  child: CircleAvatar(backgroundImage: NetworkImage(sitterImgPath),)
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