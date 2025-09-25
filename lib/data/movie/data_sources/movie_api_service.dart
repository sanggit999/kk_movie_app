import 'package:kk_movie_app/core/constants/api_url.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/network/api_client.dart';
import 'package:kk_movie_app/data/movie/models/movie_detail_model.dart';
import 'package:kk_movie_app/data/movie/models/movie_model.dart';
import 'package:kk_movie_app/core/enums/movie_type.dart';

abstract class MovieApiService {
  Future<List<MovieModel>> getNewMovie();
  Future<List<MovieModel>> getSeriesMovie();
  Future<List<MovieModel>> getSingleMovie();
  Future<List<MovieModel>> getCartoonMovie();

  Future<List<MovieModel>> getViewAllMovies(
    MovieType type, {
    int? page,
    String? sortType,
    String? sortLang,
  });

  Future<MovieDetailModel> getMovieDetail(String slug);
}

class MovieApiServiceImpl implements MovieApiService {
  final ApiClient apiClient;

  MovieApiServiceImpl({required this.apiClient});
  @override
  Future<List<MovieModel>> getNewMovie() async {
    try {
      final response = await apiClient.get(ApiUrl.newMovies);

      final items = response['items'] as List<dynamic>;

      return items.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getSeriesMovie() async {
    try {
      final response = await apiClient.get(ApiUrl.movieSeries);

      final items = response['data']['items'] as List<dynamic>;

      return items.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getSingleMovie() async {
    try {
      final response = await apiClient.get(ApiUrl.movieSingle);

      final items = response['data']['items'] as List<dynamic>;

      return items.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getCartoonMovie() async {
    try {
      final response = await apiClient.get(ApiUrl.movieCartoon);

      final items = response['data']['items'] as List<dynamic>;

      return items.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<MovieModel>> getViewAllMovies(
    MovieType type, {
    int? page,
    String? sortType,
    String? sortLang,
  }) async {
    try {
      final queryParams = {
        'page': page.toString(),
        if (sortType != null) 'sort_type': sortType,
        if (sortLang != null) 'sort_lang': sortLang,
      };

      final String endpoint;
      switch (type) {
        case MovieType.series:
          endpoint = ApiUrl.movieSeries;
          break;
        case MovieType.single:
          endpoint = ApiUrl.movieSingle;
          break;
        case MovieType.cartoon:
          endpoint = ApiUrl.movieCartoon;
          break;
      }

      final uri = Uri.parse(endpoint).replace(queryParameters: queryParams);
      final response = await apiClient.get(uri.toString());

      final items = response['data']['items'] as List<dynamic>;
      return items.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(String slug) async {
    try {
      final response = await apiClient.get("${ApiUrl.movieDetail}/$slug");

      return MovieDetailModel.fromJson(response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
