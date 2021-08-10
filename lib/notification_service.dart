import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


Future<FlutterLocalNotificationsPlugin> init() async {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('bd');
  
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
    // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  );
  
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, 
            iOS: initializationSettingsIOS, 
            macOS: null);
  
  tz.initializeTimeZones();  // <------
  
   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        // onSelectNotification: selectNotification
        );

        return flutterLocalNotificationsPlugin;
        
  }

  