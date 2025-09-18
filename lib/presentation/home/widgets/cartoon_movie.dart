import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/widgets/movie_card.dart';
import 'package:kk_movie_app/common/widgets/shimmer/list_view_shimmer.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/home/cubit/home_cubit.dart';
import 'package:kk_movie_app/presentation/home/cubit/home_state.dart';
import 'package:kk_movie_app/router/app_routes.dart';

class CartoonMovie extends StatelessWidget {
  const CartoonMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _cartoonTitle(context),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            if (state.isCartoonMovieLoading) {
              return const ListViewShimmer();
            }

            if (state.errorCartoonMovie != null) {
              return _errorText(state.errorCartoonMovie!);
            }

            return _singleMovieCard(state.cartoonMovie);
          },
        ),
      ],
    );
  }

  Widget _cartoonTitle(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      S.current.cartoon,
      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    ),
    trailing: TextButton(
      onPressed: () {
        context.push(AppRoutes.viewAllCartoon);
        print('View all Cartoon button pressed');
      },
      child: Text(
        S.current.viewAll,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    ),
  );

  Widget _errorText(String errorText) => Center(
    child: Text(
      textAlign: TextAlign.center,
      errorText,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    ),
  );

  Widget _singleMovieCard(List<MovieEntity> movieEntity) => SizedBox(
    height: 300.0,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return MovieCard(
          key: ValueKey(movieEntity[index].id),
          movieEntity: movieEntity[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 8.0),
      itemCount: movieEntity.length,
      cacheExtent: 500.0,
    ),
  );
}
