import 'package:caracas_ya_app/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  @override
  void onReady() async {
    final statusNotificationPermission =
        await Helper().checkStatusNotificationPermission();

    if (statusNotificationPermission) {
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        String? token = await messaging.getToken();
        debugPrint(token);

        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          message.toMap().forEach((key, value) {
            print("$key: $value");
          });
          // Handle the message and display the notification in the UI
        });

        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          print("onMessageOpenedApp: $message");
          // Handle the notification when the app is opened from the notification
        });

        FirebaseMessaging.onBackgroundMessage(
            _firebaseMessagingBackgroundHandler);
      }
    }

    super.onReady();
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }
}
