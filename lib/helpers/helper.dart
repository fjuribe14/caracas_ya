import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';

class Helper {
  // A function that takes a double value and returns a formatted currency string with the currency symbol "₡".
  static String formatCurrency({
    required double value,
  }) =>
      '₡${value.toStringAsFixed(2)}';

  // A function that takes a number value and an optional parameter decimalPlaces, and formats the number using the specified decimal places. It returns the formatted number as a string.
  static String formatNumber(num value, {int decimalPlaces = 0}) {
    final numberFormat = NumberFormat.decimalPattern(Get.locale!.languageCode);
    numberFormat.maximumFractionDigits = decimalPlaces;
    return numberFormat.format(value);
  }

  // A function to format the given date using the specified format.
  // - date: The date to be formatted.
  // - format: The format in which the date should be displayed. Defaults to 'dd-MM-yyyy'.
  // Returns the formatted date as a string.
  static String formatData({
    required DateTime date,
    String? format = 'dd-MM-yyyy',
  }) =>
      DateFormat(format).format(date);

  // A function to check and request biometric permission, returning a Future<bool>.
  Future<bool> checkAndRequestBiometricPermission() async {
    final localAuth = LocalAuthentication();
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;

    if (!canCheckBiometrics) {
      Get.snackbar('Información', 'Dispositivo no compatible con biometría.');
      return false; // Dispositivo no compatible con biometría
    }

    List<BiometricType> availableBiometrics =
        await localAuth.getAvailableBiometrics();

    if (availableBiometrics.isEmpty) {
      Get.snackbar('Información', 'No se encontraron biometrías disponibles.');
      Future.delayed(const Duration(seconds: 1)).then((value) =>
          AppSettings.openAppSettings(type: AppSettingsType.security));
      return false; // No se encontraron biometrías disponibles
    }

    bool isAuthorized = await localAuth.authenticate(
      localizedReason: 'Por favor, autentícate para proceder',
      options:
          const AuthenticationOptions(useErrorDialogs: true, stickyAuth: true),
    );

    if (!isAuthorized) {
      Get.snackbar('Información', 'No se pudo autenticar con la biometría.');
    }

    return isAuthorized;
  }

  Future<bool> checkStatusNotificationPermission() async {
    final status = await requestNotificationPermission();
    return status.authorizationStatus == AuthorizationStatus.authorized;
  }

  Future<NotificationSettings> requestNotificationPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    final status = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (status.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      debugPrint({'messaging token': token}.toString());

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

    return status;
  }

  Future<void> openNotificationSettings() async {
    return await AppSettings.openAppSettings(
        type: AppSettingsType.notification);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }
}
