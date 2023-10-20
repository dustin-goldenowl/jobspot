import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/core/constants/constants.dart';
import 'package:jobspot/src/core/extension/string_extension.dart';

@RoutePage()
class ViewPDFPage extends StatelessWidget {
  const ViewPDFPage({super.key, this.title, required this.url});

  final String? title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(title ?? ""),
        titleTextStyle: AppStyles.boldTextHaiti.copyWith(fontSize: 18),
        leading: IconButton(
          onPressed: () => context.router.pop(),
          icon: const Icon(FontAwesomeIcons.xmark),
        ),
      ),
      body: SafeArea(
        child: url.isLink
            ? const PDF().cachedFromUrl(
                url,
                placeholder: (progress) => Center(child: Text('$progress %')),
                errorWidget: (error) => Center(child: Text(error.toString())),
              )
            : const PDF().fromPath(url),
      ),
    );
  }
}
