import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobspot/src/presentations/add_job/widgets/add_button.dart';
import 'package:jobspot/src/presentations/save_job/widgets/tag_item.dart';

void main() {
  testWidgets('test add button', (tester) async {
    await tester.pumpWidget(
        MaterialApp(home: AddButton(isShowEdit: false, onTap: () {})));

    final iconFinder = find.byIcon(FontAwesomeIcons.plus);
    expect(iconFinder, findsOneWidget);
  });

  testWidgets('test tag item', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: TagItem(title: "Design")));

    final textFinder = find.text("Design");
    expect(textFinder, findsOneWidget);
  });
}
