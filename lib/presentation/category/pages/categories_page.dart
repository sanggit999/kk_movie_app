import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kk_movie_app/common/widgets/appbar/base_app_bar.dart';
import 'package:kk_movie_app/domain/category/entities/category_entity.dart';
import 'package:kk_movie_app/l10n/l10n.dart';
import 'package:kk_movie_app/presentation/category//cubit/category_cubit.dart';
import 'package:kk_movie_app/presentation/category//cubit/category_state.dart';
import 'package:kk_movie_app/router/app_routes.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(Theme.of(context).brightness),
      appBar: BaseAppBar(title: Text(S.current.categories)),
      body: SafeArea(
        child: BlocBuilder<CategoryCubit, CategoryState>(
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CategoryLoaded) {
              return _categoriesCard(state.categoryEntity);
            }
            if (state is CategoryError) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _categoriesCard(List<CategoryEntity> categoryEntity) =>
      GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 3 / 2,
        ),
        itemCount: categoryEntity.length,
        itemBuilder: (context, index) {
          final category = categoryEntity[index];
          return GestureDetector(
            onTap: () {
              context.pushNamed(AppRoutes.categoryDetail,extra: category);
              print('On tap Categories ok');
            },
            child: Container(
              key: ValueKey(category.id),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Center(
                child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      );
}
