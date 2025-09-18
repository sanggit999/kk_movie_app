import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/widgets/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/movie_card.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/view_all/cubit/view_all_cubit.dart';
import 'package:kk_movie_app/presentation/view_all/cubit/view_all_state.dart';
import 'package:kk_movie_app/presentation/view_all/widgets/drop_down_menu_button.dart';

class ViewAllSingleMoviePage extends StatefulWidget {
  const ViewAllSingleMoviePage({super.key});

  @override
  State<ViewAllSingleMoviePage> createState() => _ViewAllSingleMoviePageState();
}

class _ViewAllSingleMoviePageState extends State<ViewAllSingleMoviePage> {
  late final ScrollController _scrollController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  void _onScroll() {
    final state = context.read<ViewAllCubit>().state;
    final position = _scrollController.position;

    if (!state.isLoadingPage &&
        state.hasMore &&
        position.maxScrollExtent > 0 &&
        position.pixels >= position.maxScrollExtent - 200) {
      context.read<ViewAllCubit>().getViewAllSingleMovie();
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ViewAllCubit>().getViewAllSingleMovie();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        hideLeading: false,
        centerTitle: false,
        title: Text(
          S.current.movie,
          style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
        actions: const DropDownMenuButton(),
      ),
      body: SafeArea(
        child: BlocBuilder<ViewAllCubit, ViewAllState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            if (state.isViewAllSingleMovieLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              );
            }

            if (state.errorViewAllSingleMovie != null) {
              return _errorText(state.errorViewAllSingleMovie!);
            }

            return _viewAllSingleMovie(
              state.viewAllSingleMovie,
              state.isLoadingPage,
            );
          },
        ),
      ),
    );
  }

  Widget _errorText(String errorText) => Center(
    child: Text(
      textAlign: TextAlign.center,
      errorText,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    ),
  );

  Widget _viewAllSingleMovie(
    List<MovieEntity> movieEntity,
    bool isLoadingPage,
  ) => RefreshIndicator(
    key: _refreshIndicatorKey,
    color: Theme.of(context).colorScheme.inversePrimary,
    backgroundColor: Theme.of(context).colorScheme.primary,
    strokeWidth: 2.0,
    onRefresh: () async {
      await context.read<ViewAllCubit>().resetSingleMovie();
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    },
    child: Column(
      children: [
        Expanded(
          child: GridView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(12.0),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 0.6,
            ),
            itemCount: movieEntity.length,
            itemBuilder: (context, index) {
              return MovieCard(
                key: ValueKey(movieEntity[index].id),
                movieEntity: movieEntity[index],
              );
            },
            cacheExtent: 500.0,
          ),
        ),
        if (isLoadingPage)
          Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
      ],
    ),
  );
}
