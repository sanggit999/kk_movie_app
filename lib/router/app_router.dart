import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/cubit/execute_cubit.dart';
import 'package:kk_movie_app/domain/category/entities/category_entity.dart';
import 'package:kk_movie_app/core/enums/movie_type.dart';
import 'package:kk_movie_app/presentation/auth/pages/forgot_password_page.dart';
import 'package:kk_movie_app/presentation/categories/cubit/category_cubit.dart';
import 'package:kk_movie_app/presentation/category_detail/cubit/category_detail_cubit.dart';
import 'package:kk_movie_app/presentation/category_detail/pages/category_detail_page.dart';
import 'package:kk_movie_app/presentation/home/cubit/home_cubit.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/episode_election_cubit.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:kk_movie_app/presentation/movie_detail/pages/movie_detail_page.dart';
import 'package:kk_movie_app/presentation/view_all/cubit/view_all_cubit.dart';
import 'package:kk_movie_app/presentation/view_all/pages/view_all_page.dart';
import 'package:kk_movie_app/router/app_routes.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/splash/pages/splash_page.dart';
import 'package:kk_movie_app/presentation/auth/pages/signin_page.dart';
import 'package:kk_movie_app/presentation/auth/pages/signup_page.dart';
import 'package:kk_movie_app/presentation/home/pages/home_page.dart';
import 'package:kk_movie_app/presentation/categories/pages/categories_page.dart';
import 'package:kk_movie_app/presentation/profile/pages/profile_page.dart';
import 'package:kk_movie_app/presentation/search/pages/search_page.dart';
import 'package:kk_movie_app/presentation/watchlist/pages/watchlist_page.dart';
import 'package:kk_movie_app/presentation/profile/pages/language_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => navigationShell.goBranch(index),
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: true,
              selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
              unselectedItemColor: Theme.of(context).colorScheme.primary,
              selectedLabelStyle: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: S.current.home,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.category),
                  label: S.current.categories,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.search),
                  label: S.current.search,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.bookmark),
                  label: S.current.watchlist,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: S.current.profile,
                ),
              ],
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: AppRoutes.home,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: BlocProvider(
                    create: (_) => HomeCubit()..getAllDatas(),
                    child: const HomePage(),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.categories,
                name: AppRoutes.categories,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: BlocProvider(
                    create: (_) => CategoryCubit()..getCategories(),
                    child: const CategoriesPage(),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.search,
                name: AppRoutes.search,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SearchPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.watchlist,
                name: AppRoutes.watchlist,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: WatchlistPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: AppRoutes.profile,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) {
          return const SplashPage();
        },
      ),

      GoRoute(
        path: AppRoutes.signin,
        name: AppRoutes.signin,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => ExecuteCubit(),
            child: const SignInPage(),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.signup,
        name: AppRoutes.signup,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => ExecuteCubit(),
            child: const SignUpPage(),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.viewAll,
        name: AppRoutes.viewAll,
        builder: (context, state) {
          final type = state.extra as MovieType;
          return BlocProvider(
            create: (_) => ViewAllCubit(movieType: type),
            child: ViewAllPage(type: type),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.categoryDetail,
        name: AppRoutes.categoryDetail,
        builder: (context, state) {
          final categoryEntity = state.extra as CategoryEntity;
          return BlocProvider(
            create: (_) => CategoryDetailCubit(),
            child: CategoryDetailPage(categoryEntity: categoryEntity),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.movieDetail,
        name: AppRoutes.movieDetail,
        builder: (context, state) {
          final slug = state.extra as String;
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => MovieDetailCubit()),
              BlocProvider(create: (_) => EpisodeSelectionCubit()),
            ],

            child: MovieDetailPage(slug: slug),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.forgotPassword,
        name: AppRoutes.forgotPassword,
        builder: (context, state) {
          return BlocProvider(
            create: (_) => ExecuteCubit(),
            child: const ForgotPasswordPage(),
          );
        },
      ),

      GoRoute(
        path: AppRoutes.language,
        name: AppRoutes.language,
        builder: (context, state) {
          return const LanguagePage();
        },
      ),
    ],
  );
}
