import 'package:badidukkantest/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterLocalNotificationsPlugin some=await init(); // <----
  runApp(MyApp(some:some));
}

class MyApp extends StatelessWidget {
  final some;

  const MyApp({Key? key, this.some}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BadiDukkan Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Alarm(some:some)
    );
  }
}
