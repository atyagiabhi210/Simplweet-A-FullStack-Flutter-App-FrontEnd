import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fs_project/features/auth/ui/screens/signin_screen.dart';

class Tweets extends StatefulWidget{
  @override
  State<Tweets> createState() {
    return _TweetsState();
  }
}
 class _TweetsState extends State<Tweets>{
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tweets'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Tweets'),

            ElevatedButton(onPressed: (){
              try{
                auth.signOut();
                Navigator.push(context,MaterialPageRoute(builder: (ctx)=>SignInScreen()));
              }
              catch(e){
                print(e);
              }
            }, child: Text('Sign Out'))
          ],
        ),
      ),
    );
  }}