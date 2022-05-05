import 'package:flutter_test/flutter_test.dart';
import 'package:today_i_learned/src/categories/models/category/category_model.dart';
import 'package:today_i_learned/src/learnings/learnings.dart';

import '../../widget_test_wrapper.dart';

void main() {
  testWidgets('Learnings List Element works', (WidgetTester tester) async {
    final learning = LearningModel(
      uid: 'uid',
      title: 'Learning',
      description: 'my test description',
      difficulty: 5,
      created: DateTime(2022, 4, 27),
    );

    final category = CategoryModel(uid: 'uid', name: 'My super category');

    bool hasBeenPressed = false;

    await tester.pumpWidget(
      WidgetTestWrapper(
        child: LearningsListElement(
          learning: learning,
          category: category,
          onTap: () => hasBeenPressed = true,
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text(learning.title), findsOneWidget);
    expect(find.textContaining(RegExp(category.name)), findsOneWidget);
    expect(find.textContaining(RegExp(learning.description!)), findsOneWidget);

    await tester.tap(find.byType(LearningsListElement));

    await tester.pumpAndSettle();

    expect(hasBeenPressed, isTrue);
  });
}
