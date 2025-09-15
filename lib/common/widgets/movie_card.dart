import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';
import 'package:kk_movie_app/core/constants/api_url.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movieEntity;

  const MovieCard({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LanguageCubit>().state;
    return GestureDetector(
      onTap: () {
        // context.pushNamed(AppRoutes.detailMovie, extra: movieEntity);
      },
      child: Container(
        width: 180.0,
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6.0,
          children: [_buildImage(), _buildTitle(currentLocale)],
        ),
      ),
    );
  }

  Widget _buildImage() => Expanded(
    flex: 4,
    child: ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: CachedNetworkImage(
        imageUrl: (movieEntity.posterUrl.isNotEmpty)
            ? (movieEntity.posterUrl.startsWith('http')
                  ? movieEntity.posterUrl
                  : '${ApiUrl.baseImage}/${movieEntity.posterUrl}')
            : ApiUrl.placeholdImageBase,
        fit: BoxFit.cover,
        width: double.infinity,
        placeholder: (context, _) => Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        errorWidget: (context, _, _) =>
            Icon(Icons.error, color: Theme.of(context).colorScheme.error),
      ),
    ),
  );

  Widget _buildTitle(Locale locale) => Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6.0,
        children: [
          Text(
            locale.languageCode == 'en'
                ? movieEntity.originName
                : movieEntity.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.star, size: 16.0, color: Colors.amber),
              Text(
                movieEntity.tmdb.voteAverage.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
