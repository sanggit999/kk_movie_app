import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/widgets/card/movie_card.dart';
import 'package:kk_movie_app/common/widgets/shimmer/list_view_shimmer.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/core/enums/movie_type.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/home/cubit/home_cubit.dart';
import 'package:kk_movie_app/presentation/home/cubit/home_state.dart';
import 'package:kk_movie_app/router/app_routes.dart';

class SingleMovie extends StatelessWidget {
  const SingleMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _singleTitle(context),
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            if (state.isSingleMovieLoading) {
              return const ListViewShimmer();
            }

            if (state.errorSingleMovie != null) {
              return _errorText(state.errorSingleMovie!);
            }

            return _singleMovieCard(state.singleMovie);
          },
        ),
      ],
    );
  }

  Widget _singleTitle(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      S.current.movie,
      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    ),
    trailing: TextButton(
      onPressed: () {
        context.push(AppRoutes.viewAll, extra: MovieType.single);
        print('View all Single button pressed');
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
      errorText,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    ),
  );

  Widget _singleMovieCard(List<MovieEntity> movieEntity) => SizedBox(
    height: 300.0,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return MovieCard(
          key: ValueKey(movieEntity[index].id),
          movieEntity: movieEntity[index],
        );
      },
      separatorBuilder: (_, _) => const SizedBox(width: 8.0),
      itemCount: movieEntity.length,
      cacheExtent: 500.0,
    ),
  );
}
