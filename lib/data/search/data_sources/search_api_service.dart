import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kk_movie_app/core/constants/api_url.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';
import 'package:kk_movie_app/core/network/api_client.dart';
import 'package:kk_movie_app/data/movie/models/movie_model.dart';
import 'package:kk_movie_app/data/search/models/search_history_model.dart';

abstract class SearchApiService {
  Future<List<MovieModel>> searchMovie(String keyword);

  Future<List<SearchHistoryModel>> getSearchHistory(String uid);

  Future<void> saveSearchHistory(SearchHistoryModel searchHistoryModel);

  Future<void> deleteSearchHistoryItem(String uid, String keyword);

  Future<void> clearSearchHistory(String uid);
}

class SearchApiServiceImpl implements SearchApiService {
  SearchApiServiceImpl({required this.apiClient});
  final ApiClient apiClient;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<List<MovieModel>> searchMovie(String keyword) async {
    try {
      final response = await apiClient.get(
        "${ApiUrl.movieSearch}?keyword=$keyword",
      );

      final items = response['data']['items'] as List<dynamic>;

      return items.map((json) => MovieModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<List<SearchHistoryModel>> getSearchHistory(String uid) async {
    try {
      final response = await _firebaseFirestore
          .collection("SearchHistories")
          .doc(uid)
          .collection("items")
          .orderBy("created_at", descending: true)
          .get();

      return response.docs
          .map((doc) => SearchHistoryModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> saveSearchHistory(SearchHistoryModel searchHistoryModel) async {
    try {
      final ref = _firebaseFirestore
          .collection("SearchHistories")
          .doc(searchHistoryModel.uid)
          .collection("items")
          .doc(searchHistoryModel.keyword);

      await ref.set(searchHistoryModel.toJson());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteSearchHistoryItem(String uid, String keyword) async {
    try {
      await _firebaseFirestore
          .collection("SearchHistories")
          .doc(uid)
          .collection("items")
          .doc(keyword)
          .delete();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> clearSearchHistory(String uid) async {
    try {
      final collection = _firebaseFirestore
          .collection("SearchHistories")
          .doc(uid)
          .collection("items");

      final snapshot = await collection.get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
