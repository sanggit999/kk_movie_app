abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

class NoParams {
  const NoParams();
}

class GetViewAllParams {
  final int page;
  final String? sortType;
  final String? sortLang;

  GetViewAllParams({
    required this.page,
    this.sortType,
    this.sortLang,
  });
}
