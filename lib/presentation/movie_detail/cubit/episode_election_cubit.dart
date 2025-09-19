import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kk_movie_app/presentation/movie_detail/cubit/episode_selection_state.dart';

class EpisodeSelectionCubit extends Cubit<EpisodeSelectionState> {
  EpisodeSelectionCubit() : super(const EpisodeSelectionState());

  void selectServer(int index) {
    emit(EpisodeSelectionState(serverIndex: index, episodeIndex: 0));
  }

  void selectEpisode(int index) {
    emit(state.copyWith(episodeIndex: index));
  }
}
