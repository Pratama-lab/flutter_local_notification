import 'package:flutter/material.dart';
import 'package:notifyme/services/notification.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getToken();
    Provider.of<NotificationService>(context, listen: false).initialize();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      AndroidInitializationSettings androidInitializationSettings =
          AndroidInitializationSettings("ic_launcher");

      IOSInitializationSettings iosInitializationSettings =
          IOSInitializationSettings();

      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: androidInitializationSettings,
              iOS: iosInitializationSettings);

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
      var android = AndroidNotificationDetails("id", "channel");

      var ios = IOSNotificationDetails();

      var platform = new NotificationDetails(android: android, iOS: ios);

      await _flutterLocalNotificationsPlugin.show(message.notification.hashCode,
          message.notification.title, message.notification.body, platform,
          payload: "Welcome to demo app");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      AndroidInitializationSettings androidInitializationSettings =
          AndroidInitializationSettings("ic_launcher");

      IOSInitializationSettings iosInitializationSettings =
          IOSInitializationSettings();

      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: androidInitializationSettings,
              iOS: iosInitializationSettings);

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
      var android = AndroidNotificationDetails("id", "channel");

      var ios = IOSNotificationDetails();

      var platform = new NotificationDetails(android: android, iOS: ios);

      await _flutterLocalNotificationsPlugin.show(event.notification.hashCode,
          event.notification.title, event.notification.body, platform,
          payload: "Welcome to demo app");
    });
  }

  getToken() async {
    FirebaseMessaging.instance
        .getToken()
        .then((deviceToken) => print('Device Token => $deviceToken'))
        .catchError((error) => print('error => $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
                child: Consumer<NotificationService>(
      builder: (context, model, _) =>
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () => model.instantNofitication(),
            child: Text('Instant Notification'))
      ]),
    ))));
  }
}
