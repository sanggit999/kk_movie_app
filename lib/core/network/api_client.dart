import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kk_movie_app/core/constants/api_url.dart';
import 'package:kk_movie_app/core/errors/exceptions.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  final String _baseUrl = ApiUrl.baseUrl;

  Future<dynamic> get(String endpoint) async {
    final uri = Uri.parse('$_baseUrl/$endpoint');
    if (!kReleaseMode) _logRequest('GET', uri.toString());

    try {
      final response = await _client
          .get(uri)
          .timeout(const Duration(seconds: 15));

      if (!kReleaseMode) _logResponse(response);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ServerException(
          code: response.statusCode,
          message: response.body,
        );
      }
    } on TimeoutException {
      throw ServerException(code: 408, message: 'Request timeout');
    } on SocketException {
      throw ServerException(code: 503, message: 'No Internet connection');
    }
  }

  void _logRequest(String method, String url) {
    print('➡️ [$method] $url');
  }

  void _logResponse(http.Response response) {
    print('⬅️ [Status] ${response.statusCode}');
    try {
      final decoded = json.decode(response.body);
      final prettyJson = const JsonEncoder.withIndent('  ').convert(decoded);
      print('⬅️ [Response Body]:\n$prettyJson');
    } catch (e) {
      print('⬅️ [Raw Body]: ${response.body}');
    }
  }
}
