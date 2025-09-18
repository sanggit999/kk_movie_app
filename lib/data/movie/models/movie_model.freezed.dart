// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovieModel {

 TmdbModel get tmdb;@JsonKey(name: "_id") String get id; String get name; String get slug;@JsonKey(name: "origin_name") String get originName; String get content; String get type; String get status;@JsonKey(name: "poster_url") String get posterUrl;@JsonKey(name: "thumb_url") String get thumbUrl; String get time;@JsonKey(name: "episode_current") String get episodeCurrent;@JsonKey(name: "episode_total") String get episodeTotal; String get quality; String get lang; int get year; int get view; List<String> get actor; List<String> get director; List<MovieCategoryModel> get category; List<MovieCountryModel> get country;
/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovieModelCopyWith<MovieModel> get copyWith => _$MovieModelCopyWithImpl<MovieModel>(this as MovieModel, _$identity);

  /// Serializes this MovieModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovieModel&&(identical(other.tmdb, tmdb) || other.tmdb == tmdb)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.originName, originName) || other.originName == originName)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl)&&(identical(other.thumbUrl, thumbUrl) || other.thumbUrl == thumbUrl)&&(identical(other.time, time) || other.time == time)&&(identical(other.episodeCurrent, episodeCurrent) || other.episodeCurrent == episodeCurrent)&&(identical(other.episodeTotal, episodeTotal) || other.episodeTotal == episodeTotal)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.year, year) || other.year == year)&&(identical(other.view, view) || other.view == view)&&const DeepCollectionEquality().equals(other.actor, actor)&&const DeepCollectionEquality().equals(other.director, director)&&const DeepCollectionEquality().equals(other.category, category)&&const DeepCollectionEquality().equals(other.country, country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,tmdb,id,name,slug,originName,content,type,status,posterUrl,thumbUrl,time,episodeCurrent,episodeTotal,quality,lang,year,view,const DeepCollectionEquality().hash(actor),const DeepCollectionEquality().hash(director),const DeepCollectionEquality().hash(category),const DeepCollectionEquality().hash(country)]);

@override
String toString() {
  return 'MovieModel(tmdb: $tmdb, id: $id, name: $name, slug: $slug, originName: $originName, content: $content, type: $type, status: $status, posterUrl: $posterUrl, thumbUrl: $thumbUrl, time: $time, episodeCurrent: $episodeCurrent, episodeTotal: $episodeTotal, quality: $quality, lang: $lang, year: $year, view: $view, actor: $actor, director: $director, category: $category, country: $country)';
}


}

/// @nodoc
abstract mixin class $MovieModelCopyWith<$Res>  {
  factory $MovieModelCopyWith(MovieModel value, $Res Function(MovieModel) _then) = _$MovieModelCopyWithImpl;
@useResult
$Res call({
 TmdbModel tmdb,@JsonKey(name: "_id") String id, String name, String slug,@JsonKey(name: "origin_name") String originName, String content, String type, String status,@JsonKey(name: "poster_url") String posterUrl,@JsonKey(name: "thumb_url") String thumbUrl, String time,@JsonKey(name: "episode_current") String episodeCurrent,@JsonKey(name: "episode_total") String episodeTotal, String quality, String lang, int year, int view, List<String> actor, List<String> director, List<MovieCategoryModel> category, List<MovieCountryModel> country
});


$TmdbModelCopyWith<$Res> get tmdb;

}
/// @nodoc
class _$MovieModelCopyWithImpl<$Res>
    implements $MovieModelCopyWith<$Res> {
  _$MovieModelCopyWithImpl(this._self, this._then);

  final MovieModel _self;
  final $Res Function(MovieModel) _then;

/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tmdb = null,Object? id = null,Object? name = null,Object? slug = null,Object? originName = null,Object? content = null,Object? type = null,Object? status = null,Object? posterUrl = null,Object? thumbUrl = null,Object? time = null,Object? episodeCurrent = null,Object? episodeTotal = null,Object? quality = null,Object? lang = null,Object? year = null,Object? view = null,Object? actor = null,Object? director = null,Object? category = null,Object? country = null,}) {
  return _then(_self.copyWith(
tmdb: null == tmdb ? _self.tmdb : tmdb // ignore: cast_nullable_to_non_nullable
as TmdbModel,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,originName: null == originName ? _self.originName : originName // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,posterUrl: null == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String,thumbUrl: null == thumbUrl ? _self.thumbUrl : thumbUrl // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,episodeCurrent: null == episodeCurrent ? _self.episodeCurrent : episodeCurrent // ignore: cast_nullable_to_non_nullable
as String,episodeTotal: null == episodeTotal ? _self.episodeTotal : episodeTotal // ignore: cast_nullable_to_non_nullable
as String,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as int,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as List<String>,director: null == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as List<MovieCategoryModel>,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as List<MovieCountryModel>,
  ));
}
/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TmdbModelCopyWith<$Res> get tmdb {
  
  return $TmdbModelCopyWith<$Res>(_self.tmdb, (value) {
    return _then(_self.copyWith(tmdb: value));
  });
}
}


