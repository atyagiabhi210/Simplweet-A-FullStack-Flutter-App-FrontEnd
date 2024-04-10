import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fs_project/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter_fs_project/features/tweet/ui/tweets.dart';
import 'package:flutter_fs_project/firebase_options.dart';
import 'package:flutter_fs_project/theme/theme_constants.dart';
import 'package:flutter_fs_project/theme/theme_manager.dart';

void main() async {
  // let's initialize our firebase app now
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //final bool loggedIn = false;
  checkUser() {
    if (auth.currentUser != null) {
      return Tweets();
    } else {
      return OnboardingScreen();
    }
  }

  final ThemeManager themeManager = ThemeManager();
  final bool runFirst = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeManager.themeMode,
        debugShowCheckedModeBanner: false,
        home: checkUser());
  }

  /*showScreen(bool runFirst) {
    if (runFirst) {
      // runFirst = true;
      return OnboardingScreen();
    } else {
      runFirst = false;
      return AuthScreen();
    }
  }*/
}
