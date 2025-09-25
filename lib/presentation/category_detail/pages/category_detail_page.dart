import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/common/widgets/card/movie_card.dart';
import 'package:kk_movie_app/domain/category/entities/category_entity.dart';
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
  @override
  void initState() {
    super.initState();
    context.read<CategoryDetailCubit>().getCategoryDetail(
      widget.categoryEntity.slug,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        hideLeading: false,
        centerTitle: false,
        title: Text(widget.categoryEntity.name),
      ),
      body: SafeArea(
        child: BlocBuilder<CategoryDetailCubit, CategoryDetailState>(
          builder: (context, state) {
            if (state is CategoryDetailLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              );
            }

            if (state is CategoryDetailLoaded) {
              return GridView.builder(
                //controller: _scrollController,
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
                itemCount: state.movieEntity.length,
                itemBuilder: (context, index) {
                  return MovieCard(
                    key: ValueKey(state.movieEntity[index].id),
                    movieEntity: state.movieEntity[index],
                  );
                },
                cacheExtent: 500.0,
              );
            }

            if (state is CategoryDetailError) {
              //return _errorText(state.errorViewAllCartoonMovie!);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
