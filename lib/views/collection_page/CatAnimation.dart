import 'package:flutter/material.dart';
class CatAnimation extends StatefulWidget {
  @override
  _CatAnimationState createState() => _CatAnimationState();
}

class _CatAnimationState extends State<CatAnimation> with TickerProviderStateMixin{
  Animation<double> catAnimation;
  AnimationController catController;

  initState(){
    super.initState();
    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    catAnimation = Tween(begin: 0.0, end: 100.0).
    animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );

    //catController.forward().whenComplete((){ catController.reverse().whenComplete((){
     // catController.forward().whenComplete((){
       // catController.reverse();
      //});
    //});});
    //catController.reverse();
    int counter=0;
    catController.forward().whenComplete((){
      forward(counter);
    });
  }

  forward(int counter){
    //print(counter);
    if(counter==100){
      return;
    }
    counter++;
    catController.forward().whenComplete((){backward(counter);});

  }

  backward(int counter){
    //print(counter);
    if(counter==100){
      return;
    }
    counter++;
    catController.reverse().whenComplete((){forward(counter+1);});

  }


  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Container(
          child: child,
          margin:EdgeInsets.only(top:catAnimation.value)
        );
      },
      child: Center(
        child: Container(
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

        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return buildCatAnimation();
  }
}