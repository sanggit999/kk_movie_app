import 'package:get_it/get_it.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';
import 'package:kk_movie_app/data/auth/datasources/auth_firebase_service.dart';
import 'package:kk_movie_app/data/auth/repositories/auth_repository_impl.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';
import 'package:kk_movie_app/domain/auth/usecases/get_current_user_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/login_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/send_password_reset_email_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signin_with_google_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signout_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signup_usecase.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  //DataSources
  getIt.registerLazySingleton<AuthFirebaseService>(
    () => AuthFirebaseServiceImpl(),
  );

  //Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  //UseCases
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase());
  getIt.registerLazySingleton<SignupUseCase>(() => SignupUseCase());
  getIt.registerLazySingleton<SigninWithGoogleUseCase>(
    () => SigninWithGoogleUseCase(),
  );
  getIt.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(),
  );
  getIt.registerLazySingleton<SignOutUseCase>(()=>SignOutUseCase());
  getIt.registerLazySingleton<SendPasswordResetEmailUseCase>(()=>SendPasswordResetEmailUseCase());
  //Cubits
  getIt.registerSingleton<LanguageCubit>(LanguageCubit());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
