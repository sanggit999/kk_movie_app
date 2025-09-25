import 'package:kk_movie_app/data/category/models/category_model.dart';
import 'package:kk_movie_app/domain/category/entities/category_entity.dart';

class CategoryMapper {
  CategoryMapper._();

  static List<CategoryEntity> toEntity(List<CategoryModel> categoryModels) {
    return categoryModels
        .map((e) => CategoryEntity(id: e.id, name: e.name, slug: e.slug))
        .toList();
  }
}
