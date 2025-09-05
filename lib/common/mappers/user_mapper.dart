import 'package:kk_movie_app/data/auth/models/user_model.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';

class UserMapper {
  UserMapper._();

  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      uid: model.uid,
      email: model.email,
      name: model.name,
      avatarUrl: model.avatarUrl,
      provider: model.provider,
      createdAt: model.createdAt!,
    );
  }
}
