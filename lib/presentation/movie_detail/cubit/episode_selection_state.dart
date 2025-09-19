import 'package:equatable/equatable.dart';

class EpisodeSelectionState extends Equatable {
  final int serverIndex;
  final int episodeIndex;

  const EpisodeSelectionState({
    this.serverIndex = 0,
    this.episodeIndex = 0,
  });

  EpisodeSelectionState copyWith({
    int? serverIndex,
    int? episodeIndex,
  }) {
    return EpisodeSelectionState(
      serverIndex: serverIndex ?? this.serverIndex,
      episodeIndex: episodeIndex ?? this.episodeIndex,
    );
  }

  @override
  List<Object> get props => [serverIndex, episodeIndex];
}
