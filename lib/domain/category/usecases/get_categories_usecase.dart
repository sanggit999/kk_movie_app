import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/category/entities/category_entity.dart';
import 'package:kk_movie_app/domain/category/repositories/category_repository.dart';

class GetCategoriesUseCase
    implements UseCase<Either<Failure, List<CategoryEntity>>, NoParams> {
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) {
    return getIt<CategoryRepository>().getCategories();
  }
}
