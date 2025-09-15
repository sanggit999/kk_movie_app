// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tmdb_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TmdbModel {

 String get type; String get id; int get season;@JsonKey(name: "vote_average") double get voteAverage;@JsonKey(name: "vote_count") int get voteCount;
/// Create a copy of TmdbModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TmdbModelCopyWith<TmdbModel> get copyWith => _$TmdbModelCopyWithImpl<TmdbModel>(this as TmdbModel, _$identity);

  /// Serializes this TmdbModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TmdbModel&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.season, season) || other.season == season)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,season,voteAverage,voteCount);

@override
String toString() {
  return 'TmdbModel(type: $type, id: $id, season: $season, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class $TmdbModelCopyWith<$Res>  {
  factory $TmdbModelCopyWith(TmdbModel value, $Res Function(TmdbModel) _then) = _$TmdbModelCopyWithImpl;
@useResult
$Res call({
 String type, String id, int season,@JsonKey(name: "vote_average") double voteAverage,@JsonKey(name: "vote_count") int voteCount
});




}
/// @nodoc
class _$TmdbModelCopyWithImpl<$Res>
    implements $TmdbModelCopyWith<$Res> {
  _$TmdbModelCopyWithImpl(this._self, this._then);

  final TmdbModel _self;
  final $Res Function(TmdbModel) _then;

/// Create a copy of TmdbModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? season = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TmdbModel].
extension TmdbModelPatterns on TmdbModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TmdbModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TmdbModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TmdbModel value)  $default,){
final _that = this;
switch (_that) {
case _TmdbModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TmdbModel value)?  $default,){
final _that = this;
switch (_that) {
case _TmdbModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String id,  int season, @JsonKey(name: "vote_average")  double voteAverage, @JsonKey(name: "vote_count")  int voteCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TmdbModel() when $default != null:
return $default(_that.type,_that.id,_that.season,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String id,  int season, @JsonKey(name: "vote_average")  double voteAverage, @JsonKey(name: "vote_count")  int voteCount)  $default,) {final _that = this;
switch (_that) {
case _TmdbModel():
return $default(_that.type,_that.id,_that.season,_that.voteAverage,_that.voteCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String id,  int season, @JsonKey(name: "vote_average")  double voteAverage, @JsonKey(name: "vote_count")  int voteCount)?  $default,) {final _that = this;
switch (_that) {
case _TmdbModel() when $default != null:
return $default(_that.type,_that.id,_that.season,_that.voteAverage,_that.voteCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TmdbModel implements TmdbModel {
  const _TmdbModel({this.type = '', this.id = '', this.season = 0, @JsonKey(name: "vote_average") this.voteAverage = 0.0, @JsonKey(name: "vote_count") this.voteCount = 0});
  factory _TmdbModel.fromJson(Map<String, dynamic> json) => _$TmdbModelFromJson(json);

@override@JsonKey() final  String type;
@override@JsonKey() final  String id;
@override@JsonKey() final  int season;
@override@JsonKey(name: "vote_average") final  double voteAverage;
@override@JsonKey(name: "vote_count") final  int voteCount;

/// Create a copy of TmdbModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TmdbModelCopyWith<_TmdbModel> get copyWith => __$TmdbModelCopyWithImpl<_TmdbModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TmdbModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TmdbModel&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.season, season) || other.season == season)&&(identical(other.voteAverage, voteAverage) || other.voteAverage == voteAverage)&&(identical(other.voteCount, voteCount) || other.voteCount == voteCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,id,season,voteAverage,voteCount);

@override
String toString() {
  return 'TmdbModel(type: $type, id: $id, season: $season, voteAverage: $voteAverage, voteCount: $voteCount)';
}


}

/// @nodoc
abstract mixin class _$TmdbModelCopyWith<$Res> implements $TmdbModelCopyWith<$Res> {
  factory _$TmdbModelCopyWith(_TmdbModel value, $Res Function(_TmdbModel) _then) = __$TmdbModelCopyWithImpl;
@override @useResult
$Res call({
 String type, String id, int season,@JsonKey(name: "vote_average") double voteAverage,@JsonKey(name: "vote_count") int voteCount
});




}
/// @nodoc
class __$TmdbModelCopyWithImpl<$Res>
    implements _$TmdbModelCopyWith<$Res> {
  __$TmdbModelCopyWithImpl(this._self, this._then);

  final _TmdbModel _self;
  final $Res Function(_TmdbModel) _then;

/// Create a copy of TmdbModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? season = null,Object? voteAverage = null,Object? voteCount = null,}) {
  return _then(_TmdbModel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,season: null == season ? _self.season : season // ignore: cast_nullable_to_non_nullable
as int,voteAverage: null == voteAverage ? _self.voteAverage : voteAverage // ignore: cast_nullable_to_non_nullable
as double,voteCount: null == voteCount ? _self.voteCount : voteCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
