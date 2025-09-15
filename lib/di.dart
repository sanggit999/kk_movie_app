import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:kk_movie_app/common/cubit/internet_cubit.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';
import 'package:kk_movie_app/core/network/api_client.dart';
import 'package:kk_movie_app/core/network/connection_checker.dart';
import 'package:kk_movie_app/data/auth/data_sources/auth_firebase_service.dart';
import 'package:kk_movie_app/data/auth/repositories_impl/auth_repository_impl.dart';
import 'package:kk_movie_app/data/movie/data_sources/movie_api_service.dart';
import 'package:kk_movie_app/data/movie/repositories_impl/movie_repository_impl.dart';
import 'package:kk_movie_app/domain/auth/repositories/auth_repository.dart';
import 'package:kk_movie_app/domain/auth/usecases/get_current_user_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/send_password_reset_email_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signin_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signin_with_google_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/sign_out_usecase.dart';
import 'package:kk_movie_app/domain/auth/usecases/signup_usecase.dart';
import 'package:kk_movie_app/domain/movie/repositories/movie_repository.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_cartoon_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_new_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_series_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_single_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_view_all_cartoon_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_view_all_series_movie_usecase.dart';
import 'package:kk_movie_app/domain/movie/usecases/get_view_all_single_movie_usecase.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  //Connection Checker
  getIt.registerFactory<InternetCubit>(
    () => InternetCubit(internetConnection: InternetConnection()),
  );

  getIt.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(internetConnection: InternetConnection()),
  );

  // Api Client
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(http.Client()));

  //DataSources
  getIt.registerLazySingleton<AuthFirebaseService>(
    () => AuthFirebaseServiceImpl(),
  );

  getIt.registerLazySingleton<MovieApiService>(
    () => MovieApiServiceImpl(apiClient: getIt<ApiClient>()),
  );

  //Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl());

  //UseCases
  getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
  getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase());
  getIt.registerLazySingleton<SigninWithGoogleUseCase>(
    () => SigninWithGoogleUseCase(),
  );
  getIt.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(),
  );
  getIt.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase());
  getIt.registerLazySingleton<SendPasswordResetEmailUseCase>(
    () => SendPasswordResetEmailUseCase(),
  );

  getIt.registerLazySingleton<GetNewMovieUseCase>(() => GetNewMovieUseCase());
  getIt.registerLazySingleton<GetSeriesMovieUseCase>(
    () => GetSeriesMovieUseCase(),
  );
  getIt.registerLazySingleton<GetSingleMovieUseCase>(
    () => GetSingleMovieUseCase(),
  );
  getIt.registerLazySingleton<GetCartoonMovieUseCase>(
    () => GetCartoonMovieUseCase(),
  );
  getIt.registerLazySingleton<GetViewAllSeriesMovieUseCase>(
    () => GetViewAllSeriesMovieUseCase(),
  );
  getIt.registerLazySingleton<GetViewAllSingleMovieUseCase>(
    () => GetViewAllSingleMovieUseCase(),
  );
  getIt.registerLazySingleton<GetViewAllCartoonMovieUseCase>(
    () => GetViewAllCartoonMovieUseCase(),
  );
  //Cubits
  getIt.registerSingleton<LanguageCubit>(LanguageCubit());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
