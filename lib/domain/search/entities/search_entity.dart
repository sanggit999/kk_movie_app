class SearchHistoryEntity {
  final String id;
  final String uid;
  final String keyword;
  final DateTime createdAt;

  const SearchHistoryEntity( {
    required this.id,
    required this.uid,
    required this.keyword,
    required this.createdAt,
  });
}
