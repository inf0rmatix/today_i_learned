import 'package:today_i_learned/src/categories/categories.dart';

// ignore: avoid_classes_with_only_static_members
class CategoriesMock {
  static const List<String> categoryNames = [
    'Flutter',
    'Self-Management',
    'Mental-Health',
    'General Knowledge',
    'Science',
  ];

  static Future createAll(CategoryRepository categoryRepository) async {
    for (final categoryName in categoryNames) {
      await categoryRepository.create(CategoryModel(uid: '', name: categoryName));
    }
  }
}
