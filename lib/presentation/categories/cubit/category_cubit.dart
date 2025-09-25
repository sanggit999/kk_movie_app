import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/core/usecase/usecase.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/category/usecases/get_categories_usecase.dart';
import 'package:kk_movie_app/presentation/categories/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());
    final result = await getIt<GetCategoriesUseCase>().call(const NoParams());

    result.fold(
      (error) {
        emit(CategoryError(message: error.message!));
      },
      (data) {
        emit(CategoryLoaded(categoryEntity: data));
      },
    );
  }
}
