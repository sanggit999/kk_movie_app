class ServerException implements Exception {
  final int? code;
  final String? message;
  ServerException({this.code, this.message});
}

class CacheException implements Exception {
  final String? message;
  CacheException({this.message});
}
