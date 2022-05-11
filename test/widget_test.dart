import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:notify/model/user_model.dart';
import 'package:notify/widgets/user_widget.dart';

void main() {
  testWidgets('check delete button && name exists',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: UsersWidget(
          user: UserModel.fromJson({
            "name": "Jamal Izzedin",
            "role": "Branch Admin",
            "place": "Sanaya",
            "city": "Riyadh",
            "branch": "branch 1"
          }),
          index: 0,
        ),
      ),
    );

    expect(find.byKey(Key('delete-0')), findsNothing);
    expect(find.text('Jamal Izzedin'), findsOneWidget);
    await tester.pump();
    await tester.tap(find.byKey(Key('name-0')));

    await tester.pump();
    expect(find.byKey(Key('delete-0')), findsOneWidget);
  });
}
