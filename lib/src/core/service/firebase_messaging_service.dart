import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:jobspot/firebase_options.dart';
import 'package:jobspot/src/core/service/notification_service.dart';
import 'package:jobspot/src/core/utils/prefs_utils.dart';

class FirebaseMessagingService {
  FirebaseMessagingService._();

  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  static String get _baseURL => "https://fcm.googleapis.com/fcm/send";

  static String get _serverKey =>
      "key=AAAAHWK9kUw:APA91bH0B5tRoc3hyglFnad68bNsupMbEGJSrm_ytSYFv49B-xjX5s1hS3NSf6wm_uvgAC_cnyfdXAvLsoX7YkmWny-0_guAbyD5aQ9Bdw7ZhmmCaPCDoPTCJ1gctU54yxAQI0v73-18";

  static Map<String, String> get _header => {
        "Content-Type": "application/json",
        "Authorization": _serverKey,
      };

  static Future sendNotification({
    required String token,
    required String body,
    required String action,
    required String type,
  }) async {
    final user = PrefsUtils.getUserInfo();
    final data = {
      "to": token,
      "priority": "high",
      "data": {
        "avatar": user?.avatar ?? "",
        "action": action,
        "type": type,
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
      },
      "notification": {"title": user?.name ?? "", "body": body},
    };
    try {
      await Dio()
          .post(_baseURL, data: data, options: Options(headers: _header));
    } on DioException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<String?> getToken() async {
    final token = await _fcm.getToken();
    print(token);
    return token;
  }

  static void listenNotification() {
    FirebaseMessaging.onMessage.listen((event) {
      print("onMessage");
      print(event.data);
      NotificationServices.showNotification(event);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    print("onBackgroundMessage");
    print(message.data);
    NotificationServices.showNotification(message);
  }

  static Future setupNotification() async {
    await Future.wait([
      NotificationServices.init(),
      FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      ),
    ]);
    listenNotification();
  }
}
