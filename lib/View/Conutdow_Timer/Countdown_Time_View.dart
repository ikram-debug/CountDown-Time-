import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_countdown/Provider/Timer_Provider.dart';

class CountdownTimeView extends StatelessWidget {
  const CountdownTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[100],
        title: Center(
          child: Text(
            'CountDown Time',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children:[ SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black12,
                  value: timerProvider.initialTime>0
                      ? timerProvider.remainingTime / timerProvider.initialTime : 0,
                  strokeWidth: 8,
                ),
              ),
                GestureDetector(
                  onTap: () => _ShowTimePicker(context, timerProvider),
                  child: Text(
                    _formatTime(timerProvider.remainingTime),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
                ),
              ]
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:
                      timerProvider.isRunning
                  ? timerProvider.pauseTime :
                  timerProvider.StartTime,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(
                      timerProvider.isRunning?
                      Icons.pause:Icons.play_arrow,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: timerProvider.resetTime,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.stop,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  void _ShowTimePicker(BuildContext context, TimerProvider timerProvider) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Container(
          color: Colors.white,
          height: 300,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hms,
            initialTimerDuration: Duration(seconds: timerProvider.remainingTime),
            onTimerDurationChanged: (Duration newDuration) {
              if (newDuration.inSeconds > 0) {
                timerProvider.setTime(newDuration.inSeconds);
              }
            },
          ),
        );
      },
    );
  }
  String _formatTime( int totalSceond) {
    int hours = totalSceond ~/ 3600;
    int minutes = (totalSceond % 3600 ) ~/60;
    int seconds = totalSceond % 60;
    return "${hours.toString().padLeft(2,"0")}:${minutes.toString().padLeft(2,"0")}:${seconds.toString().padLeft(2,"0")}";
  }
}
