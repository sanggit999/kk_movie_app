// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modified_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModifiedModel {

 String get time;
/// Create a copy of ModifiedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModifiedModelCopyWith<ModifiedModel> get copyWith => _$ModifiedModelCopyWithImpl<ModifiedModel>(this as ModifiedModel, _$identity);

  /// Serializes this ModifiedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModifiedModel&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time);

@override
String toString() {
  return 'ModifiedModel(time: $time)';
}


}

/// @nodoc
abstract mixin class $ModifiedModelCopyWith<$Res>  {
  factory $ModifiedModelCopyWith(ModifiedModel value, $Res Function(ModifiedModel) _then) = _$ModifiedModelCopyWithImpl;
@useResult
$Res call({
 String time
});




}
/// @nodoc
class _$ModifiedModelCopyWithImpl<$Res>
    implements $ModifiedModelCopyWith<$Res> {
  _$ModifiedModelCopyWithImpl(this._self, this._then);

  final ModifiedModel _self;
  final $Res Function(ModifiedModel) _then;

/// Create a copy of ModifiedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ModifiedModel].
extension ModifiedModelPatterns on ModifiedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModifiedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModifiedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModifiedModel value)  $default,){
final _that = this;
switch (_that) {
case _ModifiedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModifiedModel value)?  $default,){
final _that = this;
switch (_that) {
case _ModifiedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModifiedModel() when $default != null:
return $default(_that.time);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time)  $default,) {final _that = this;
switch (_that) {
case _ModifiedModel():
return $default(_that.time);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time)?  $default,) {final _that = this;
switch (_that) {
case _ModifiedModel() when $default != null:
return $default(_that.time);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ModifiedModel implements ModifiedModel {
  const _ModifiedModel({this.time = ''});
  factory _ModifiedModel.fromJson(Map<String, dynamic> json) => _$ModifiedModelFromJson(json);

@override@JsonKey() final  String time;

/// Create a copy of ModifiedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModifiedModelCopyWith<_ModifiedModel> get copyWith => __$ModifiedModelCopyWithImpl<_ModifiedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ModifiedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModifiedModel&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time);

@override
String toString() {
  return 'ModifiedModel(time: $time)';
}


}

/// @nodoc
abstract mixin class _$ModifiedModelCopyWith<$Res> implements $ModifiedModelCopyWith<$Res> {
  factory _$ModifiedModelCopyWith(_ModifiedModel value, $Res Function(_ModifiedModel) _then) = __$ModifiedModelCopyWithImpl;
@override @useResult
$Res call({
 String time
});




}
/// @nodoc
class __$ModifiedModelCopyWithImpl<$Res>
    implements _$ModifiedModelCopyWith<$Res> {
  __$ModifiedModelCopyWithImpl(this._self, this._then);

  final _ModifiedModel _self;
  final $Res Function(_ModifiedModel) _then;

/// Create a copy of ModifiedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,}) {
  return _then(_ModifiedModel(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
