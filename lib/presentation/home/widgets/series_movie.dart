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

class SeriesMovie extends StatelessWidget {
  const SeriesMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _tvSeriesTitle(context),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isSeriesMovieLoading) {
              return const ListViewShimmer();
            }

            if (state.errorSeriesMovie != null) {
              return _errorText(state.errorSeriesMovie!);
            }

            return _seriesMovieCard(state.seriesMovie);
          },
        ),
      ],
    );
  }

  Widget _tvSeriesTitle(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      S.current.tvSeries,
      style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    ),
    trailing: TextButton(
      onPressed: () {
        context.push(AppRoutes.viewAllSeries);
        print('View all Series button pressed');
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

  Widget _seriesMovieCard(List<MovieEntity> movieEntity) => SizedBox(
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
