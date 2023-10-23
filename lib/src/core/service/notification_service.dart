import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//TODO when change app icon => change @mipmap/ic_launcher => @drawable/ic_launcher
class NotificationServices {
  NotificationServices._();

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static AndroidNotificationDetails _androidNotificationDetails(String id) {
    return AndroidNotificationDetails(
      id,
      'jobspot_walter',
      channelDescription: 'my channel notification jobspot',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@mipmap/ic_launcher',
      largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      playSound: true,
    );
  }

  static DarwinNotificationDetails get _darwinNotificationDetails =>
      const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

  static void init() async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {});
  }

  static Future showNotification(RemoteMessage message) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: _androidNotificationDetails(message.messageId.toString()),
      iOS: _darwinNotificationDetails,
    );

    _flutterLocalNotificationsPlugin.show(
      message.messageId.hashCode,
      message.notification!.title.toString(),
      message.notification!.body.toString(),
      notificationDetails,
    );
  }
}
