// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchHistoryModel {

 String get id; String get uid; String get keyword;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of SearchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchHistoryModelCopyWith<SearchHistoryModel> get copyWith => _$SearchHistoryModelCopyWithImpl<SearchHistoryModel>(this as SearchHistoryModel, _$identity);

  /// Serializes this SearchHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,keyword,createdAt);

@override
String toString() {
  return 'SearchHistoryModel(id: $id, uid: $uid, keyword: $keyword, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SearchHistoryModelCopyWith<$Res>  {
  factory $SearchHistoryModelCopyWith(SearchHistoryModel value, $Res Function(SearchHistoryModel) _then) = _$SearchHistoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String uid, String keyword,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$SearchHistoryModelCopyWithImpl<$Res>
    implements $SearchHistoryModelCopyWith<$Res> {
  _$SearchHistoryModelCopyWithImpl(this._self, this._then);

  final SearchHistoryModel _self;
  final $Res Function(SearchHistoryModel) _then;

/// Create a copy of SearchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? uid = null,Object? keyword = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchHistoryModel].
extension SearchHistoryModelPatterns on SearchHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String uid,  String keyword, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchHistoryModel() when $default != null:
return $default(_that.id,_that.uid,_that.keyword,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String uid,  String keyword, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _SearchHistoryModel():
return $default(_that.id,_that.uid,_that.keyword,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String uid,  String keyword, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SearchHistoryModel() when $default != null:
return $default(_that.id,_that.uid,_that.keyword,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchHistoryModel implements SearchHistoryModel {
  const _SearchHistoryModel({this.id = '', this.uid = '', this.keyword = '', @JsonKey(name: 'created_at') this.createdAt = null});
  factory _SearchHistoryModel.fromJson(Map<String, dynamic> json) => _$SearchHistoryModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String uid;
@override@JsonKey() final  String keyword;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of SearchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchHistoryModelCopyWith<_SearchHistoryModel> get copyWith => __$SearchHistoryModelCopyWithImpl<_SearchHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,uid,keyword,createdAt);

@override
String toString() {
  return 'SearchHistoryModel(id: $id, uid: $uid, keyword: $keyword, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SearchHistoryModelCopyWith<$Res> implements $SearchHistoryModelCopyWith<$Res> {
  factory _$SearchHistoryModelCopyWith(_SearchHistoryModel value, $Res Function(_SearchHistoryModel) _then) = __$SearchHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String uid, String keyword,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$SearchHistoryModelCopyWithImpl<$Res>
    implements _$SearchHistoryModelCopyWith<$Res> {
  __$SearchHistoryModelCopyWithImpl(this._self, this._then);

  final _SearchHistoryModel _self;
  final $Res Function(_SearchHistoryModel) _then;

/// Create a copy of SearchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? uid = null,Object? keyword = null,Object? createdAt = freezed,}) {
  return _then(_SearchHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,keyword: null == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
