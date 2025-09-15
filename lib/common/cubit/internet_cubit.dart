import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:kk_movie_app/common/cubit/internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final InternetConnection internetConnection;
  StreamSubscription<InternetStatus>? _statusSub;

  InternetCubit({required this.internetConnection}) : super(InternetInitial()) {
    _init();
  }

  void _init() {
    _checkNow();
    _statusSub = internetConnection.onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        emit(ConnectedState());
      } else {
        emit(NotConnectedState());
      }
    });
  }

  Future<void> _checkNow() async {
    try {
      final has = await internetConnection.hasInternetAccess;
      if (has) {
        emit(ConnectedState());
      } else {
        emit(NotConnectedState());
      }
    } catch (_) {
      emit(NotConnectedState());
    }
  }

  Future<void> refresh() async => await _checkNow();

  @override
  Future<void> close() async {
    await _statusSub?.cancel();
    return super.close();
  }
}
