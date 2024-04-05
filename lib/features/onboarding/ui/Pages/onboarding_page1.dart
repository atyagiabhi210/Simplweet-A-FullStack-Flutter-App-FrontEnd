import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboadingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(children: [
          Container(
             alignment: Alignment(0.1, 0.1),
            child: SvgPicture.asset(
              'assets/onboarding/onboarding1.svg',
              alignment: Alignment(0.5, 0.00001),
            ),
           
          ),
          const Align(
            alignment: Alignment(0, 0.5),
            child: Text('Connect Instantly:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),
            textAlign: TextAlign.center,),
          ),
          const Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Align(
            alignment: Alignment(0, 0.65),
            child: Text("Siplweet simplifies tweeting. Share updates,and discover trending topics in a breeze.",
            softWrap: true,
              textAlign: TextAlign.center,),
          ) ,)
          
          

          //   Image.asset('assets/onboarding/image 1.svg'),
        ]));
  }
}
