import 'package:flutter/material.dart';
import 'package:notifyme/services/notification.dart';
import 'package:notifyme/views/home_view.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Monteserat'),
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => NotificationService())
        ]);
  }
}
