import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_detail_entity.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/episode_election_cubit.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/episode_selection_state.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/movie_detail_state.dart';
import 'package:kk_movie_app/presentation/movie_detail/widgets/video_player_widget.dart';

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
            return current is MovieDetailLoaded;
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
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              final servers = movieDetail.episodes ?? [];

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
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
                      spacing: 10.0,
                      children: [
                        VideoPlayerWidget(videoUrl: currentEpisode.linkM3u8),
                        Text(
                          "${isEnglish ? movieDetail.movie.originName : movieDetail.movie.name} - ${isEnglish ? "Episode ${selection.episodeIndex + 1}" : currentEpisode.name}",
                          style: const TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Wrap(
                          spacing: 8,
                          children: List.generate(servers.length, (index) {
                            final isSelected = selection.serverIndex == index;
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<EpisodeSelectionCubit>()
                                    .selectServer(index);
                                debugPrint(
                                  "Chọn server: ${servers[index].serverName}",
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(
                                            context,
                                          ).colorScheme.secondary,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  servers[index].serverName,
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.inversePrimary,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),

                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            currentServer.serverData.length,
                            (index) {
                              final ep = currentServer.serverData[index];
                              final isSelected =
                                  selection.episodeIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<EpisodeSelectionCubit>()
                                      .selectEpisode(index);
                                  debugPrint("Chọn tập: ${ep.name}");
                                },
                                child: Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: isSelected
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.primary
                                          : Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    isEnglish
                                        ? "Episode ${index + 1}"
                                        : ep.name,
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.inversePrimary,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        _infoRow(
                          'Tình trạng:',
                          movieDetail.movie.episodeCurrent!,
                        ),
                        _infoRow('Số tập:', movieDetail.movie.episodeTotal!),
                        _infoRow('Thời lượng:', movieDetail.movie.time!),
                        _infoRow(
                          'Năm phát hành:',
                          movieDetail.movie.year.toString(),
                        ),
                        _infoRow('Ngôn ngữ:', movieDetail.movie.lang!),
                        _infoRow(
                          'Đạo diễn:',
                          movieDetail.movie.director!.join(','),
                        ),
                        _infoRow(
                          'Diễn viên:',
                          movieDetail.movie.actor!.join(','),
                        ),
                        _infoRow(
                          'Thể loại:',
                          movieDetail.movie.category!
                              .map((c) => c.name)
                              .join(', '),
                        ),
                        _infoRow(
                          'Quốc gia:',
                          movieDetail.movie.country!
                              .map((c) => c.name)
                              .join(', '),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 2.0,
                          children: [
                            const Text(
                              'Nôi dụng phim:',
                              style: TextStyle(
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
}
