import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kk_movie_app/common/cubit/internet_cubit.dart';
import 'package:kk_movie_app/common/cubit/internet_state.dart';
import 'package:kk_movie_app/firebase_options.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:kk_movie_app/router/app_router.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/themes/app_theme.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AuthCubit>()),
        BlocProvider.value(value: getIt<LanguageCubit>()),
        BlocProvider.value(value: getIt<InternetCubit>()),
        BlocProvider.value(value: getIt<MovieDetailCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          title: 'KK Movies',
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: locale,
          routerConfig: AppRouter.router,
          builder: (context, child) {
            return BlocListener<InternetCubit, InternetState>(
              listenWhen: (previous, current) {
                if (current is NotConnectedState &&
                    previous is! NotConnectedState) {
                  return true;
                }
                if (current is ConnectedState &&
                    previous is NotConnectedState) {
                  return true;
                }
                return false;
              },
              listener: (context, state) {
                final messenger = ScaffoldMessenger.of(context);
                if (state is NotConnectedState) {
                  messenger.showSnackBar(
                    SnackBar(
                      content: Center(
                        child: Text(
                          S.current.noConnection,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                  );
                }
                if (state is ConnectedState) {
                  messenger.showSnackBar(
                    SnackBar(
                      content: Center(
                        child: Text(
                          S.current.goOnline,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                  );
                }
              },
              child: child!,
            );
          },
        );
      },
    );
  }
}
