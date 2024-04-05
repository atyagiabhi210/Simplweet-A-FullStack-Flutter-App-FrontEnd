import 'package:flutter/material.dart';
import 'package:flutter_fs_project/features/auth/ui/screens/auth_screen.dart';
import 'package:flutter_fs_project/features/onboarding/ui/Pages/onboarding_page1.dart';
import 'package:flutter_fs_project/features/onboarding/ui/Pages/onboarding_page2.dart';
import 'package:flutter_fs_project/features/onboarding/ui/Pages/onboarding_page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // to control the page we are on
  bool isLast = false;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            if (index == 2) {
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
          },
          children: [
            OnboadingPage1(),
            // Container(color: Colors.red,),
            OnboadingPage2(),
            //Container(color: Colors.green,),

            OnboadingPage3(),
            // Container(color: Colors.blue,),
          ],
        ),
        //Dot indicators
        Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Skip button
                  TextButton(
                    onPressed: () {
                      _controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text('Skip'),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const WormEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.yellowAccent,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  //Next button
                  // tertiary operator used here
                  isLast
                      ? GestureDetector(
                          child: Text('Get Started'),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) {
                              return AuthScreen();
                            }));
                          },
                        )
                      : GestureDetector(
                          child: Text('Next'),
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                        )
                  // nextMethod(),
                ])),
      ]),
    );
  }

  nextMethod() {
    if (_controller.page == 2) {
      return GestureDetector(
        child: Text('Get Started'),
        onTap: () {},
      );
    } else {
      return GestureDetector(
        child: Text('Next'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return AuthScreen();
          }));
        },
      );
    }
  }
}
