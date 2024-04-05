import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboadingPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Stack(children: [
          Container(
            alignment:const Alignment(0.1, 0.1),
            child: SvgPicture.asset(
              'assets/onboarding/onboarding3.svg',
             // alignment:const Alignment(0.5, 0.00001),
            ),
          ),
          const Align(
            alignment: Alignment(0, 0.5),
            child: Text(
              'Explore and Engage:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
         const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Align(
              alignment: Alignment(0, 0.65),
              child: Text(
                "Dive into conversations, explore diverse perspectives, is your gateway to meaningful connections and impactful conversations.",
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          )

          //   Image.asset('assets/onboarding/image 1.svg'),
        ]));
  }
}