/// Adds pattern-matching-related methods to [MovieModel].
extension MovieModelPatterns on MovieModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovieModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovieModel value)  $default,){
final _that = this;
switch (_that) {
case _MovieModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovieModel value)?  $default,){
final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TmdbModel tmdb, @JsonKey(name: "_id")  String id,  String name,  String slug, @JsonKey(name: "origin_name")  String originName,  String content,  String type,  String status, @JsonKey(name: "poster_url")  String posterUrl, @JsonKey(name: "thumb_url")  String thumbUrl,  String time, @JsonKey(name: "episode_current")  String episodeCurrent, @JsonKey(name: "episode_total")  String episodeTotal,  String quality,  String lang,  int year,  int view,  List<String> actor,  List<String> director,  List<MovieCategoryModel> category,  List<MovieCountryModel> country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
return $default(_that.tmdb,_that.id,_that.name,_that.slug,_that.originName,_that.content,_that.type,_that.status,_that.posterUrl,_that.thumbUrl,_that.time,_that.episodeCurrent,_that.episodeTotal,_that.quality,_that.lang,_that.year,_that.view,_that.actor,_that.director,_that.category,_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TmdbModel tmdb, @JsonKey(name: "_id")  String id,  String name,  String slug, @JsonKey(name: "origin_name")  String originName,  String content,  String type,  String status, @JsonKey(name: "poster_url")  String posterUrl, @JsonKey(name: "thumb_url")  String thumbUrl,  String time, @JsonKey(name: "episode_current")  String episodeCurrent, @JsonKey(name: "episode_total")  String episodeTotal,  String quality,  String lang,  int year,  int view,  List<String> actor,  List<String> director,  List<MovieCategoryModel> category,  List<MovieCountryModel> country)  $default,) {final _that = this;
switch (_that) {
case _MovieModel():
return $default(_that.tmdb,_that.id,_that.name,_that.slug,_that.originName,_that.content,_that.type,_that.status,_that.posterUrl,_that.thumbUrl,_that.time,_that.episodeCurrent,_that.episodeTotal,_that.quality,_that.lang,_that.year,_that.view,_that.actor,_that.director,_that.category,_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TmdbModel tmdb, @JsonKey(name: "_id")  String id,  String name,  String slug, @JsonKey(name: "origin_name")  String originName,  String content,  String type,  String status, @JsonKey(name: "poster_url")  String posterUrl, @JsonKey(name: "thumb_url")  String thumbUrl,  String time, @JsonKey(name: "episode_current")  String episodeCurrent, @JsonKey(name: "episode_total")  String episodeTotal,  String quality,  String lang,  int year,  int view,  List<String> actor,  List<String> director,  List<MovieCategoryModel> category,  List<MovieCountryModel> country)?  $default,) {final _that = this;
switch (_that) {
case _MovieModel() when $default != null:
return $default(_that.tmdb,_that.id,_that.name,_that.slug,_that.originName,_that.content,_that.type,_that.status,_that.posterUrl,_that.thumbUrl,_that.time,_that.episodeCurrent,_that.episodeTotal,_that.quality,_that.lang,_that.year,_that.view,_that.actor,_that.director,_that.category,_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovieModel implements MovieModel {
  const _MovieModel({this.tmdb = const TmdbModel(), @JsonKey(name: "_id") this.id = '', this.name = '', this.slug = '', @JsonKey(name: "origin_name") this.originName = '', this.content = '', this.type = '', this.status = '', @JsonKey(name: "poster_url") this.posterUrl = '', @JsonKey(name: "thumb_url") this.thumbUrl = '', this.time = '', @JsonKey(name: "episode_current") this.episodeCurrent = '', @JsonKey(name: "episode_total") this.episodeTotal = '', this.quality = '', this.lang = '', this.year = 0, this.view = 0, final  List<String> actor = const [], final  List<String> director = const [], final  List<MovieCategoryModel> category = const [], final  List<MovieCountryModel> country = const []}): _actor = actor,_director = director,_category = category,_country = country;
  factory _MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

@override@JsonKey() final  TmdbModel tmdb;
@override@JsonKey(name: "_id") final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String slug;
@override@JsonKey(name: "origin_name") final  String originName;
@override@JsonKey() final  String content;
@override@JsonKey() final  String type;
@override@JsonKey() final  String status;
@override@JsonKey(name: "poster_url") final  String posterUrl;
@override@JsonKey(name: "thumb_url") final  String thumbUrl;
@override@JsonKey() final  String time;
@override@JsonKey(name: "episode_current") final  String episodeCurrent;
@override@JsonKey(name: "episode_total") final  String episodeTotal;
@override@JsonKey() final  String quality;
@override@JsonKey() final  String lang;
@override@JsonKey() final  int year;
@override@JsonKey() final  int view;
 final  List<String> _actor;
@override@JsonKey() List<String> get actor {
  if (_actor is EqualUnmodifiableListView) return _actor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actor);
}

 final  List<String> _director;
@override@JsonKey() List<String> get director {
  if (_director is EqualUnmodifiableListView) return _director;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_director);
}

 final  List<MovieCategoryModel> _category;
@override@JsonKey() List<MovieCategoryModel> get category {
  if (_category is EqualUnmodifiableListView) return _category;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_category);
}

 final  List<MovieCountryModel> _country;
@override@JsonKey() List<MovieCountryModel> get country {
  if (_country is EqualUnmodifiableListView) return _country;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_country);
}


/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovieModelCopyWith<_MovieModel> get copyWith => __$MovieModelCopyWithImpl<_MovieModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovieModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovieModel&&(identical(other.tmdb, tmdb) || other.tmdb == tmdb)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.originName, originName) || other.originName == originName)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.posterUrl, posterUrl) || other.posterUrl == posterUrl)&&(identical(other.thumbUrl, thumbUrl) || other.thumbUrl == thumbUrl)&&(identical(other.time, time) || other.time == time)&&(identical(other.episodeCurrent, episodeCurrent) || other.episodeCurrent == episodeCurrent)&&(identical(other.episodeTotal, episodeTotal) || other.episodeTotal == episodeTotal)&&(identical(other.quality, quality) || other.quality == quality)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.year, year) || other.year == year)&&(identical(other.view, view) || other.view == view)&&const DeepCollectionEquality().equals(other._actor, _actor)&&const DeepCollectionEquality().equals(other._director, _director)&&const DeepCollectionEquality().equals(other._category, _category)&&const DeepCollectionEquality().equals(other._country, _country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,tmdb,id,name,slug,originName,content,type,status,posterUrl,thumbUrl,time,episodeCurrent,episodeTotal,quality,lang,year,view,const DeepCollectionEquality().hash(_actor),const DeepCollectionEquality().hash(_director),const DeepCollectionEquality().hash(_category),const DeepCollectionEquality().hash(_country)]);

