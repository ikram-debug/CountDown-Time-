import 'package:flutter/material.dart';
import 'package:timer_countdown/View%20Model/Splash_Screen_VM.dart';
import 'package:timer_countdown/View/Conutdow_Timer/Countdown_Time_View.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreen_VM _VModel = SplashScreen_VM();
  @override
  void initState() {
    super.initState();
    _VModel.NavigateToNextScreen(context, CountdownTimeView());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/Clock1.png'),
            ),
            SizedBox(height: 5),
            Text(
              'Timer CountDown',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
