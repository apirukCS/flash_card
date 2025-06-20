import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppFn {
  Future<void> showSimpleNotification(String title, String description) async {
    try {
      final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      final androidDetails = AndroidNotificationDetails(
        'default_channel_id',
        'General Notifications',
        importance: Importance.max,
        priority: Priority.high,
      );

      NotificationDetails notificationDetails = NotificationDetails(
        android: androidDetails,
      );

      await flutterLocalNotificationsPlugin.show(
        0,
        title,
        description,
        notificationDetails,
      );
    } catch (e) {
      log("error showSimpleNotification $e");
    }
  }
}
