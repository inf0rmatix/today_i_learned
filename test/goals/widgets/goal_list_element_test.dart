import 'package:flutter_test/flutter_test.dart';
import 'package:today_i_learned/src/categories/models/category/category_model.dart';
import 'package:today_i_learned/src/goals/goals.dart';

import '../../widget_test_wrapper.dart';

// ignore_for_file: no-magic-number
void main() {
  testWidgets(
    'Goal List Element',
    (WidgetTester tester) async {
      bool hasBeenPressed = false;

      final goal = GoalModel(
        uid: 'uid',
        title: 'My goal',
        created: DateTime(2022, 04, 27),
        deadline: DateTime(2022, 05, 27),
        requiredLearnings: 42,
        learnings: 32,
        requiredDifficulty: 4,
      );

      final category = CategoryModel(
        uid: 'uid',
        name: 'Flutter',
      );

      await tester.pumpWidget(
        WidgetTestWrapper(
          child: GoalListElement(
            goal: goal,
            category: category,
            onTap: (_) => hasBeenPressed = true,
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GoalListElement));

      await tester.pumpAndSettle();

      expect(find.text(goal.title), findsOneWidget);
      expect(find.text(category.name), findsOneWidget);
      expect(find.textContaining(goal.requiredLearnings.toString()), findsNWidgets(2));
      expect(find.textContaining(goal.learnings.toString()), findsOneWidget);
      expect(find.textContaining(goal.requiredDifficulty.toStringAsFixed(1)), findsOneWidget);
      expect(hasBeenPressed, isTrue);
    },
  );
}