@override
String toString() {
  return 'MovieModel(tmdb: $tmdb, id: $id, name: $name, slug: $slug, originName: $originName, content: $content, type: $type, status: $status, posterUrl: $posterUrl, thumbUrl: $thumbUrl, time: $time, episodeCurrent: $episodeCurrent, episodeTotal: $episodeTotal, quality: $quality, lang: $lang, year: $year, view: $view, actor: $actor, director: $director, category: $category, country: $country)';
}


}

/// @nodoc
abstract mixin class _$MovieModelCopyWith<$Res> implements $MovieModelCopyWith<$Res> {
  factory _$MovieModelCopyWith(_MovieModel value, $Res Function(_MovieModel) _then) = __$MovieModelCopyWithImpl;
@override @useResult
$Res call({
 TmdbModel tmdb,@JsonKey(name: "_id") String id, String name, String slug,@JsonKey(name: "origin_name") String originName, String content, String type, String status,@JsonKey(name: "poster_url") String posterUrl,@JsonKey(name: "thumb_url") String thumbUrl, String time,@JsonKey(name: "episode_current") String episodeCurrent,@JsonKey(name: "episode_total") String episodeTotal, String quality, String lang, int year, int view, List<String> actor, List<String> director, List<MovieCategoryModel> category, List<MovieCountryModel> country
});


@override $TmdbModelCopyWith<$Res> get tmdb;

}
/// @nodoc
class __$MovieModelCopyWithImpl<$Res>
    implements _$MovieModelCopyWith<$Res> {
  __$MovieModelCopyWithImpl(this._self, this._then);

  final _MovieModel _self;
  final $Res Function(_MovieModel) _then;

/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tmdb = null,Object? id = null,Object? name = null,Object? slug = null,Object? originName = null,Object? content = null,Object? type = null,Object? status = null,Object? posterUrl = null,Object? thumbUrl = null,Object? time = null,Object? episodeCurrent = null,Object? episodeTotal = null,Object? quality = null,Object? lang = null,Object? year = null,Object? view = null,Object? actor = null,Object? director = null,Object? category = null,Object? country = null,}) {
  return _then(_MovieModel(
tmdb: null == tmdb ? _self.tmdb : tmdb // ignore: cast_nullable_to_non_nullable
as TmdbModel,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,originName: null == originName ? _self.originName : originName // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,posterUrl: null == posterUrl ? _self.posterUrl : posterUrl // ignore: cast_nullable_to_non_nullable
as String,thumbUrl: null == thumbUrl ? _self.thumbUrl : thumbUrl // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,episodeCurrent: null == episodeCurrent ? _self.episodeCurrent : episodeCurrent // ignore: cast_nullable_to_non_nullable
as String,episodeTotal: null == episodeTotal ? _self.episodeTotal : episodeTotal // ignore: cast_nullable_to_non_nullable
as String,quality: null == quality ? _self.quality : quality // ignore: cast_nullable_to_non_nullable
as String,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,view: null == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as int,actor: null == actor ? _self._actor : actor // ignore: cast_nullable_to_non_nullable
as List<String>,director: null == director ? _self._director : director // ignore: cast_nullable_to_non_nullable
as List<String>,category: null == category ? _self._category : category // ignore: cast_nullable_to_non_nullable
as List<MovieCategoryModel>,country: null == country ? _self._country : country // ignore: cast_nullable_to_non_nullable
as List<MovieCountryModel>,
  ));
}

/// Create a copy of MovieModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TmdbModelCopyWith<$Res> get tmdb {
  
  return $TmdbModelCopyWith<$Res>(_self.tmdb, (value) {
    return _then(_self.copyWith(tmdb: value));
  });
}
}

// dart format on
