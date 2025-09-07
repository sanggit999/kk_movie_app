abstract class ExecuteState {}

class ExecuteInitial extends ExecuteState {}

class ExecuteLoading extends ExecuteState {}

class ExecuteSuccess<T> extends ExecuteState {
  final T data;

  ExecuteSuccess({required this.data});

}

class ExecuteFailure extends ExecuteState {
  final String message;

  ExecuteFailure({required this.message});

}
