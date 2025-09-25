import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/card/movie_card.dart';
import 'package:kk_movie_app/common/widgets/drop_down/base_drop_down.dart';
import 'package:kk_movie_app/domain/category/entities/category_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/category_detail/cubit/category_detail_cubit.dart';
import 'package:kk_movie_app/presentation/category_detail/cubit/category_detail_state.dart';

class CategoryDetailPage extends StatefulWidget {
  final CategoryEntity categoryEntity;
  const CategoryDetailPage({super.key, required this.categoryEntity});

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  late final ScrollController _scrollController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  void _onScroll() {
    final state = context.read<CategoryDetailCubit>().state;
    final position = _scrollController.position;

    if (!state.isLoadingPage &&
        state.hasMore &&
        position.maxScrollExtent > 0 &&
        position.pixels >= position.maxScrollExtent - 200) {
      context.read<CategoryDetailCubit>().getCategoryDetail(
        widget.categoryEntity.slug,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<CategoryDetailCubit>().getCategoryDetail(
      widget.categoryEntity.slug,
    );
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        hideLeading: false,
        centerTitle: false,
        title: Text(widget.categoryEntity.name),
        actions: _dropDownMenu(),
      ),
      body: SafeArea(
        child: BlocBuilder<CategoryDetailCubit, CategoryDetailState>(
          builder: (context, state) {
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

            return _categoryDetail(
              state.movies,
              state.isLoadingPage,
              state.hasMore,
            );
          },
        ),
      ),
    );
  }

  Widget _dropDownMenu() => BaseDropDown(
    value: context.select((CategoryDetailCubit cubit) => cubit.currentFilter),
    items: {
      "desc": S.current.latest,
      "asc": S.current.oldest,
      "vietsub": S.current.vietSub,
      "thuyet-minh": S.current.subtitled,
      "long-tieng": S.current.dubbed,
    },
    onChanged: (value) {
      context.read<CategoryDetailCubit>().applyDropdownFilter(value);
    },
  );

  Widget _errorText(String errorText) => Center(
    child: Text(
      textAlign: TextAlign.center,
      errorText,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    ),
  );

  Widget _categoryDetail(
    List<MovieEntity> movieEntity,
    bool isLoadingPage,
    bool hasMore,
  ) => RefreshIndicator(
    key: _refreshIndicatorKey,
    color: Theme.of(context).colorScheme.inversePrimary,
    backgroundColor: Theme.of(context).colorScheme.primary,
    strokeWidth: 2.0,
    onRefresh: () async {
      await context.read<CategoryDetailCubit>().reset(
        widget.categoryEntity.slug,
      );
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
              ? Center(
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
          ),
      ],
    ),
  );
}
