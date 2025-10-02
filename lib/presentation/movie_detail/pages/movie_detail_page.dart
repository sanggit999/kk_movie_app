import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/episode_election_cubit.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/episode_selection_state.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/movie_detail_state.dart';
import 'package:kk_movie_app/presentation/movie_detail/widgets/selectable_chip.dart';
import 'package:kk_movie_app/presentation/movie_detail/widgets/video_player_movie.dart';

class MovieDetailPage extends StatefulWidget {
  final String slug;
  const MovieDetailPage({super.key, required this.slug});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieDetailCubit>().getMovieDetail(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LanguageCubit>().state;
    final isEnglish = currentLocale.languageCode == "en";

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            String title = "";
            if (state is MovieDetailLoaded) {
              title = isEnglish
                  ? state.movieDetailEntity.movie.originName
                  : state.movieDetailEntity.movie.name;
            }
            return BaseAppBar(
              hideLeading: false,
              centerTitle: false,
              title: Text(title),
            );
          },
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              );
            }

            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              final servers = movieDetail.episodes ?? [];

              return SingleChildScrollView(
                child: BlocBuilder<EpisodeSelectionCubit, EpisodeSelectionState>(
                  buildWhen: (previous, current) {
                    return previous != current;
                  },
                  builder: (context, selection) {
                    final currentServer = servers[selection.serverIndex];
                    final currentEpisode =
                        currentServer.serverData[selection.episodeIndex];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VideoPlayerMovie(videoUrl: currentEpisode.linkM3u8),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 16.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10.0,
                            children: [
                              Text(
                                "${isEnglish ? movieDetail.movie.originName : movieDetail.movie.name} - ${isEnglish ? "Episode ${selection.episodeIndex + 1}" : currentEpisode.name}",
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: servers.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 18,
                                  childAspectRatio: 3.5,
                                ),
                                itemBuilder: (context, index) {
                                  final isSelected = selection.serverIndex == index;
                                  return SelectableChip(
                                    label: servers[index].serverName,
                                    isSelected: isSelected,
                                    onTap: () {
                                      context.read<EpisodeSelectionCubit>().selectServer(index);
                                      debugPrint("Chọn server: ${servers[index].serverName}");
                                    },
                                  );
                                },
                              ),

                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: currentServer.serverData.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2.5,
                                ),
                                itemBuilder: (context, index) {
                                  final ep = currentServer.serverData[index];
                                  final isSelected = selection.episodeIndex == index;
                                  return SelectableChip(
                                    label: isEnglish ? "Episode ${index + 1}" : ep.name,
                                    isSelected: isSelected,
                                    width: double.infinity, // full width trong cell grid
                                    onTap: () {
                                      context.read<EpisodeSelectionCubit>().selectEpisode(index);
                                      debugPrint("Chọn tập: ${ep.name}");
                                    },
                                  );
                                },
                              ),

                              _infoRow(
                                "${S.current.status}:",
                                movieDetail.movie.episodeCurrent!,
                              ),
                              _infoRow(
                                "${S.current.totalEpisodes}:",
                                movieDetail.movie.episodeTotal!,
                              ),
                              _infoRow(
                                "${S.current.duration}:",
                                movieDetail.movie.time!,
                              ),
                              _infoRow(
                                "${S.current.releaseYear}:",
                                movieDetail.movie.year.toString(),
                              ),
                              _infoRow(
                                "${S.current.language}:",
                                movieDetail.movie.lang!,
                              ),
                              _infoRow(
                                "${S.current.director}:",
                                movieDetail.movie.director!.join(','),
                              ),
                              _infoRow(
                                "${S.current.actor}:",
                                movieDetail.movie.actor!.join(','),
                              ),
                              _infoRow(
                                "${S.current.category}:",
                                movieDetail.movie.category!
                                    .map((c) => c.name)
                                    .join(', '),
                              ),
                              _infoRow(
                                "${S.current.country}:",
                                movieDetail.movie.country!
                                    .map((c) => c.name)
                                    .join(', '),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 2.0,
                                children: [
                                  Text(
                                    "${S.current.description}:",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    movieDetail.movie.content!,
                                    style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
            if (state is MovieDetailError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 16.0,
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
      ),
      Expanded(
        child: Text(
          value,
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          softWrap: true,
        ),
      ),
    ],
  );

  Widget _selectableChip(
    String label,
    bool isSelected,
    VoidCallback onTap,
    double? width,
  ) => GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          width: 1.0,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
