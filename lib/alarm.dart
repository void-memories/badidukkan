import 'package:badidukkantest/dtPicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Alarm extends StatefulWidget {
  final some;
  const Alarm({ Key? key, this.some }) : super(key: key);

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

@override
  void initState() {
     flutterLocalNotificationsPlugin=widget.some;

    super.initState();
  }

void setAlarm(DateTime date) async{
   await flutterLocalNotificationsPlugin.zonedSchedule(
        12345,
        "This is a test alarm",
        "Demo by naman anand",
        tz.TZDateTime.now(tz.local).add( Duration(hours: date.hour,minutes: date.minute,seconds: date.second,)),
        const NotificationDetails(
            android: AndroidNotificationDetails('CHANNEL_ID', 'CHANNEL_NAME',
                'CHANNEL_DESCRIPTION')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: Center(child:Container(
        height: 60,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: MaterialButton(
          onPressed:()=> pickDateTime(context,setAlarm),
        child:Center(child: Text('Set Alarm'),)
        ),
      )),),
    );
  }
}