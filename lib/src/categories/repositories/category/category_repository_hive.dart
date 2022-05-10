import 'package:today_i_learned/src/app/repositories/repositories.dart';
import 'package:today_i_learned/src/categories/models/category/category_model.dart';
import 'package:today_i_learned/src/categories/repositories/category/category_repository.dart';

class CategoryRepositoryHive extends HiveRepository<CategoryModel> implements CategoryRepository {
  CategoryRepositoryHive()
      : super(
          boxName: 'categories',
          getUid: (category) => category.uid,
          setUid: (category, uid) => category.copyWith(uid: uid),
          toJson: (category) => category.toJson(),
          fromJson: (json) => CategoryModel.fromJson(json),
        );
}
