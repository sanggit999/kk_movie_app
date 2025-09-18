// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_server_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EpisodeServerModel {

@JsonKey(name: "server_name") String get serverName;@JsonKey(name: "server_data") List<EpisodeModel> get serverData;
/// Create a copy of EpisodeServerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeServerModelCopyWith<EpisodeServerModel> get copyWith => _$EpisodeServerModelCopyWithImpl<EpisodeServerModel>(this as EpisodeServerModel, _$identity);

  /// Serializes this EpisodeServerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeServerModel&&(identical(other.serverName, serverName) || other.serverName == serverName)&&const DeepCollectionEquality().equals(other.serverData, serverData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverName,const DeepCollectionEquality().hash(serverData));

@override
String toString() {
  return 'EpisodeServerModel(serverName: $serverName, serverData: $serverData)';
}


}

/// @nodoc
abstract mixin class $EpisodeServerModelCopyWith<$Res>  {
  factory $EpisodeServerModelCopyWith(EpisodeServerModel value, $Res Function(EpisodeServerModel) _then) = _$EpisodeServerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "server_name") String serverName,@JsonKey(name: "server_data") List<EpisodeModel> serverData
});




}
/// @nodoc
class _$EpisodeServerModelCopyWithImpl<$Res>
    implements $EpisodeServerModelCopyWith<$Res> {
  _$EpisodeServerModelCopyWithImpl(this._self, this._then);

  final EpisodeServerModel _self;
  final $Res Function(EpisodeServerModel) _then;

/// Create a copy of EpisodeServerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serverName = null,Object? serverData = null,}) {
  return _then(_self.copyWith(
serverName: null == serverName ? _self.serverName : serverName // ignore: cast_nullable_to_non_nullable
as String,serverData: null == serverData ? _self.serverData : serverData // ignore: cast_nullable_to_non_nullable
as List<EpisodeModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [EpisodeServerModel].
extension EpisodeServerModelPatterns on EpisodeServerModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodeServerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodeServerModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodeServerModel value)  $default,){
final _that = this;
switch (_that) {
case _EpisodeServerModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodeServerModel value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodeServerModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "server_name")  String serverName, @JsonKey(name: "server_data")  List<EpisodeModel> serverData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodeServerModel() when $default != null:
return $default(_that.serverName,_that.serverData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "server_name")  String serverName, @JsonKey(name: "server_data")  List<EpisodeModel> serverData)  $default,) {final _that = this;
switch (_that) {
case _EpisodeServerModel():
return $default(_that.serverName,_that.serverData);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "server_name")  String serverName, @JsonKey(name: "server_data")  List<EpisodeModel> serverData)?  $default,) {final _that = this;
switch (_that) {
case _EpisodeServerModel() when $default != null:
return $default(_that.serverName,_that.serverData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpisodeServerModel implements EpisodeServerModel {
  const _EpisodeServerModel({@JsonKey(name: "server_name") this.serverName = '', @JsonKey(name: "server_data") final  List<EpisodeModel> serverData = const []}): _serverData = serverData;
  factory _EpisodeServerModel.fromJson(Map<String, dynamic> json) => _$EpisodeServerModelFromJson(json);

@override@JsonKey(name: "server_name") final  String serverName;
 final  List<EpisodeModel> _serverData;
@override@JsonKey(name: "server_data") List<EpisodeModel> get serverData {
  if (_serverData is EqualUnmodifiableListView) return _serverData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_serverData);
}


/// Create a copy of EpisodeServerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeServerModelCopyWith<_EpisodeServerModel> get copyWith => __$EpisodeServerModelCopyWithImpl<_EpisodeServerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeServerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeServerModel&&(identical(other.serverName, serverName) || other.serverName == serverName)&&const DeepCollectionEquality().equals(other._serverData, _serverData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serverName,const DeepCollectionEquality().hash(_serverData));

@override
String toString() {
  return 'EpisodeServerModel(serverName: $serverName, serverData: $serverData)';
}


}

/// @nodoc
abstract mixin class _$EpisodeServerModelCopyWith<$Res> implements $EpisodeServerModelCopyWith<$Res> {
  factory _$EpisodeServerModelCopyWith(_EpisodeServerModel value, $Res Function(_EpisodeServerModel) _then) = __$EpisodeServerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "server_name") String serverName,@JsonKey(name: "server_data") List<EpisodeModel> serverData
});




}
/// @nodoc
class __$EpisodeServerModelCopyWithImpl<$Res>
    implements _$EpisodeServerModelCopyWith<$Res> {
  __$EpisodeServerModelCopyWithImpl(this._self, this._then);

  final _EpisodeServerModel _self;
  final $Res Function(_EpisodeServerModel) _then;

/// Create a copy of EpisodeServerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serverName = null,Object? serverData = null,}) {
  return _then(_EpisodeServerModel(
serverName: null == serverName ? _self.serverName : serverName // ignore: cast_nullable_to_non_nullable
as String,serverData: null == serverData ? _self._serverData : serverData // ignore: cast_nullable_to_non_nullable
as List<EpisodeModel>,
  ));
}


}

// dart format on
