import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/cubit/language_cubit.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/card/movie_card.dart';
import 'package:kk_movie_app/domain/auth/entities/user_entity.dart';
import 'package:kk_movie_app/domain/movie/entities/movie_entity.dart';
import 'package:kk_movie_app/domain/search/entities/search_entity.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:kk_movie_app/presentation/search/cubit/search_history_cubit.dart';
import 'package:kk_movie_app/presentation/search/cubit/search_history_state.dart';
import 'package:kk_movie_app/presentation/search/cubit/search_movie_cubit.dart';
import 'package:kk_movie_app/presentation/search/cubit/search_movie_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  late final UserEntity? currentUser = context.read<AuthCubit>().currentUser;

  @override
  void initState() {
    super.initState();
    context.read<SearchHistoryCubit>().getHistory(currentUser!.uid);
  }

  Future<void> _onSearch(String keyword) async {
    if (keyword.isEmpty) return;
    context.read<SearchMovieCubit>().search(keyword);

    final SearchHistoryEntity searchHistoryEntity = SearchHistoryEntity(
      uid: currentUser!.uid,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      keyword: keyword,
      createdAt: DateTime.now(),
    );
    context.read<SearchHistoryCubit>().saveHistory(searchHistoryEntity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(context.watch<LanguageCubit>().state),
      appBar: BaseAppBar(centerTitle: true, title: Text(S.current.search)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            spacing: 10.0,
            children: [
              TextField(
                controller: _controller,
                onSubmitted: _onSearch,
                decoration: InputDecoration(
                  hintText: '${S.current.search}...',
                  hintStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _onSearch(_controller.text);
                    }
                    ,
                  ),
                ),
                onChanged: (value) {
                  if (value.isEmpty) {
                    context.read<SearchMovieCubit>().clear();
                  }
                },
              ),

              Expanded(
                child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    if (state is SearchMovieInitial) {
                      return BlocBuilder<
                        SearchHistoryCubit,
                        SearchHistoryState
                      >(
                        buildWhen: (previous, current) => previous != current,
                        builder: (context, historyState) {
                          if (historyState is SearchHistoryLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Theme.of(
                                  context,
                                ).colorScheme.inversePrimary,
                              ),
                            );
                          }
                          if (historyState is SearchHistoryLoaded) {
                            if (historyState.histories.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return ListView.builder(
                              itemCount: historyState.histories.length,
                              itemBuilder: (context, index) {
                                final item = historyState.histories[index];
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    item.keyword,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          title: Text(
                                            item.keyword,
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          content:  Text(
                                            S.current.removeSearchHistory,
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => context.pop(),
                                              child: Text(
                                                S.current.cancel,
                                                style: TextStyle(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.inversePrimary,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                context.pop();
                                                context
                                                    .read<SearchHistoryCubit>()
                                                    .deleteHistory(
                                                      item.uid,
                                                      item.keyword,
                                                    );
                                              },
                                              child: Text(
                                                S.current.remove,
                                                style: TextStyle(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.inversePrimary,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  onTap: () {
                                    _controller.text = item.keyword;
                                    _onSearch(item.keyword);
                                  },
                                );
                              },
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      );
                    }

                    if (state is SearchMovieLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      );
                    }

                    if (state is SearchMovieLoaded) {
                      return _searchMovie(state.movies);
                    }

                    if (state is SearchMovieError) {
                      return const Center(child: Text("No movies found"));
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchMovie(List<MovieEntity> movieEntity) => GridView.builder(
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
  );
}
