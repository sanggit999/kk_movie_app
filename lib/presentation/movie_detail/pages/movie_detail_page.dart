import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_detail_entity.dart';
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
              title = currentLocale.languageCode == 'en'
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
              final episode = movieDetail.episodes![0].serverData[0].linkM3u8;
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.0,
                  children: [
                    VideoPlayerWidget(videoUrl: episode),
                    Text(
                      currentLocale.languageCode == 'en'
                          ? state.movieDetailEntity.movie.originName
                          : state.movieDetailEntity.movie.name,
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _infoRow('Tình trạng:', movieDetail.movie.episodeCurrent!),
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
                    _infoRow('Diễn viên:', movieDetail.movie.actor!.join(',')),
                    _infoRow(
                      'Thể loại:',
                      movieDetail.movie.category!.map((c) => c.name).join(', '),
                    ),
                    _infoRow(
                      'Quốc gia:',
                      movieDetail.movie.country!.map((c) => c.name).join(', '),
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
