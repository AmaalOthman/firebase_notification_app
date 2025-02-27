import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notification/Firebase_Nottification/Presentation/notification_ui.dart';
import 'package:firebase_notification/Shared/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FirebaseNotification {
  static final FirebaseNotification _instance = FirebaseNotification._internal();
  factory FirebaseNotification() => _instance;
  FirebaseNotification._internal();

  List<RemoteMessage> notifications = [];

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> logFCMToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("FCM Token: $token");
  }

  Future<void> initNotifications(BuildContext context) async {
    await logFCMToken();
     // Subscribe to the 'all_users' topic when you make a groub and want to send notification to group that it is name called all_users
    await subscribeToTopic("all_users");

     List<String> saved = await getStoredNotifications();
      notifications.addAll(saved.map((notif) {
        return RemoteMessage(
          notification: RemoteNotification(
            title: notif.split('|')[0], 
            body: notif.split('|')[1],
          ),
         );
      }));


    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("Foreground message received: ${message.notification?.title}");
      if (message.data['topic'] == 'all_users') {
        print("Message received for topic: all_users");
      }
      notifications.add(message);
      print("Updated Notifications List: ${notifications.length} items");
       saveNotification(message);
       showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("Notification clicked: ${message.data}");

      notifications.add(message);
      saveNotification(message);
      Navigation.mainNavigator(NotificationScreen(messages: notifications));
    });

     _flutterLocalNotificationsPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        ),
        onDidReceiveNotificationResponse: (NotificationResponse response) async {
         if (response.payload != null) {
            final data = jsonDecode(response.payload!);
            Navigation.mainNavigator(NotificationScreen(messages: notifications));
          }
        },
     );

    await loadNotifications(); // Load saved notifications
  }
       // HANDLE PART OF NOTIFICATION WITH GROUP OR TOBIC CALLED ALL_USERS
  Future<void> subscribeToTopic(String topic) async {
  try {
    // Check if already subscribed
    final topics = await FirebaseMessaging.instance.getToken();
    if (!topics!.contains(topic)) {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
      print("Subscribed to topic: $topic");
    } else {
      print("Already subscribed to topic: $topic");
    }
  } catch (e) {
    print("Failed to subscribe to topic: $topic. Error: $e");
  }
}
  
Future<void> unsubscribeFromTopic(String topic) async {
  try {
    await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    print("Unsubscribed from topic: $topic");
  } catch (e) {
    print("Failed to unsubscribe from topic: $topic. Error: $e");
  }
}
                 // USE SHARED PREFRENCE TO SAVE NOTIFICATION IN MY DEVICE
  void saveNotification(RemoteMessage message) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> storedNotifications = prefs.getStringList('notifications') ?? [];
  
  // Save notification in SharedPreferences
  storedNotifications.add("${message.notification?.title}|${message.notification?.body}");
  await prefs.setStringList('notifications', storedNotifications);
}

  
  Future<void> loadNotifications() async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? saved = prefs.getStringList('notifications');
  if (saved != null) {
    notifications = saved.map((data) {
      final parts = data.split('|');
      return RemoteMessage(
        notification: RemoteNotification(
          title: parts[0],
          body: parts[1],
        ),
      );
    }).toList();
  }
}

   Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'high_importance_channel', 
          'High Importance Notifications',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      0, 
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      notificationDetails,
      payload: jsonEncode({
        'title': message.notification?.title,
        'body': message.notification?.body,
      }),
    );
  }
}

Future<List<String>> getStoredNotifications() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('notifications') ?? [];
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("📨 Handling background message: ${message.messageId}");
  final prefs = await SharedPreferences.getInstance();
  List<String> storedNotifications = prefs.getStringList('notifications') ?? [];
  storedNotifications.add("${message.notification?.title}|${message.notification?.body}");
  await prefs.setStringList('notifications', storedNotifications);
}
