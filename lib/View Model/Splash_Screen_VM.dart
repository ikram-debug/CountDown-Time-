import 'package:flutter/material.dart';

class SplashScreen_VM{
  void NavigateToNextScreen( BuildContext context, Widget nextScreen) {
    Future.delayed(
      Duration(seconds: 3),
        () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => nextScreen));
      }
    );
  }
}