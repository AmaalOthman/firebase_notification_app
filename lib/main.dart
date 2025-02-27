import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notification/Firebase_Nottification/Logic/notification_logic.dart';
import 'package:firebase_notification/Shared/firebase_options.dart';
import 'package:flutter/material.dart';

    /**  This small app talk about what should i do when i get a notification from firebase cloud messaging fcm 
     * it missed some steps 1- init firebase 
     * Downoad firrebase google service json file from firebase console
     * 1- add firebase google service json file in my android file in res folder
     * 2- make some edit in folder called firebase option in lib folder this file download otomatic when i initialize firebase
     * and then i must do this steps to handle the code to recieve fcm messages successfully 
     * 1- init firebase
     * 2- init firebase notification
     * 3- init firebase messaging
     * 4- listen to fcm messages
     * 5- listen to fcm notification
     * 6- listen to fcm background messages
     * 7- listen to fcm foreground messages  and i make this steps in my file called notification logic 
     * */
       
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
