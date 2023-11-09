import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:jobspot/injection.dart';
import 'package:jobspot/src/core/config/router/app_router.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';

class NotificationServices {
  NotificationServices._();

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<AndroidNotificationDetails> _androidNotificationDetails({
    required String id,
    required String avatar,
  }) async {
    BigPictureStyleInformation? bigPictureStyleInformation;
    if (avatar.isLink) {
      final response = await Dio()
          .get(avatar, options: Options(responseType: ResponseType.bytes));
      Uint8List bytes = Uint8List.fromList(response.data);
      ByteArrayAndroidBitmap bitmap =
          ByteArrayAndroidBitmap.fromBase64String(base64Encode(bytes));
      bigPictureStyleInformation =
          BigPictureStyleInformation(bitmap, largeIcon: bitmap);
    }
    return AndroidNotificationDetails(
      id,
      'jobspot_walter',
      channelDescription: 'my channel notification jobspot',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@drawable/ic_launcher',
      largeIcon: !avatar.isLink
          ? const DrawableResourceAndroidBitmap('@drawable/ic_launcher')
          : null,
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

  static Future init() async {
    var androidInitializationSettings =
        const AndroidInitializationSettings('@drawable/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: _clickNotification,
    );

    final message = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
    final payload = message?.notificationResponse;
    if (payload != null) {
      _clickNotification(payload);
    }
  }

  static void _clickNotification(NotificationResponse payload) {
    Map<String, dynamic> data = jsonDecode(payload.payload ?? "");
    switch (data["type"]) {
      case AppTags.favourite:
      case AppTags.favouriteCmt:
      case AppTags.comment:
      case AppTags.share:
      case AppTags.reply:
        getIt<AppRouter>().push(ViewPostRoute(postID: data["action"]));
        break;
      case AppTags.accept:
      case AppTags.reject:
      case AppTags.apply:
        getIt<AppRouter>().push(ViewJobRoute(jobID: data["action"]));
      case AppTags.follow:
        getIt<AppRouter>().push(ViewApplicantProfileRoute(uid: data["action"]));
      default:
    }
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
      message.data["title"],
      message.data["body"],
      notificationDetails,
      payload: jsonEncode(message.data),
    );
  }
}
