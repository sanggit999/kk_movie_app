import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/domain/category/entities/category_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<MovieEntity>>> getCategoryDetail(
    String? slug, {
    int? page,
    String? sortType,
        String? sortLang,
  });
}
