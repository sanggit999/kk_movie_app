import 'package:kk_movie_app/core/constants/api_url.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/network/api_client.dart';
import 'package:kk_movie_app/data/category/models/category_model.dart';
import 'package:kk_movie_app/data/movie/models/movie_model.dart';

abstract class CategoryApiService {
  Future<List<CategoryModel>> getCategories();
  Future<List<MovieModel>> getCategoryDetail(String slug);
}

class CategoryApiServiceImpl implements CategoryApiService {
  final ApiClient apiClient;

  CategoryApiServiceImpl({required this.apiClient});
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final response = await apiClient.get(ApiUrl.categories);
      final items = response as List<dynamic>;

      return items.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getCategoryDetail(String slug) async {
    try {
      final response = await apiClient.get("${ApiUrl.categoryDetail}/$slug");
      final items = response['data']['items'] as List<dynamic>;

      return items.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
