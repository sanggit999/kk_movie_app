class UserEntity {
  final String uid;
  final String email;
  final String name;
  final String avatarUrl;
  final String provider;
  final DateTime? createdAt;

  UserEntity({
    required this.uid,
    required this.email,
    required this.name,
    required this.avatarUrl,
    required this.provider,
    required this.createdAt,
  });
}
