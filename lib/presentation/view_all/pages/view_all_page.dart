import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/card/movie_card.dart';
import 'package:kk_movie_app/common/widgets/drop_down/base_drop_down.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/core/enums/movie_type.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/view_all/cubit/view_all_cubit.dart';
import 'package:kk_movie_app/presentation/view_all/cubit/view_all_state.dart';

class ViewAllPage extends StatefulWidget {
  final MovieType movieType;
  const ViewAllPage({super.key, required this.movieType});

  @override
  State<ViewAllPage> createState() => _ViewAllPageState();
}

class _ViewAllPageState extends State<ViewAllPage> {
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
      context.read<ViewAllCubit>().getViewAll();
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ViewAllCubit>().getViewAll();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  String _getTitle(MovieType type) {
    switch (type) {
      case MovieType.cartoon:
        return S.current.cartoon;
      case MovieType.series:
        return S.current.tvSeries;
      case MovieType.single:
        return S.current.movie;
    }
  }

  @override
  Widget build(BuildContext context) {
    final movieType = context.read<ViewAllCubit>().movieType;
    return Scaffold(
      appBar: BaseAppBar(
        hideLeading: false,
        centerTitle: false,
        title: Text(_getTitle(movieType)),
        actions: _dropDownMenu(),
      ),
      body: BlocBuilder<ViewAllCubit, ViewAllState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          print("👉 rebuild với state: $state");
          if (state.isLoading && state.movies.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            );
          }

          if (state.error != null) {
            return _errorText(state.error!);
          }

          return _viewAllCartoonMovie(
            state.movies,
            state.isLoadingPage,
            state.hasMore,
          );
        },
      ),
    );
  }

  Widget _dropDownMenu() => BaseDropDown(
    value: context.select((ViewAllCubit cubit) => cubit.currentFilter),
    items: {
      "desc": S.current.latest,
      "asc": S.current.oldest,
      "vietsub": S.current.vietSub,
      "thuyet-minh": S.current.subtitled,
      "long-tieng": S.current.dubbed,
    },
    onChanged: (value) {
      context.read<ViewAllCubit>().applyDropdownFilter(value);
    },
  );

  Widget _errorText(String errorText) => Center(
    child: Text(
      textAlign: TextAlign.center,
      errorText,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    ),
  );

  Widget _viewAllCartoonMovie(
    List<MovieEntity> movieEntity,
    bool isLoadingPage,
    bool hasMore,
  ) => RefreshIndicator(
    key: _refreshIndicatorKey,
    color: Theme.of(context).colorScheme.inversePrimary,
    backgroundColor: Theme.of(context).colorScheme.primary,
    strokeWidth: 2.0,
    onRefresh: () async {
      await context.read<ViewAllCubit>().reset();
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
          child: (!hasMore)
              ?  Center(
                  child: Text(
                   S.current.noData,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : GridView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16.0,
                  ),
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
          )
        else if (!hasMore)
          Center(
            child: Text(
              "Đã tải hết dữ liệu",
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
      ],
    ),
  );
}
