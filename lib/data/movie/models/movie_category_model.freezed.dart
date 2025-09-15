// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieCategoryModel {

 String get id; String get name; String get slug;
/// Create a copy of MovieCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieCategoryModelCopyWith<MovieCategoryModel> get copyWith => _$MovieCategoryModelCopyWithImpl<MovieCategoryModel>(this as MovieCategoryModel, _$identity);

  /// Serializes this MovieCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'MovieCategoryModel(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $MovieCategoryModelCopyWith<$Res>  {
  factory $MovieCategoryModelCopyWith(MovieCategoryModel value, $Res Function(MovieCategoryModel) _then) = _$MovieCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug
});




}
/// @nodoc
class _$MovieCategoryModelCopyWithImpl<$Res>
    implements $MovieCategoryModelCopyWith<$Res> {
  _$MovieCategoryModelCopyWithImpl(this._self, this._then);

  final MovieCategoryModel _self;
  final $Res Function(MovieCategoryModel) _then;

/// Create a copy of MovieCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MovieCategoryModel].
extension MovieCategoryModelPatterns on MovieCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _MovieCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _MovieCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug)  $default,) {final _that = this;
switch (_that) {
case _MovieCategoryModel():
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug)?  $default,) {final _that = this;
switch (_that) {
case _MovieCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieCategoryModel implements MovieCategoryModel {
  const _MovieCategoryModel({this.id = '', this.name = '', this.slug = ''});
  factory _MovieCategoryModel.fromJson(Map<String, dynamic> json) => _$MovieCategoryModelFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String slug;

/// Create a copy of MovieCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieCategoryModelCopyWith<_MovieCategoryModel> get copyWith => __$MovieCategoryModelCopyWithImpl<_MovieCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'MovieCategoryModel(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$MovieCategoryModelCopyWith<$Res> implements $MovieCategoryModelCopyWith<$Res> {
  factory _$MovieCategoryModelCopyWith(_MovieCategoryModel value, $Res Function(_MovieCategoryModel) _then) = __$MovieCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug
});




}
/// @nodoc
class __$MovieCategoryModelCopyWithImpl<$Res>
    implements _$MovieCategoryModelCopyWith<$Res> {
  __$MovieCategoryModelCopyWithImpl(this._self, this._then);

  final _MovieCategoryModel _self;
  final $Res Function(_MovieCategoryModel) _then;

/// Create a copy of MovieCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(_MovieCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
