import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/widgets/shimmer/card_shimmer.dart';
import 'package:kk_movie_app/core/constants/api_url.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/presentation/home/cubit/home_cubit.dart';
import 'package:kk_movie_app/presentation/home/cubit/home_state.dart';
import 'package:kk_movie_app/router/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerMovie extends StatefulWidget {
  const BannerMovie({super.key});

  @override
  State<BannerMovie> createState() => _BannerMovieState();
}

class _BannerMovieState extends State<BannerMovie> {
  late final _controller = CarouselSliderController();
  int _activeIndex = 0;
  final int _count = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16.0,
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            if (state.isNewMovieLoading) {
              return const CardShimmer(isBanner: true);
            }
            if (state.errorNewMovie != null) {
              return Center(
                child: Text(
                  state.errorNewMovie!,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }

            return _carouselItemBuilder(state.newMovie);
          },
        ),

        _buildIndicator(),
      ],
    );
  }

  Widget _carouselItemBuilder(List<MovieEntity> movieEntity) =>
      CarouselSlider.builder(
        carouselController: _controller,
        itemCount: movieEntity.length,
        itemBuilder: (_, index, _) {
          final movie = movieEntity[index];

          final imageUrl = (movie.thumbUrl.isNotEmpty)
              ? (movie.thumbUrl.startsWith('http')
                    ? movie.thumbUrl
                    : '${ApiUrl.baseImage}/${movie.thumbUrl}')
              : ApiUrl.placeholdImageBase;

          return _buildImage(imageUrl, index, movie);
        },
        options: CarouselOptions(
          height: 300.0,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 8,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) => setState(() {
            _activeIndex = index;
          }),
        ),
      );

  Widget _buildImage(String urlImage, int index, MovieEntity movieEntity) =>
      SizedBox(
        child: GestureDetector(
          onTap: () {
            context.pushNamed(AppRoutes.movieDetail,extra: movieEntity.slug);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              height: 300.0,
              imageUrl: urlImage,
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
        ),
      );

  Widget _buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: _activeIndex,
    count: _count,
    effect: ExpandingDotsEffect(
      dotHeight: 12.0,
      dotWidth: 12.0,
      dotColor: Theme.of(context).colorScheme.inversePrimary,
      activeDotColor: Theme.of(context).colorScheme.tertiary,
    ),
    onDotClicked: (index) {
      _controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    },
  );
}
