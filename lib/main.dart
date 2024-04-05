import 'package:flutter/material.dart';
import 'package:flutter_fs_project/features/auth/ui/screens/auth_screen.dart';
import 'package:flutter_fs_project/features/onboarding/ui/onboarding_screen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool runFirst=false;
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showScreen(runFirst)
    );
  }
  
  showScreen(bool runFirst) {
    if (runFirst) {
      runFirst = true;
      return AuthScreen();
    } else {
      return OnboardingScreen();
    }
  }
    

}

