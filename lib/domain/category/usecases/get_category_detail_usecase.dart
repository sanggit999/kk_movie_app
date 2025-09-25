import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/category/repositories/category_repository.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';

class GetCategoryDetailUseCase
    implements UseCase<Either<Failure, List<MovieEntity>>, String> {
  @override
  Future<Either<Failure, List<MovieEntity>>> call(String params) {
    return getIt<CategoryRepository>().getCategoryDetail(params);
  }
}
