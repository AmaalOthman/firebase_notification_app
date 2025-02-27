import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notification/Firebase_Nottification/Logic/notification_logic.dart';
import 'package:firebase_notification/Shared/firebase_options.dart';
import 'package:flutter/material.dart';


GlobalKey<NavigatorState>? navKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Initializing Firebase...");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Firebase Initialized!");

  await FirebaseNotification().logFCMToken();
  await FirebaseNotification().subscribeToTopic("all_users").then((_) {
    print("Subscribed to topic: all_users");
  }).catchError((error) {
    print("Failed to subscribe to topic: all_users. Error: \$error");
  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Firebase Notification")),
        body: Center(child: Text("Welcome To Firebase Notification")),
      ),
    );
  }
}
