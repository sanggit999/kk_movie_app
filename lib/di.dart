import 'package:get_it/get_it.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  //Cubits

  getIt.registerSingleton<LanguageCubit>(LanguageCubit());
}
