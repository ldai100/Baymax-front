import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:ProfileFourPage()
    );
  }
}

class ProfileFourPage extends StatelessWidget {
     //static final String path = "lib/src/pages/profile/profile4.dart";
     @override
     Widget build(BuildContext context){
       return Scaffold(
         body: SingleChildScrollView(
           child:
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               SizedBox(height: 10.0),
               _buildHeader(),

               Container(
                 //margin: const EdgeInsets.all(16.0),
                 padding: const EdgeInsets.all(16.0),
                // decoration: BoxDecoration(
                   //color: Colors.grey.shade200
                // ),
                 //child: Text("Over 8+ years of experience and web development and 5+ years of experience in mobile applications development "),
               ),
              // _buildTitle("Rating"),
             //  SizedBox(height: 10.0),
               //SizedBox(height: 10.0),
               //_buildTitle(""),
               //_buildExperienceRow(company: "Time : ", position: "Wordpress Developer", duration: "2010 - 2012"),
               //_buildExperienceRow(company: "Address : ", position: "Laravel Developer", duration: "2012 - 2015"),
               //_buildExperienceRow(company: "Seats : ", position: "Web Developer", duration: "2015 - 2018"),
               //_buildExperienceRow(company: "Price :", position: "Flutter Developer", duration: "2018 - Current"),


               //SizedBox(height: 20.0),
               //SizedBox(height: 20.0),
               //SizedBox(height: 5.0),
               Row(
                 children: <Widget>[
                   SizedBox(width: 30.0),
                   Icon(Icons.watch_later, color: Colors.black54,size: 40.0,),
                   SizedBox(width: 10.0),
                   Text("Time : ", style: TextStyle(
                     fontSize: 25.0
                   ),),
                 ],
               ),
               SizedBox(height: 10.0),
               Row(
                 children: <Widget>[
                   SizedBox(width: 30.0),
                   Icon(Icons.home, color: Colors.black54,size: 40.0),
                   SizedBox(width: 10.0),
                   Text("Address :", style: TextStyle(
                     fontSize: 25.0
                   ),),
                 ],
               ),
               SizedBox(height: 5.0),
               Row(
                 children: <Widget>[
                   SizedBox(width: 30.0),
                   Icon(Icons.event_seat, color: Colors.black54,size: 40.0),
                   SizedBox(width: 20.0),
                   Text("Seats : ", style: TextStyle(
                       fontSize: 25.0
                   ),),
                   Icon(Icons.child_care, color: Colors.black54,size: 30.0),
                   Icon(Icons.child_care, color: Colors.black54,size: 30.0),
                   Icon(Icons.child_care, color: Colors.black54,size: 30.0),
                   //Text("dlohani48@gmail.com", style: TextStyle(
                     //  fontSize: 25.0
                  // ),),
                 ],
               ),
               SizedBox(height: 5.0),
               Row(
                 children: <Widget>[
                   SizedBox(width: 30.0),
                   Icon(Icons.attach_money, color: Colors.black54,size: 40.0),
                   SizedBox(width: 10.0),
                   Text("15/hour", style: TextStyle(
                       fontSize: 25.0
                   ),),
                 ],
               ),
               //_buildSocialsRow(),
               SizedBox(height: 40.0),
               rating(4),
             ],
           ),
         ),
       );
     }









     //helper functions list
     Row _buildSocialsRow() {
       return Row(
               children: <Widget>[
                 SizedBox(width: 20.0),
                 IconButton(
                   color: Colors.indigo,
                   icon: Icon(Icons.more_vert),
                   onPressed: (){
                     _launchURL("https://facebook.com/lohanidamodar");
                   },
                 ),
                 SizedBox(width: 5.0),
                 IconButton(
                   color: Colors.indigo,
                   icon: Icon(Icons.more_vert),
                   onPressed: (){
                     _launchURL("https://github.com/lohanidamodar");
                   },
                 ),
                 SizedBox(width: 5.0),
                 IconButton(
                   color: Colors.red,
                   icon: Icon(Icons.more_vert),
                   onPressed: (){
                     _launchURL("https://youtube.com/c/reactbits");
                   },
                 ),
                 SizedBox(width: 10.0),
               ],
             );
     }


     _launchURL(String url) async {
       if (await canLaunch(url)) {
         await launch(url);
       } else {
         throw 'Could not launch $url';
       }
     }


     Widget _buildExperienceRow({String company, String position, String duration}) {
       return
         Padding(
           padding: const EdgeInsets.only(top: 8.0, left: 20.0),
           child:Column(
             children: <Widget>[
               Row(children: <Widget>[
                 Text(company,style:TextStyle(fontSize: 20.0),)
               ],),
             ],
           ),
         );


     }


     Widget rating(int score) { //4
       double starSize=40;
       List<Widget> iconList=[];
       //iconList.add(Text('Rating :  ',style: TextStyle(fontSize:25.0),));
       for(int i=0;i<score;i++){
         iconList.add(Icon(Icons.star,color:Colors.yellowAccent,size: starSize,));

       }
       for(int i=score;i<5;i++){
         iconList.add(Icon(Icons.star_border,size: starSize));
       }
       iconList.add( SizedBox(width: 30.0));
       iconList.add(Text('${score}',style: TextStyle(fontSize: starSize+10),));


       return Padding(
         padding: const EdgeInsets.only( left: 16.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: iconList,
         ),
       );
     }


     Widget _buildTitle(String title) {
       return Padding(
         padding: const EdgeInsets.only(left: 16.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text(title.toUpperCase(), style: TextStyle(
               fontSize: 18.0,
               fontWeight: FontWeight.bold
             ),),
             Divider(color: Colors.black54,),
           ],
         ),
       );
     }










     Row _buildHeader() {
       return Row(children: <Widget>[
         SizedBox(width: 20.0),
         Container(
           width: 80.0,
           height: 80.0,
           child: CircleAvatar(
             radius: 40,
             backgroundColor: Colors.grey,
             child: CircleAvatar(
               radius: 35.0,
               backgroundImage: AssetImage('')))),
         SizedBox(width: 40.0),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Text("   Name : ", style: TextStyle(
               fontSize: 18.0,
               fontWeight: FontWeight.bold
             ),
             ),
             SizedBox(height: 10.0),
             Text("License :",style: TextStyle(
                 fontSize: 18.0,
                 fontWeight: FontWeight.bold
             ),),
             SizedBox(height: 5.0),
             Row(
               children: <Widget>[
                 //Icon(Icons.more_vert, size: 12.0, color: Colors.black54,),
                 SizedBox(width: 10.0),

               ],
             ),
           ],
         )
       ],);
     }
   }
