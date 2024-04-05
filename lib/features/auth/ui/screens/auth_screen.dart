import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget{
  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Auth Screen'),
      ),
    );
  }
}