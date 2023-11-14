import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:jobspot/src/core/config/localization/app_local.dart';
import 'package:jobspot/src/core/config/router/app_router.gr.dart';

class DynamicLinkService {
  static Future<String> createDynamicLink({
    bool short = true,
    required String type,
    required String id,
  }) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://jobspotwalter.page.link',
      link: Uri.parse('https://jobspotwalter.page.link/$type?id=$id'),
      androidParameters:
          const AndroidParameters(packageName: 'com.walter.jobspot'),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
          await FirebaseDynamicLinks.instance.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await FirebaseDynamicLinks.instance.buildLink(parameters);
    }
    return url.toString();
  }

  static Future initDynamicLink() async {
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      final Uri deepLink = event.link;
      bool isPost = deepLink.pathSegments.contains('post');
      String? id = deepLink.queryParameters["id"];
      if (id != null) {
        if (isPost) {
          AppLocal.rootRouter.push(ViewPostRoute(postID: id));
        } else {
          AppLocal.rootRouter.push(ViewJobRoute(jobID: id));
        }
      }
    });
  }

  static Future initUniLinks() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    try {
      final Uri? deepLink = data?.link;
      bool? isPost = deepLink?.pathSegments.contains('post');
      String? id = deepLink?.queryParameters["id"];
      if (id != null) {
        if (isPost == true) {
          AppLocal.rootRouter.push(ViewPostRoute(postID: id));
        } else {
          AppLocal.rootRouter.push(ViewJobRoute(jobID: id));
        }
      }
    } catch (e) {
      log("No deepLink found");
      log(e.toString());
    }
  }
}
