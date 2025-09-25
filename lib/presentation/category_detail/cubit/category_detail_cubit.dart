import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/di.dart';
import 'package:kk_movie_app/domain/category/usecases/get_category_detail_usecase.dart';
import 'package:kk_movie_app/presentation/category_detail/cubit/category_detail_state.dart';

class CategoryDetailCubit extends Cubit<CategoryDetailState> {
  CategoryDetailCubit() : super(CategoryDetailInitial());

  Future<void> getCategoryDetail(String slug) async {
    emit(CategoryDetailLoading());

    final result = await getIt<GetCategoryDetailUseCase>().call(slug);

    result.fold(
      (error) {
        emit(CategoryDetailError(message: error.message!));
      },
      (data) {
        emit(CategoryDetailLoaded(movieEntity: data));
      },
    );
  }
}
