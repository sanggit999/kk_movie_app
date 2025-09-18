// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_server_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EpisodeServerModel _$EpisodeServerModelFromJson(Map<String, dynamic> json) =>
    _EpisodeServerModel(
      serverName: json['server_name'] as String? ?? '',
      serverData:
          (json['server_data'] as List<dynamic>?)
              ?.map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EpisodeServerModelToJson(_EpisodeServerModel instance) =>
    <String, dynamic>{
      'server_name': instance.serverName,
      'server_data': instance.serverData,
    };
