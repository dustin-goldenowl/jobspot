import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/app_tags.dart';

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
      message.notification?.title.toString(),
      _getContentNotify(message.notification?.body),
      notificationDetails,
    );
  }

  static String _getContentNotify(String? type) {
    final content = switch (type) {
      AppTags.favourite => AppLocal.text.notification_push_favourite,
      AppTags.favouriteCmt => AppLocal.text.notification_push_favourite_cmt,
      AppTags.accept => AppLocal.text.notification_push_accept,
      AppTags.reject => AppLocal.text.notification_push_reject,
      AppTags.apply => AppLocal.text.notification_push_apply,
      AppTags.comment => AppLocal.text.notification_push_comment,
      AppTags.reply => AppLocal.text.notification_push_reply,
      AppTags.share => AppLocal.text.notification_push_share,
      _ => "",
    };
    return content;
  }
}
