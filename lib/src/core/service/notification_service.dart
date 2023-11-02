import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/constants/app_tags.dart';
import 'package:jobspot/src/presentations/view_job/screen/view_job_page.dart';
import 'package:jobspot/src/presentations/view_post/screen/view_post_page.dart';

//TODO when change app icon => change @mipmap/ic_launcher => @drawable/ic_launcher
class NotificationServices {
  NotificationServices._();

  static BuildContext? _context;

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<AndroidNotificationDetails> _androidNotificationDetails({
    required String id,
    required String avatar,
  }) async {
    final response = await Dio()
        .get(avatar, options: Options(responseType: ResponseType.bytes));
    Uint8List bytes = Uint8List.fromList(response.data);
    ByteArrayAndroidBitmap bitmap =
        ByteArrayAndroidBitmap.fromBase64String(base64Encode(bytes));
    BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(bitmap, largeIcon: bitmap);
    return AndroidNotificationDetails(
      id,
      'jobspot_walter',
      channelDescription: 'my channel notification jobspot',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
      // largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
      styleInformation: bigPictureStyleInformation,
      playSound: true,
    );
  }

  static DarwinNotificationDetails get _darwinNotificationDetails =>
      const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

  static Future init(BuildContext context) async {
    _context = context;
    var androidInitializationSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: _clickNotification,
    );
  }

  static void _clickNotification(NotificationResponse payload) {
    Map<String, dynamic> data = jsonDecode(payload.payload ?? "");
    switch (data["type"]) {
      case AppTags.favourite:
      case AppTags.favouriteCmt:
      case AppTags.comment:
      case AppTags.share:
      case AppTags.reply:
        Navigator.push(
          _context!,
          MaterialPageRoute(
            builder: (context) => ViewPostPage(postID: data["action"]),
          ),
        );
        break;
      case AppTags.accept:
      case AppTags.reject:
      case AppTags.apply:
        Navigator.push(
          _context!,
          MaterialPageRoute(
            builder: (context) => ViewJobPage(jobID: data["action"]),
          ),
        );
      case AppTags.follow:
      default:
    }
    ;
  }

  static Future showNotification(RemoteMessage message) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: await _androidNotificationDetails(
        id: message.messageId.toString(),
        avatar: message.data["avatar"],
      ),
      iOS: _darwinNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      message.messageId.hashCode,
      message.notification?.title,
      _getContentNotify(message.notification?.body),
      notificationDetails,
      payload: jsonEncode(message.data),
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
      AppTags.follow => AppLocal.text.notification_push_follow,
      _ => "",
    };
    return content;
  }
}
