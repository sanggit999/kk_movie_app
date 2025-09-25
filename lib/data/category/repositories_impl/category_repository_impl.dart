import 'package:dartz/dartz.dart';
import 'package:kk_movie_app/common/mappers/category_mapper.dart';
import 'package:kk_movie_app/common/mappers/movie_mapper.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/errors/failures.dart';
import 'package:kk_movie_app/data/category/data_source/category_api_service.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/category/entities/category_entity.dart';
import 'package:kk_movie_app/domain/category/repositories/category_repository.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final result = await getIt<CategoryApiService>().getCategories();

      return Right(CategoryMapper.toEntity(result));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getCategoryDetail(
    String slug,
  ) async {
    try {
      final result = await getIt<CategoryApiService>().getCategoryDetail(slug);

      final data = result.map((model) => MovieMapper.toEntity(model)).toList();
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
