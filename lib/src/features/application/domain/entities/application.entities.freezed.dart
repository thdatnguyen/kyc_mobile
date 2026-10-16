// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application.entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonalDetailsEntity {

 String? get fullName; String? get dateOfBirth; String? get nationality; String? get address; String? get phone;
/// Create a copy of PersonalDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalDetailsEntityCopyWith<PersonalDetailsEntity> get copyWith => _$PersonalDetailsEntityCopyWithImpl<PersonalDetailsEntity>(this as PersonalDetailsEntity, _$identity);

  /// Serializes this PersonalDetailsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PersonalDetailsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalDetailsEntity&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth)&&(identical(other.nationality, _this.nationality) || other.nationality == _this.nationality)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.phone, _this.phone) || other.phone == _this.phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PersonalDetailsEntity;
  return Object.hash(runtimeType,_this.fullName,_this.dateOfBirth,_this.nationality,_this.address,_this.phone);
}

@override
String toString() {
  final _this = this as PersonalDetailsEntity;
  return 'PersonalDetailsEntity(fullName: ${_this.fullName}, dateOfBirth: ${_this.dateOfBirth}, nationality: ${_this.nationality}, address: ${_this.address}, phone: ${_this.phone})';
}


}

/// @nodoc
abstract mixin class $PersonalDetailsEntityCopyWith<$Res>  {
  factory $PersonalDetailsEntityCopyWith(PersonalDetailsEntity value, $Res Function(PersonalDetailsEntity) _then) = _$PersonalDetailsEntityCopyWithImpl;
@useResult
$Res call({
 String? fullName, String? dateOfBirth, String? nationality, String? address, String? phone
});




}
/// @nodoc
class _$PersonalDetailsEntityCopyWithImpl<$Res>
    implements $PersonalDetailsEntityCopyWith<$Res> {
  _$PersonalDetailsEntityCopyWithImpl(this._self, this._then);

  final PersonalDetailsEntity _self;
  final $Res Function(PersonalDetailsEntity) _then;

/// Create a copy of PersonalDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? dateOfBirth = freezed,Object? nationality = freezed,Object? address = freezed,Object? phone = freezed,}) {
  return _then(PersonalDetailsEntity(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalDetailsEntity].
extension PersonalDetailsEntityPatterns on PersonalDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _PersonalDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fullName,  String? dateOfBirth,  String? nationality,  String? address,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalDetailsEntity() when $default != null:
return $default(_that.fullName,_that.dateOfBirth,_that.nationality,_that.address,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fullName,  String? dateOfBirth,  String? nationality,  String? address,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _PersonalDetailsEntity():
return $default(_that.fullName,_that.dateOfBirth,_that.nationality,_that.address,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fullName,  String? dateOfBirth,  String? nationality,  String? address,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _PersonalDetailsEntity() when $default != null:
return $default(_that.fullName,_that.dateOfBirth,_that.nationality,_that.address,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PersonalDetailsEntity implements PersonalDetailsEntity {
  const _PersonalDetailsEntity({this.fullName, this.dateOfBirth, this.nationality, this.address, this.phone});
  factory _PersonalDetailsEntity.fromJson(Map<String, dynamic> json) => _$PersonalDetailsEntityFromJson(json);

@override final  String? fullName;
@override final  String? dateOfBirth;
@override final  String? nationality;
@override final  String? address;
@override final  String? phone;

/// Create a copy of PersonalDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalDetailsEntityCopyWith<_PersonalDetailsEntity> get copyWith => __$PersonalDetailsEntityCopyWithImpl<_PersonalDetailsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PersonalDetailsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalDetailsEntity&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,fullName,dateOfBirth,nationality,address,phone);
}

@override
String toString() {
    return 'PersonalDetailsEntity(fullName: $fullName, dateOfBirth: $dateOfBirth, nationality: $nationality, address: $address, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$PersonalDetailsEntityCopyWith<$Res> implements $PersonalDetailsEntityCopyWith<$Res> {
  factory _$PersonalDetailsEntityCopyWith(_PersonalDetailsEntity value, $Res Function(_PersonalDetailsEntity) _then) = __$PersonalDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 String? fullName, String? dateOfBirth, String? nationality, String? address, String? phone
});




}
/// @nodoc
class __$PersonalDetailsEntityCopyWithImpl<$Res>
    implements _$PersonalDetailsEntityCopyWith<$Res> {
  __$PersonalDetailsEntityCopyWithImpl(this._self, this._then);

  final _PersonalDetailsEntity _self;
  final $Res Function(_PersonalDetailsEntity) _then;

/// Create a copy of PersonalDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? dateOfBirth = freezed,Object? nationality = freezed,Object? address = freezed,Object? phone = freezed,}) {
  return _then(_PersonalDetailsEntity(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$DocumentInfoEntity {

 String? get type; String? get documentNumber; String? get fullName; String? get dateOfBirth; String? get expiryDate; String? get imagePublicId;
/// Create a copy of DocumentInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentInfoEntityCopyWith<DocumentInfoEntity> get copyWith => _$DocumentInfoEntityCopyWithImpl<DocumentInfoEntity>(this as DocumentInfoEntity, _$identity);

  /// Serializes this DocumentInfoEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DocumentInfoEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentInfoEntity&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.documentNumber, _this.documentNumber) || other.documentNumber == _this.documentNumber)&&(identical(other.fullName, _this.fullName) || other.fullName == _this.fullName)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth)&&(identical(other.expiryDate, _this.expiryDate) || other.expiryDate == _this.expiryDate)&&(identical(other.imagePublicId, _this.imagePublicId) || other.imagePublicId == _this.imagePublicId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DocumentInfoEntity;
  return Object.hash(runtimeType,_this.type,_this.documentNumber,_this.fullName,_this.dateOfBirth,_this.expiryDate,_this.imagePublicId);
}

@override
String toString() {
  final _this = this as DocumentInfoEntity;
  return 'DocumentInfoEntity(type: ${_this.type}, documentNumber: ${_this.documentNumber}, fullName: ${_this.fullName}, dateOfBirth: ${_this.dateOfBirth}, expiryDate: ${_this.expiryDate}, imagePublicId: ${_this.imagePublicId})';
}


}

/// @nodoc
abstract mixin class $DocumentInfoEntityCopyWith<$Res>  {
  factory $DocumentInfoEntityCopyWith(DocumentInfoEntity value, $Res Function(DocumentInfoEntity) _then) = _$DocumentInfoEntityCopyWithImpl;
@useResult
$Res call({
 String? type, String? documentNumber, String? fullName, String? dateOfBirth, String? expiryDate, String? imagePublicId
});




}
/// @nodoc
class _$DocumentInfoEntityCopyWithImpl<$Res>
    implements $DocumentInfoEntityCopyWith<$Res> {
  _$DocumentInfoEntityCopyWithImpl(this._self, this._then);

  final DocumentInfoEntity _self;
  final $Res Function(DocumentInfoEntity) _then;

/// Create a copy of DocumentInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? documentNumber = freezed,Object? fullName = freezed,Object? dateOfBirth = freezed,Object? expiryDate = freezed,Object? imagePublicId = freezed,}) {
  return _then(DocumentInfoEntity(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,documentNumber: freezed == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,imagePublicId: freezed == imagePublicId ? _self.imagePublicId : imagePublicId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DocumentInfoEntity].
extension DocumentInfoEntityPatterns on DocumentInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _DocumentInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? type,  String? documentNumber,  String? fullName,  String? dateOfBirth,  String? expiryDate,  String? imagePublicId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DocumentInfoEntity() when $default != null:
return $default(_that.type,_that.documentNumber,_that.fullName,_that.dateOfBirth,_that.expiryDate,_that.imagePublicId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? type,  String? documentNumber,  String? fullName,  String? dateOfBirth,  String? expiryDate,  String? imagePublicId)  $default,) {final _that = this;
switch (_that) {
case _DocumentInfoEntity():
return $default(_that.type,_that.documentNumber,_that.fullName,_that.dateOfBirth,_that.expiryDate,_that.imagePublicId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? type,  String? documentNumber,  String? fullName,  String? dateOfBirth,  String? expiryDate,  String? imagePublicId)?  $default,) {final _that = this;
switch (_that) {
case _DocumentInfoEntity() when $default != null:
return $default(_that.type,_that.documentNumber,_that.fullName,_that.dateOfBirth,_that.expiryDate,_that.imagePublicId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentInfoEntity implements DocumentInfoEntity {
  const _DocumentInfoEntity({this.type, this.documentNumber, this.fullName, this.dateOfBirth, this.expiryDate, this.imagePublicId});
  factory _DocumentInfoEntity.fromJson(Map<String, dynamic> json) => _$DocumentInfoEntityFromJson(json);

@override final  String? type;
@override final  String? documentNumber;
@override final  String? fullName;
@override final  String? dateOfBirth;
@override final  String? expiryDate;
@override final  String? imagePublicId;

/// Create a copy of DocumentInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentInfoEntityCopyWith<_DocumentInfoEntity> get copyWith => __$DocumentInfoEntityCopyWithImpl<_DocumentInfoEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentInfoEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentInfoEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.documentNumber, documentNumber) || other.documentNumber == documentNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.imagePublicId, imagePublicId) || other.imagePublicId == imagePublicId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,documentNumber,fullName,dateOfBirth,expiryDate,imagePublicId);
}

@override
String toString() {
    return 'DocumentInfoEntity(type: $type, documentNumber: $documentNumber, fullName: $fullName, dateOfBirth: $dateOfBirth, expiryDate: $expiryDate, imagePublicId: $imagePublicId)';
}


}

/// @nodoc
abstract mixin class _$DocumentInfoEntityCopyWith<$Res> implements $DocumentInfoEntityCopyWith<$Res> {
  factory _$DocumentInfoEntityCopyWith(_DocumentInfoEntity value, $Res Function(_DocumentInfoEntity) _then) = __$DocumentInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String? type, String? documentNumber, String? fullName, String? dateOfBirth, String? expiryDate, String? imagePublicId
});




}
/// @nodoc
class __$DocumentInfoEntityCopyWithImpl<$Res>
    implements _$DocumentInfoEntityCopyWith<$Res> {
  __$DocumentInfoEntityCopyWithImpl(this._self, this._then);

  final _DocumentInfoEntity _self;
  final $Res Function(_DocumentInfoEntity) _then;

/// Create a copy of DocumentInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? documentNumber = freezed,Object? fullName = freezed,Object? dateOfBirth = freezed,Object? expiryDate = freezed,Object? imagePublicId = freezed,}) {
  return _then(_DocumentInfoEntity(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,documentNumber: freezed == documentNumber ? _self.documentNumber : documentNumber // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,expiryDate: freezed == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String?,imagePublicId: freezed == imagePublicId ? _self.imagePublicId : imagePublicId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LivenessInfo {

 bool get passed; String get method;
/// Create a copy of LivenessInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivenessInfoCopyWith<LivenessInfo> get copyWith => _$LivenessInfoCopyWithImpl<LivenessInfo>(this as LivenessInfo, _$identity);

  /// Serializes this LivenessInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LivenessInfo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivenessInfo&&(identical(other.passed, _this.passed) || other.passed == _this.passed)&&(identical(other.method, _this.method) || other.method == _this.method));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LivenessInfo;
  return Object.hash(runtimeType,_this.passed,_this.method);
}

@override
String toString() {
  final _this = this as LivenessInfo;
  return 'LivenessInfo(passed: ${_this.passed}, method: ${_this.method})';
}


}

/// @nodoc
abstract mixin class $LivenessInfoCopyWith<$Res>  {
  factory $LivenessInfoCopyWith(LivenessInfo value, $Res Function(LivenessInfo) _then) = _$LivenessInfoCopyWithImpl;
@useResult
$Res call({
 bool passed, String method
});




}
/// @nodoc
class _$LivenessInfoCopyWithImpl<$Res>
    implements $LivenessInfoCopyWith<$Res> {
  _$LivenessInfoCopyWithImpl(this._self, this._then);

  final LivenessInfo _self;
  final $Res Function(LivenessInfo) _then;

/// Create a copy of LivenessInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? passed = null,Object? method = null,}) {
  return _then(LivenessInfo(
passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LivenessInfo].
extension LivenessInfoPatterns on LivenessInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivenessInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivenessInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivenessInfo value)  $default,){
final _that = this;
switch (_that) {
case _LivenessInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivenessInfo value)?  $default,){
final _that = this;
switch (_that) {
case _LivenessInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool passed,  String method)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivenessInfo() when $default != null:
return $default(_that.passed,_that.method);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool passed,  String method)  $default,) {final _that = this;
switch (_that) {
case _LivenessInfo():
return $default(_that.passed,_that.method);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool passed,  String method)?  $default,) {final _that = this;
switch (_that) {
case _LivenessInfo() when $default != null:
return $default(_that.passed,_that.method);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LivenessInfo implements LivenessInfo {
  const _LivenessInfo({required this.passed, required this.method});
  factory _LivenessInfo.fromJson(Map<String, dynamic> json) => _$LivenessInfoFromJson(json);

@override final  bool passed;
@override final  String method;

/// Create a copy of LivenessInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivenessInfoCopyWith<_LivenessInfo> get copyWith => __$LivenessInfoCopyWithImpl<_LivenessInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LivenessInfoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivenessInfo&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.method, method) || other.method == method));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,passed,method);
}

@override
String toString() {
    return 'LivenessInfo(passed: $passed, method: $method)';
}


}

/// @nodoc
abstract mixin class _$LivenessInfoCopyWith<$Res> implements $LivenessInfoCopyWith<$Res> {
  factory _$LivenessInfoCopyWith(_LivenessInfo value, $Res Function(_LivenessInfo) _then) = __$LivenessInfoCopyWithImpl;
@override @useResult
$Res call({
 bool passed, String method
});




}
/// @nodoc
class __$LivenessInfoCopyWithImpl<$Res>
    implements _$LivenessInfoCopyWith<$Res> {
  __$LivenessInfoCopyWithImpl(this._self, this._then);

  final _LivenessInfo _self;
  final $Res Function(_LivenessInfo) _then;

/// Create a copy of LivenessInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? passed = null,Object? method = null,}) {
  return _then(_LivenessInfo(
passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SelfieEntity {

 String? get imagePublicId; LivenessInfo? get liveness;
/// Create a copy of SelfieEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelfieEntityCopyWith<SelfieEntity> get copyWith => _$SelfieEntityCopyWithImpl<SelfieEntity>(this as SelfieEntity, _$identity);

  /// Serializes this SelfieEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SelfieEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelfieEntity&&(identical(other.imagePublicId, _this.imagePublicId) || other.imagePublicId == _this.imagePublicId)&&(identical(other.liveness, _this.liveness) || other.liveness == _this.liveness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SelfieEntity;
  return Object.hash(runtimeType,_this.imagePublicId,_this.liveness);
}

@override
String toString() {
  final _this = this as SelfieEntity;
  return 'SelfieEntity(imagePublicId: ${_this.imagePublicId}, liveness: ${_this.liveness})';
}


}

/// @nodoc
abstract mixin class $SelfieEntityCopyWith<$Res>  {
  factory $SelfieEntityCopyWith(SelfieEntity value, $Res Function(SelfieEntity) _then) = _$SelfieEntityCopyWithImpl;
@useResult
$Res call({
 String? imagePublicId, LivenessInfo? liveness
});


$LivenessInfoCopyWith<$Res>? get liveness;

}
/// @nodoc
class _$SelfieEntityCopyWithImpl<$Res>
    implements $SelfieEntityCopyWith<$Res> {
  _$SelfieEntityCopyWithImpl(this._self, this._then);

  final SelfieEntity _self;
  final $Res Function(SelfieEntity) _then;

/// Create a copy of SelfieEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imagePublicId = freezed,Object? liveness = freezed,}) {
  return _then(SelfieEntity(
imagePublicId: freezed == imagePublicId ? _self.imagePublicId : imagePublicId // ignore: cast_nullable_to_non_nullable
as String?,liveness: freezed == liveness ? _self.liveness : liveness // ignore: cast_nullable_to_non_nullable
as LivenessInfo?,
  ));
}
/// Create a copy of SelfieEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivenessInfoCopyWith<$Res>? get liveness {
    if (_self.liveness == null) {
    return null;
  }

  return $LivenessInfoCopyWith<$Res>(_self.liveness!, (value) {
    return _then(_self.copyWith(liveness: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelfieEntity].
extension SelfieEntityPatterns on SelfieEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelfieEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelfieEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelfieEntity value)  $default,){
final _that = this;
switch (_that) {
case _SelfieEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelfieEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SelfieEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? imagePublicId,  LivenessInfo? liveness)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelfieEntity() when $default != null:
return $default(_that.imagePublicId,_that.liveness);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? imagePublicId,  LivenessInfo? liveness)  $default,) {final _that = this;
switch (_that) {
case _SelfieEntity():
return $default(_that.imagePublicId,_that.liveness);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? imagePublicId,  LivenessInfo? liveness)?  $default,) {final _that = this;
switch (_that) {
case _SelfieEntity() when $default != null:
return $default(_that.imagePublicId,_that.liveness);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SelfieEntity implements SelfieEntity {
  const _SelfieEntity({this.imagePublicId, this.liveness});
  factory _SelfieEntity.fromJson(Map<String, dynamic> json) => _$SelfieEntityFromJson(json);

@override final  String? imagePublicId;
@override final  LivenessInfo? liveness;

/// Create a copy of SelfieEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelfieEntityCopyWith<_SelfieEntity> get copyWith => __$SelfieEntityCopyWithImpl<_SelfieEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SelfieEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelfieEntity&&(identical(other.imagePublicId, imagePublicId) || other.imagePublicId == imagePublicId)&&(identical(other.liveness, liveness) || other.liveness == liveness));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,imagePublicId,liveness);
}

@override
String toString() {
    return 'SelfieEntity(imagePublicId: $imagePublicId, liveness: $liveness)';
}


}

/// @nodoc
abstract mixin class _$SelfieEntityCopyWith<$Res> implements $SelfieEntityCopyWith<$Res> {
  factory _$SelfieEntityCopyWith(_SelfieEntity value, $Res Function(_SelfieEntity) _then) = __$SelfieEntityCopyWithImpl;
@override @useResult
$Res call({
 String? imagePublicId, LivenessInfo? liveness
});


@override $LivenessInfoCopyWith<$Res>? get liveness;

}
/// @nodoc
class __$SelfieEntityCopyWithImpl<$Res>
    implements _$SelfieEntityCopyWith<$Res> {
  __$SelfieEntityCopyWithImpl(this._self, this._then);

  final _SelfieEntity _self;
  final $Res Function(_SelfieEntity) _then;

/// Create a copy of SelfieEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imagePublicId = freezed,Object? liveness = freezed,}) {
  return _then(_SelfieEntity(
imagePublicId: freezed == imagePublicId ? _self.imagePublicId : imagePublicId // ignore: cast_nullable_to_non_nullable
as String?,liveness: freezed == liveness ? _self.liveness : liveness // ignore: cast_nullable_to_non_nullable
as LivenessInfo?,
  ));
}

/// Create a copy of SelfieEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LivenessInfoCopyWith<$Res>? get liveness {
    if (_self.liveness == null) {
    return null;
  }

  return $LivenessInfoCopyWith<$Res>(_self.liveness!, (value) {
    return _then(_self.copyWith(liveness: value));
  });
}
}


/// @nodoc
mixin _$CheckResultEntity {

 String get name; bool get passed; String? get message;
/// Create a copy of CheckResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckResultEntityCopyWith<CheckResultEntity> get copyWith => _$CheckResultEntityCopyWithImpl<CheckResultEntity>(this as CheckResultEntity, _$identity);

  /// Serializes this CheckResultEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CheckResultEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckResultEntity&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.passed, _this.passed) || other.passed == _this.passed)&&(identical(other.message, _this.message) || other.message == _this.message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CheckResultEntity;
  return Object.hash(runtimeType,_this.name,_this.passed,_this.message);
}

@override
String toString() {
  final _this = this as CheckResultEntity;
  return 'CheckResultEntity(name: ${_this.name}, passed: ${_this.passed}, message: ${_this.message})';
}


}

/// @nodoc
abstract mixin class $CheckResultEntityCopyWith<$Res>  {
  factory $CheckResultEntityCopyWith(CheckResultEntity value, $Res Function(CheckResultEntity) _then) = _$CheckResultEntityCopyWithImpl;
@useResult
$Res call({
 String name, bool passed, String? message
});




}
/// @nodoc
class _$CheckResultEntityCopyWithImpl<$Res>
    implements $CheckResultEntityCopyWith<$Res> {
  _$CheckResultEntityCopyWithImpl(this._self, this._then);

  final CheckResultEntity _self;
  final $Res Function(CheckResultEntity) _then;

/// Create a copy of CheckResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? passed = null,Object? message = freezed,}) {
  return _then(CheckResultEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckResultEntity].
extension CheckResultEntityPatterns on CheckResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _CheckResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CheckResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  bool passed,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckResultEntity() when $default != null:
return $default(_that.name,_that.passed,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  bool passed,  String? message)  $default,) {final _that = this;
switch (_that) {
case _CheckResultEntity():
return $default(_that.name,_that.passed,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  bool passed,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _CheckResultEntity() when $default != null:
return $default(_that.name,_that.passed,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckResultEntity implements CheckResultEntity {
  const _CheckResultEntity({required this.name, required this.passed, this.message});
  factory _CheckResultEntity.fromJson(Map<String, dynamic> json) => _$CheckResultEntityFromJson(json);

@override final  String name;
@override final  bool passed;
@override final  String? message;

/// Create a copy of CheckResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckResultEntityCopyWith<_CheckResultEntity> get copyWith => __$CheckResultEntityCopyWithImpl<_CheckResultEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckResultEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckResultEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.passed, passed) || other.passed == passed)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,passed,message);
}

@override
String toString() {
    return 'CheckResultEntity(name: $name, passed: $passed, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CheckResultEntityCopyWith<$Res> implements $CheckResultEntityCopyWith<$Res> {
  factory _$CheckResultEntityCopyWith(_CheckResultEntity value, $Res Function(_CheckResultEntity) _then) = __$CheckResultEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, bool passed, String? message
});




}
/// @nodoc
class __$CheckResultEntityCopyWithImpl<$Res>
    implements _$CheckResultEntityCopyWith<$Res> {
  __$CheckResultEntityCopyWithImpl(this._self, this._then);

  final _CheckResultEntity _self;
  final $Res Function(_CheckResultEntity) _then;

/// Create a copy of CheckResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? passed = null,Object? message = freezed,}) {
  return _then(_CheckResultEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,passed: null == passed ? _self.passed : passed // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FaceMatchEntity {

 bool get modelLoaded; bool? get matched; double? get similarity; String? get error;
/// Create a copy of FaceMatchEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaceMatchEntityCopyWith<FaceMatchEntity> get copyWith => _$FaceMatchEntityCopyWithImpl<FaceMatchEntity>(this as FaceMatchEntity, _$identity);

  /// Serializes this FaceMatchEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FaceMatchEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceMatchEntity&&(identical(other.modelLoaded, _this.modelLoaded) || other.modelLoaded == _this.modelLoaded)&&(identical(other.matched, _this.matched) || other.matched == _this.matched)&&(identical(other.similarity, _this.similarity) || other.similarity == _this.similarity)&&(identical(other.error, _this.error) || other.error == _this.error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FaceMatchEntity;
  return Object.hash(runtimeType,_this.modelLoaded,_this.matched,_this.similarity,_this.error);
}

@override
String toString() {
  final _this = this as FaceMatchEntity;
  return 'FaceMatchEntity(modelLoaded: ${_this.modelLoaded}, matched: ${_this.matched}, similarity: ${_this.similarity}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $FaceMatchEntityCopyWith<$Res>  {
  factory $FaceMatchEntityCopyWith(FaceMatchEntity value, $Res Function(FaceMatchEntity) _then) = _$FaceMatchEntityCopyWithImpl;
@useResult
$Res call({
 bool modelLoaded, bool? matched, double? similarity, String? error
});




}
/// @nodoc
class _$FaceMatchEntityCopyWithImpl<$Res>
    implements $FaceMatchEntityCopyWith<$Res> {
  _$FaceMatchEntityCopyWithImpl(this._self, this._then);

  final FaceMatchEntity _self;
  final $Res Function(FaceMatchEntity) _then;

/// Create a copy of FaceMatchEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? modelLoaded = null,Object? matched = freezed,Object? similarity = freezed,Object? error = freezed,}) {
  return _then(FaceMatchEntity(
modelLoaded: null == modelLoaded ? _self.modelLoaded : modelLoaded // ignore: cast_nullable_to_non_nullable
as bool,matched: freezed == matched ? _self.matched : matched // ignore: cast_nullable_to_non_nullable
as bool?,similarity: freezed == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FaceMatchEntity].
extension FaceMatchEntityPatterns on FaceMatchEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaceMatchEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaceMatchEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaceMatchEntity value)  $default,){
final _that = this;
switch (_that) {
case _FaceMatchEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaceMatchEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FaceMatchEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool modelLoaded,  bool? matched,  double? similarity,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaceMatchEntity() when $default != null:
return $default(_that.modelLoaded,_that.matched,_that.similarity,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool modelLoaded,  bool? matched,  double? similarity,  String? error)  $default,) {final _that = this;
switch (_that) {
case _FaceMatchEntity():
return $default(_that.modelLoaded,_that.matched,_that.similarity,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool modelLoaded,  bool? matched,  double? similarity,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _FaceMatchEntity() when $default != null:
return $default(_that.modelLoaded,_that.matched,_that.similarity,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaceMatchEntity implements FaceMatchEntity {
  const _FaceMatchEntity({required this.modelLoaded, this.matched, this.similarity, this.error});
  factory _FaceMatchEntity.fromJson(Map<String, dynamic> json) => _$FaceMatchEntityFromJson(json);

@override final  bool modelLoaded;
@override final  bool? matched;
@override final  double? similarity;
@override final  String? error;

/// Create a copy of FaceMatchEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaceMatchEntityCopyWith<_FaceMatchEntity> get copyWith => __$FaceMatchEntityCopyWithImpl<_FaceMatchEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaceMatchEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaceMatchEntity&&(identical(other.modelLoaded, modelLoaded) || other.modelLoaded == modelLoaded)&&(identical(other.matched, matched) || other.matched == matched)&&(identical(other.similarity, similarity) || other.similarity == similarity)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,modelLoaded,matched,similarity,error);
}

@override
String toString() {
    return 'FaceMatchEntity(modelLoaded: $modelLoaded, matched: $matched, similarity: $similarity, error: $error)';
}


}

/// @nodoc
abstract mixin class _$FaceMatchEntityCopyWith<$Res> implements $FaceMatchEntityCopyWith<$Res> {
  factory _$FaceMatchEntityCopyWith(_FaceMatchEntity value, $Res Function(_FaceMatchEntity) _then) = __$FaceMatchEntityCopyWithImpl;
@override @useResult
$Res call({
 bool modelLoaded, bool? matched, double? similarity, String? error
});




}
/// @nodoc
class __$FaceMatchEntityCopyWithImpl<$Res>
    implements _$FaceMatchEntityCopyWith<$Res> {
  __$FaceMatchEntityCopyWithImpl(this._self, this._then);

  final _FaceMatchEntity _self;
  final $Res Function(_FaceMatchEntity) _then;

/// Create a copy of FaceMatchEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? modelLoaded = null,Object? matched = freezed,Object? similarity = freezed,Object? error = freezed,}) {
  return _then(_FaceMatchEntity(
modelLoaded: null == modelLoaded ? _self.modelLoaded : modelLoaded // ignore: cast_nullable_to_non_nullable
as bool,matched: freezed == matched ? _self.matched : matched // ignore: cast_nullable_to_non_nullable
as bool?,similarity: freezed == similarity ? _self.similarity : similarity // ignore: cast_nullable_to_non_nullable
as double?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AdminReviewEntity {

 String? get decision; List<String>? get reasons; String? get decidedAt;
/// Create a copy of AdminReviewEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminReviewEntityCopyWith<AdminReviewEntity> get copyWith => _$AdminReviewEntityCopyWithImpl<AdminReviewEntity>(this as AdminReviewEntity, _$identity);

  /// Serializes this AdminReviewEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AdminReviewEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminReviewEntity&&(identical(other.decision, _this.decision) || other.decision == _this.decision)&&const DeepCollectionEquality().equals(other.reasons, _this.reasons)&&(identical(other.decidedAt, _this.decidedAt) || other.decidedAt == _this.decidedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AdminReviewEntity;
  return Object.hash(runtimeType,_this.decision,const DeepCollectionEquality().hash(_this.reasons),_this.decidedAt);
}

@override
String toString() {
  final _this = this as AdminReviewEntity;
  return 'AdminReviewEntity(decision: ${_this.decision}, reasons: ${_this.reasons}, decidedAt: ${_this.decidedAt})';
}


}

/// @nodoc
abstract mixin class $AdminReviewEntityCopyWith<$Res>  {
  factory $AdminReviewEntityCopyWith(AdminReviewEntity value, $Res Function(AdminReviewEntity) _then) = _$AdminReviewEntityCopyWithImpl;
@useResult
$Res call({
 String? decision, List<String>? reasons, String? decidedAt
});




}
/// @nodoc
class _$AdminReviewEntityCopyWithImpl<$Res>
    implements $AdminReviewEntityCopyWith<$Res> {
  _$AdminReviewEntityCopyWithImpl(this._self, this._then);

  final AdminReviewEntity _self;
  final $Res Function(AdminReviewEntity) _then;

/// Create a copy of AdminReviewEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? decision = freezed,Object? reasons = freezed,Object? decidedAt = freezed,}) {
  return _then(AdminReviewEntity(
decision: freezed == decision ? _self.decision : decision // ignore: cast_nullable_to_non_nullable
as String?,reasons: freezed == reasons ? _self.reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<String>?,decidedAt: freezed == decidedAt ? _self.decidedAt : decidedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminReviewEntity].
extension AdminReviewEntityPatterns on AdminReviewEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminReviewEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminReviewEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminReviewEntity value)  $default,){
final _that = this;
switch (_that) {
case _AdminReviewEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminReviewEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AdminReviewEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? decision,  List<String>? reasons,  String? decidedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminReviewEntity() when $default != null:
return $default(_that.decision,_that.reasons,_that.decidedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? decision,  List<String>? reasons,  String? decidedAt)  $default,) {final _that = this;
switch (_that) {
case _AdminReviewEntity():
return $default(_that.decision,_that.reasons,_that.decidedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? decision,  List<String>? reasons,  String? decidedAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminReviewEntity() when $default != null:
return $default(_that.decision,_that.reasons,_that.decidedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminReviewEntity implements AdminReviewEntity {
  const _AdminReviewEntity({this.decision,  List<String>? reasons, this.decidedAt}): _reasons = reasons;
  factory _AdminReviewEntity.fromJson(Map<String, dynamic> json) => _$AdminReviewEntityFromJson(json);

@override final  String? decision;
 final  List<String>? _reasons;
@override List<String>? get reasons {
  final value = _reasons;
  if (value == null) return null;
  if (_reasons is EqualUnmodifiableListView) return _reasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? decidedAt;

/// Create a copy of AdminReviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminReviewEntityCopyWith<_AdminReviewEntity> get copyWith => __$AdminReviewEntityCopyWithImpl<_AdminReviewEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminReviewEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminReviewEntity&&(identical(other.decision, decision) || other.decision == decision)&&const DeepCollectionEquality().equals(other.reasons, _reasons)&&(identical(other.decidedAt, decidedAt) || other.decidedAt == decidedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,decision,const DeepCollectionEquality().hash(_reasons),decidedAt);
}

@override
String toString() {
    return 'AdminReviewEntity(decision: $decision, reasons: $reasons, decidedAt: $decidedAt)';
}


}

/// @nodoc
abstract mixin class _$AdminReviewEntityCopyWith<$Res> implements $AdminReviewEntityCopyWith<$Res> {
  factory _$AdminReviewEntityCopyWith(_AdminReviewEntity value, $Res Function(_AdminReviewEntity) _then) = __$AdminReviewEntityCopyWithImpl;
@override @useResult
$Res call({
 String? decision, List<String>? reasons, String? decidedAt
});




}
/// @nodoc
class __$AdminReviewEntityCopyWithImpl<$Res>
    implements _$AdminReviewEntityCopyWith<$Res> {
  __$AdminReviewEntityCopyWithImpl(this._self, this._then);

  final _AdminReviewEntity _self;
  final $Res Function(_AdminReviewEntity) _then;

/// Create a copy of AdminReviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? decision = freezed,Object? reasons = freezed,Object? decidedAt = freezed,}) {
  return _then(_AdminReviewEntity(
decision: freezed == decision ? _self.decision : decision // ignore: cast_nullable_to_non_nullable
as String?,reasons: freezed == reasons ? _self._reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<String>?,decidedAt: freezed == decidedAt ? _self.decidedAt : decidedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SubmissionEntity {

 String get id; int get version; String get result; List<CheckResultEntity>? get checks; FaceMatchEntity? get faceMatch; PersonalDetailsEntity? get personalDetails; DocumentInfoEntity? get document; SelfieEntity? get selfie; AdminReviewEntity? get adminReview;
/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionEntityCopyWith<SubmissionEntity> get copyWith => _$SubmissionEntityCopyWithImpl<SubmissionEntity>(this as SubmissionEntity, _$identity);

  /// Serializes this SubmissionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SubmissionEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.result, _this.result) || other.result == _this.result)&&const DeepCollectionEquality().equals(other.checks, _this.checks)&&(identical(other.faceMatch, _this.faceMatch) || other.faceMatch == _this.faceMatch)&&(identical(other.personalDetails, _this.personalDetails) || other.personalDetails == _this.personalDetails)&&(identical(other.document, _this.document) || other.document == _this.document)&&(identical(other.selfie, _this.selfie) || other.selfie == _this.selfie)&&(identical(other.adminReview, _this.adminReview) || other.adminReview == _this.adminReview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SubmissionEntity;
  return Object.hash(runtimeType,_this.id,_this.version,_this.result,const DeepCollectionEquality().hash(_this.checks),_this.faceMatch,_this.personalDetails,_this.document,_this.selfie,_this.adminReview);
}

@override
String toString() {
  final _this = this as SubmissionEntity;
  return 'SubmissionEntity(id: ${_this.id}, version: ${_this.version}, result: ${_this.result}, checks: ${_this.checks}, faceMatch: ${_this.faceMatch}, personalDetails: ${_this.personalDetails}, document: ${_this.document}, selfie: ${_this.selfie}, adminReview: ${_this.adminReview})';
}


}

/// @nodoc
abstract mixin class $SubmissionEntityCopyWith<$Res>  {
  factory $SubmissionEntityCopyWith(SubmissionEntity value, $Res Function(SubmissionEntity) _then) = _$SubmissionEntityCopyWithImpl;
@useResult
$Res call({
 String id, int version, String result, List<CheckResultEntity>? checks, FaceMatchEntity? faceMatch, PersonalDetailsEntity? personalDetails, DocumentInfoEntity? document, SelfieEntity? selfie, AdminReviewEntity? adminReview
});


$FaceMatchEntityCopyWith<$Res>? get faceMatch;$PersonalDetailsEntityCopyWith<$Res>? get personalDetails;$DocumentInfoEntityCopyWith<$Res>? get document;$SelfieEntityCopyWith<$Res>? get selfie;$AdminReviewEntityCopyWith<$Res>? get adminReview;

}
/// @nodoc
class _$SubmissionEntityCopyWithImpl<$Res>
    implements $SubmissionEntityCopyWith<$Res> {
  _$SubmissionEntityCopyWithImpl(this._self, this._then);

  final SubmissionEntity _self;
  final $Res Function(SubmissionEntity) _then;

/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? version = null,Object? result = null,Object? checks = freezed,Object? faceMatch = freezed,Object? personalDetails = freezed,Object? document = freezed,Object? selfie = freezed,Object? adminReview = freezed,}) {
  return _then(SubmissionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,checks: freezed == checks ? _self.checks : checks // ignore: cast_nullable_to_non_nullable
as List<CheckResultEntity>?,faceMatch: freezed == faceMatch ? _self.faceMatch : faceMatch // ignore: cast_nullable_to_non_nullable
as FaceMatchEntity?,personalDetails: freezed == personalDetails ? _self.personalDetails : personalDetails // ignore: cast_nullable_to_non_nullable
as PersonalDetailsEntity?,document: freezed == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as DocumentInfoEntity?,selfie: freezed == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as SelfieEntity?,adminReview: freezed == adminReview ? _self.adminReview : adminReview // ignore: cast_nullable_to_non_nullable
as AdminReviewEntity?,
  ));
}
/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaceMatchEntityCopyWith<$Res>? get faceMatch {
    if (_self.faceMatch == null) {
    return null;
  }

  return $FaceMatchEntityCopyWith<$Res>(_self.faceMatch!, (value) {
    return _then(_self.copyWith(faceMatch: value));
  });
}/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalDetailsEntityCopyWith<$Res>? get personalDetails {
    if (_self.personalDetails == null) {
    return null;
  }

  return $PersonalDetailsEntityCopyWith<$Res>(_self.personalDetails!, (value) {
    return _then(_self.copyWith(personalDetails: value));
  });
}/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentInfoEntityCopyWith<$Res>? get document {
    if (_self.document == null) {
    return null;
  }

  return $DocumentInfoEntityCopyWith<$Res>(_self.document!, (value) {
    return _then(_self.copyWith(document: value));
  });
}/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelfieEntityCopyWith<$Res>? get selfie {
    if (_self.selfie == null) {
    return null;
  }

  return $SelfieEntityCopyWith<$Res>(_self.selfie!, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminReviewEntityCopyWith<$Res>? get adminReview {
    if (_self.adminReview == null) {
    return null;
  }

  return $AdminReviewEntityCopyWith<$Res>(_self.adminReview!, (value) {
    return _then(_self.copyWith(adminReview: value));
  });
}
}


/// Adds pattern-matching-related methods to [SubmissionEntity].
extension SubmissionEntityPatterns on SubmissionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmissionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmissionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmissionEntity value)  $default,){
final _that = this;
switch (_that) {
case _SubmissionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmissionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SubmissionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int version,  String result,  List<CheckResultEntity>? checks,  FaceMatchEntity? faceMatch,  PersonalDetailsEntity? personalDetails,  DocumentInfoEntity? document,  SelfieEntity? selfie,  AdminReviewEntity? adminReview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmissionEntity() when $default != null:
return $default(_that.id,_that.version,_that.result,_that.checks,_that.faceMatch,_that.personalDetails,_that.document,_that.selfie,_that.adminReview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int version,  String result,  List<CheckResultEntity>? checks,  FaceMatchEntity? faceMatch,  PersonalDetailsEntity? personalDetails,  DocumentInfoEntity? document,  SelfieEntity? selfie,  AdminReviewEntity? adminReview)  $default,) {final _that = this;
switch (_that) {
case _SubmissionEntity():
return $default(_that.id,_that.version,_that.result,_that.checks,_that.faceMatch,_that.personalDetails,_that.document,_that.selfie,_that.adminReview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int version,  String result,  List<CheckResultEntity>? checks,  FaceMatchEntity? faceMatch,  PersonalDetailsEntity? personalDetails,  DocumentInfoEntity? document,  SelfieEntity? selfie,  AdminReviewEntity? adminReview)?  $default,) {final _that = this;
switch (_that) {
case _SubmissionEntity() when $default != null:
return $default(_that.id,_that.version,_that.result,_that.checks,_that.faceMatch,_that.personalDetails,_that.document,_that.selfie,_that.adminReview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmissionEntity implements SubmissionEntity {
  const _SubmissionEntity({required this.id, required this.version, required this.result,  List<CheckResultEntity>? checks, this.faceMatch, this.personalDetails, this.document, this.selfie, this.adminReview}): _checks = checks;
  factory _SubmissionEntity.fromJson(Map<String, dynamic> json) => _$SubmissionEntityFromJson(json);

@override final  String id;
@override final  int version;
@override final  String result;
 final  List<CheckResultEntity>? _checks;
@override List<CheckResultEntity>? get checks {
  final value = _checks;
  if (value == null) return null;
  if (_checks is EqualUnmodifiableListView) return _checks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  FaceMatchEntity? faceMatch;
@override final  PersonalDetailsEntity? personalDetails;
@override final  DocumentInfoEntity? document;
@override final  SelfieEntity? selfie;
@override final  AdminReviewEntity? adminReview;

/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionEntityCopyWith<_SubmissionEntity> get copyWith => __$SubmissionEntityCopyWithImpl<_SubmissionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.result, result) || other.result == result)&&const DeepCollectionEquality().equals(other.checks, _checks)&&(identical(other.faceMatch, faceMatch) || other.faceMatch == faceMatch)&&(identical(other.personalDetails, personalDetails) || other.personalDetails == personalDetails)&&(identical(other.document, document) || other.document == document)&&(identical(other.selfie, selfie) || other.selfie == selfie)&&(identical(other.adminReview, adminReview) || other.adminReview == adminReview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,version,result,const DeepCollectionEquality().hash(_checks),faceMatch,personalDetails,document,selfie,adminReview);
}

@override
String toString() {
    return 'SubmissionEntity(id: $id, version: $version, result: $result, checks: $checks, faceMatch: $faceMatch, personalDetails: $personalDetails, document: $document, selfie: $selfie, adminReview: $adminReview)';
}


}

/// @nodoc
abstract mixin class _$SubmissionEntityCopyWith<$Res> implements $SubmissionEntityCopyWith<$Res> {
  factory _$SubmissionEntityCopyWith(_SubmissionEntity value, $Res Function(_SubmissionEntity) _then) = __$SubmissionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, int version, String result, List<CheckResultEntity>? checks, FaceMatchEntity? faceMatch, PersonalDetailsEntity? personalDetails, DocumentInfoEntity? document, SelfieEntity? selfie, AdminReviewEntity? adminReview
});


@override $FaceMatchEntityCopyWith<$Res>? get faceMatch;@override $PersonalDetailsEntityCopyWith<$Res>? get personalDetails;@override $DocumentInfoEntityCopyWith<$Res>? get document;@override $SelfieEntityCopyWith<$Res>? get selfie;@override $AdminReviewEntityCopyWith<$Res>? get adminReview;

}
/// @nodoc
class __$SubmissionEntityCopyWithImpl<$Res>
    implements _$SubmissionEntityCopyWith<$Res> {
  __$SubmissionEntityCopyWithImpl(this._self, this._then);

  final _SubmissionEntity _self;
  final $Res Function(_SubmissionEntity) _then;

/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? version = null,Object? result = null,Object? checks = freezed,Object? faceMatch = freezed,Object? personalDetails = freezed,Object? document = freezed,Object? selfie = freezed,Object? adminReview = freezed,}) {
  return _then(_SubmissionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,checks: freezed == checks ? _self._checks : checks // ignore: cast_nullable_to_non_nullable
as List<CheckResultEntity>?,faceMatch: freezed == faceMatch ? _self.faceMatch : faceMatch // ignore: cast_nullable_to_non_nullable
as FaceMatchEntity?,personalDetails: freezed == personalDetails ? _self.personalDetails : personalDetails // ignore: cast_nullable_to_non_nullable
as PersonalDetailsEntity?,document: freezed == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as DocumentInfoEntity?,selfie: freezed == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as SelfieEntity?,adminReview: freezed == adminReview ? _self.adminReview : adminReview // ignore: cast_nullable_to_non_nullable
as AdminReviewEntity?,
  ));
}

/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FaceMatchEntityCopyWith<$Res>? get faceMatch {
    if (_self.faceMatch == null) {
    return null;
  }

  return $FaceMatchEntityCopyWith<$Res>(_self.faceMatch!, (value) {
    return _then(_self.copyWith(faceMatch: value));
  });
}/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalDetailsEntityCopyWith<$Res>? get personalDetails {
    if (_self.personalDetails == null) {
    return null;
  }

  return $PersonalDetailsEntityCopyWith<$Res>(_self.personalDetails!, (value) {
    return _then(_self.copyWith(personalDetails: value));
  });
}/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentInfoEntityCopyWith<$Res>? get document {
    if (_self.document == null) {
    return null;
  }

  return $DocumentInfoEntityCopyWith<$Res>(_self.document!, (value) {
    return _then(_self.copyWith(document: value));
  });
}/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelfieEntityCopyWith<$Res>? get selfie {
    if (_self.selfie == null) {
    return null;
  }

  return $SelfieEntityCopyWith<$Res>(_self.selfie!, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}/// Create a copy of SubmissionEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AdminReviewEntityCopyWith<$Res>? get adminReview {
    if (_self.adminReview == null) {
    return null;
  }

  return $AdminReviewEntityCopyWith<$Res>(_self.adminReview!, (value) {
    return _then(_self.copyWith(adminReview: value));
  });
}
}


/// @nodoc
mixin _$DraftEntity {

 PersonalDetailsEntity? get personalDetails; DocumentInfoEntity? get document; SelfieEntity? get selfie;
/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftEntityCopyWith<DraftEntity> get copyWith => _$DraftEntityCopyWithImpl<DraftEntity>(this as DraftEntity, _$identity);

  /// Serializes this DraftEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DraftEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftEntity&&(identical(other.personalDetails, _this.personalDetails) || other.personalDetails == _this.personalDetails)&&(identical(other.document, _this.document) || other.document == _this.document)&&(identical(other.selfie, _this.selfie) || other.selfie == _this.selfie));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DraftEntity;
  return Object.hash(runtimeType,_this.personalDetails,_this.document,_this.selfie);
}

@override
String toString() {
  final _this = this as DraftEntity;
  return 'DraftEntity(personalDetails: ${_this.personalDetails}, document: ${_this.document}, selfie: ${_this.selfie})';
}


}

/// @nodoc
abstract mixin class $DraftEntityCopyWith<$Res>  {
  factory $DraftEntityCopyWith(DraftEntity value, $Res Function(DraftEntity) _then) = _$DraftEntityCopyWithImpl;
@useResult
$Res call({
 PersonalDetailsEntity? personalDetails, DocumentInfoEntity? document, SelfieEntity? selfie
});


$PersonalDetailsEntityCopyWith<$Res>? get personalDetails;$DocumentInfoEntityCopyWith<$Res>? get document;$SelfieEntityCopyWith<$Res>? get selfie;

}
/// @nodoc
class _$DraftEntityCopyWithImpl<$Res>
    implements $DraftEntityCopyWith<$Res> {
  _$DraftEntityCopyWithImpl(this._self, this._then);

  final DraftEntity _self;
  final $Res Function(DraftEntity) _then;

/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? personalDetails = freezed,Object? document = freezed,Object? selfie = freezed,}) {
  return _then(DraftEntity(
personalDetails: freezed == personalDetails ? _self.personalDetails : personalDetails // ignore: cast_nullable_to_non_nullable
as PersonalDetailsEntity?,document: freezed == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as DocumentInfoEntity?,selfie: freezed == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as SelfieEntity?,
  ));
}
/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalDetailsEntityCopyWith<$Res>? get personalDetails {
    if (_self.personalDetails == null) {
    return null;
  }

  return $PersonalDetailsEntityCopyWith<$Res>(_self.personalDetails!, (value) {
    return _then(_self.copyWith(personalDetails: value));
  });
}/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentInfoEntityCopyWith<$Res>? get document {
    if (_self.document == null) {
    return null;
  }

  return $DocumentInfoEntityCopyWith<$Res>(_self.document!, (value) {
    return _then(_self.copyWith(document: value));
  });
}/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelfieEntityCopyWith<$Res>? get selfie {
    if (_self.selfie == null) {
    return null;
  }

  return $SelfieEntityCopyWith<$Res>(_self.selfie!, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}
}


/// Adds pattern-matching-related methods to [DraftEntity].
extension DraftEntityPatterns on DraftEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftEntity value)  $default,){
final _that = this;
switch (_that) {
case _DraftEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DraftEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PersonalDetailsEntity? personalDetails,  DocumentInfoEntity? document,  SelfieEntity? selfie)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftEntity() when $default != null:
return $default(_that.personalDetails,_that.document,_that.selfie);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PersonalDetailsEntity? personalDetails,  DocumentInfoEntity? document,  SelfieEntity? selfie)  $default,) {final _that = this;
switch (_that) {
case _DraftEntity():
return $default(_that.personalDetails,_that.document,_that.selfie);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PersonalDetailsEntity? personalDetails,  DocumentInfoEntity? document,  SelfieEntity? selfie)?  $default,) {final _that = this;
switch (_that) {
case _DraftEntity() when $default != null:
return $default(_that.personalDetails,_that.document,_that.selfie);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftEntity implements DraftEntity {
  const _DraftEntity({this.personalDetails, this.document, this.selfie});
  factory _DraftEntity.fromJson(Map<String, dynamic> json) => _$DraftEntityFromJson(json);

@override final  PersonalDetailsEntity? personalDetails;
@override final  DocumentInfoEntity? document;
@override final  SelfieEntity? selfie;

/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftEntityCopyWith<_DraftEntity> get copyWith => __$DraftEntityCopyWithImpl<_DraftEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftEntity&&(identical(other.personalDetails, personalDetails) || other.personalDetails == personalDetails)&&(identical(other.document, document) || other.document == document)&&(identical(other.selfie, selfie) || other.selfie == selfie));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,personalDetails,document,selfie);
}

@override
String toString() {
    return 'DraftEntity(personalDetails: $personalDetails, document: $document, selfie: $selfie)';
}


}

/// @nodoc
abstract mixin class _$DraftEntityCopyWith<$Res> implements $DraftEntityCopyWith<$Res> {
  factory _$DraftEntityCopyWith(_DraftEntity value, $Res Function(_DraftEntity) _then) = __$DraftEntityCopyWithImpl;
@override @useResult
$Res call({
 PersonalDetailsEntity? personalDetails, DocumentInfoEntity? document, SelfieEntity? selfie
});


@override $PersonalDetailsEntityCopyWith<$Res>? get personalDetails;@override $DocumentInfoEntityCopyWith<$Res>? get document;@override $SelfieEntityCopyWith<$Res>? get selfie;

}
/// @nodoc
class __$DraftEntityCopyWithImpl<$Res>
    implements _$DraftEntityCopyWith<$Res> {
  __$DraftEntityCopyWithImpl(this._self, this._then);

  final _DraftEntity _self;
  final $Res Function(_DraftEntity) _then;

/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? personalDetails = freezed,Object? document = freezed,Object? selfie = freezed,}) {
  return _then(_DraftEntity(
personalDetails: freezed == personalDetails ? _self.personalDetails : personalDetails // ignore: cast_nullable_to_non_nullable
as PersonalDetailsEntity?,document: freezed == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as DocumentInfoEntity?,selfie: freezed == selfie ? _self.selfie : selfie // ignore: cast_nullable_to_non_nullable
as SelfieEntity?,
  ));
}

/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PersonalDetailsEntityCopyWith<$Res>? get personalDetails {
    if (_self.personalDetails == null) {
    return null;
  }

  return $PersonalDetailsEntityCopyWith<$Res>(_self.personalDetails!, (value) {
    return _then(_self.copyWith(personalDetails: value));
  });
}/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DocumentInfoEntityCopyWith<$Res>? get document {
    if (_self.document == null) {
    return null;
  }

  return $DocumentInfoEntityCopyWith<$Res>(_self.document!, (value) {
    return _then(_self.copyWith(document: value));
  });
}/// Create a copy of DraftEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SelfieEntityCopyWith<$Res>? get selfie {
    if (_self.selfie == null) {
    return null;
  }

  return $SelfieEntityCopyWith<$Res>(_self.selfie!, (value) {
    return _then(_self.copyWith(selfie: value));
  });
}
}


/// @nodoc
mixin _$ApplicationEntity {

 String get id; String get status; int get currentStep; DraftEntity? get draft;
/// Create a copy of ApplicationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationEntityCopyWith<ApplicationEntity> get copyWith => _$ApplicationEntityCopyWithImpl<ApplicationEntity>(this as ApplicationEntity, _$identity);

  /// Serializes this ApplicationEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApplicationEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.currentStep, _this.currentStep) || other.currentStep == _this.currentStep)&&(identical(other.draft, _this.draft) || other.draft == _this.draft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApplicationEntity;
  return Object.hash(runtimeType,_this.id,_this.status,_this.currentStep,_this.draft);
}

@override
String toString() {
  final _this = this as ApplicationEntity;
  return 'ApplicationEntity(id: ${_this.id}, status: ${_this.status}, currentStep: ${_this.currentStep}, draft: ${_this.draft})';
}


}

/// @nodoc
abstract mixin class $ApplicationEntityCopyWith<$Res>  {
  factory $ApplicationEntityCopyWith(ApplicationEntity value, $Res Function(ApplicationEntity) _then) = _$ApplicationEntityCopyWithImpl;
@useResult
$Res call({
 String id, String status, int currentStep, DraftEntity? draft
});


$DraftEntityCopyWith<$Res>? get draft;

}
/// @nodoc
class _$ApplicationEntityCopyWithImpl<$Res>
    implements $ApplicationEntityCopyWith<$Res> {
  _$ApplicationEntityCopyWithImpl(this._self, this._then);

  final ApplicationEntity _self;
  final $Res Function(ApplicationEntity) _then;

/// Create a copy of ApplicationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? currentStep = null,Object? draft = freezed,}) {
  return _then(ApplicationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,draft: freezed == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftEntity?,
  ));
}
/// Create a copy of ApplicationEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DraftEntityCopyWith<$Res>? get draft {
    if (_self.draft == null) {
    return null;
  }

  return $DraftEntityCopyWith<$Res>(_self.draft!, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplicationEntity].
extension ApplicationEntityPatterns on ApplicationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationEntity value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status,  int currentStep,  DraftEntity? draft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationEntity() when $default != null:
return $default(_that.id,_that.status,_that.currentStep,_that.draft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status,  int currentStep,  DraftEntity? draft)  $default,) {final _that = this;
switch (_that) {
case _ApplicationEntity():
return $default(_that.id,_that.status,_that.currentStep,_that.draft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status,  int currentStep,  DraftEntity? draft)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationEntity() when $default != null:
return $default(_that.id,_that.status,_that.currentStep,_that.draft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplicationEntity implements ApplicationEntity {
  const _ApplicationEntity({required this.id, required this.status, required this.currentStep, this.draft});
  factory _ApplicationEntity.fromJson(Map<String, dynamic> json) => _$ApplicationEntityFromJson(json);

@override final  String id;
@override final  String status;
@override final  int currentStep;
@override final  DraftEntity? draft;

/// Create a copy of ApplicationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationEntityCopyWith<_ApplicationEntity> get copyWith => __$ApplicationEntityCopyWithImpl<_ApplicationEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicationEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.draft, draft) || other.draft == draft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,status,currentStep,draft);
}

@override
String toString() {
    return 'ApplicationEntity(id: $id, status: $status, currentStep: $currentStep, draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$ApplicationEntityCopyWith<$Res> implements $ApplicationEntityCopyWith<$Res> {
  factory _$ApplicationEntityCopyWith(_ApplicationEntity value, $Res Function(_ApplicationEntity) _then) = __$ApplicationEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String status, int currentStep, DraftEntity? draft
});


@override $DraftEntityCopyWith<$Res>? get draft;

}
/// @nodoc
class __$ApplicationEntityCopyWithImpl<$Res>
    implements _$ApplicationEntityCopyWith<$Res> {
  __$ApplicationEntityCopyWithImpl(this._self, this._then);

  final _ApplicationEntity _self;
  final $Res Function(_ApplicationEntity) _then;

/// Create a copy of ApplicationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? currentStep = null,Object? draft = freezed,}) {
  return _then(_ApplicationEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,draft: freezed == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftEntity?,
  ));
}

/// Create a copy of ApplicationEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DraftEntityCopyWith<$Res>? get draft {
    if (_self.draft == null) {
    return null;
  }

  return $DraftEntityCopyWith<$Res>(_self.draft!, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}


/// @nodoc
mixin _$SubmitResult {

 ApplicationEntity get application; SubmissionEntity get submission;
/// Create a copy of SubmitResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitResultCopyWith<SubmitResult> get copyWith => _$SubmitResultCopyWithImpl<SubmitResult>(this as SubmitResult, _$identity);

  /// Serializes this SubmitResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SubmitResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitResult&&(identical(other.application, _this.application) || other.application == _this.application)&&(identical(other.submission, _this.submission) || other.submission == _this.submission));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SubmitResult;
  return Object.hash(runtimeType,_this.application,_this.submission);
}

@override
String toString() {
  final _this = this as SubmitResult;
  return 'SubmitResult(application: ${_this.application}, submission: ${_this.submission})';
}


}

/// @nodoc
abstract mixin class $SubmitResultCopyWith<$Res>  {
  factory $SubmitResultCopyWith(SubmitResult value, $Res Function(SubmitResult) _then) = _$SubmitResultCopyWithImpl;
@useResult
$Res call({
 ApplicationEntity application, SubmissionEntity submission
});


$ApplicationEntityCopyWith<$Res> get application;$SubmissionEntityCopyWith<$Res> get submission;

}
/// @nodoc
class _$SubmitResultCopyWithImpl<$Res>
    implements $SubmitResultCopyWith<$Res> {
  _$SubmitResultCopyWithImpl(this._self, this._then);

  final SubmitResult _self;
  final $Res Function(SubmitResult) _then;

/// Create a copy of SubmitResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? application = null,Object? submission = null,}) {
  return _then(SubmitResult(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as ApplicationEntity,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionEntity,
  ));
}
/// Create a copy of SubmitResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationEntityCopyWith<$Res> get application {
  
  return $ApplicationEntityCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}/// Create a copy of SubmitResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionEntityCopyWith<$Res> get submission {
  
  return $SubmissionEntityCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}


/// Adds pattern-matching-related methods to [SubmitResult].
extension SubmitResultPatterns on SubmitResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitResult value)  $default,){
final _that = this;
switch (_that) {
case _SubmitResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitResult value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ApplicationEntity application,  SubmissionEntity submission)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitResult() when $default != null:
return $default(_that.application,_that.submission);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ApplicationEntity application,  SubmissionEntity submission)  $default,) {final _that = this;
switch (_that) {
case _SubmitResult():
return $default(_that.application,_that.submission);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ApplicationEntity application,  SubmissionEntity submission)?  $default,) {final _that = this;
switch (_that) {
case _SubmitResult() when $default != null:
return $default(_that.application,_that.submission);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitResult implements SubmitResult {
  const _SubmitResult({required this.application, required this.submission});
  factory _SubmitResult.fromJson(Map<String, dynamic> json) => _$SubmitResultFromJson(json);

@override final  ApplicationEntity application;
@override final  SubmissionEntity submission;

/// Create a copy of SubmitResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitResultCopyWith<_SubmitResult> get copyWith => __$SubmitResultCopyWithImpl<_SubmitResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitResult&&(identical(other.application, application) || other.application == application)&&(identical(other.submission, submission) || other.submission == submission));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,application,submission);
}

@override
String toString() {
    return 'SubmitResult(application: $application, submission: $submission)';
}


}

/// @nodoc
abstract mixin class _$SubmitResultCopyWith<$Res> implements $SubmitResultCopyWith<$Res> {
  factory _$SubmitResultCopyWith(_SubmitResult value, $Res Function(_SubmitResult) _then) = __$SubmitResultCopyWithImpl;
@override @useResult
$Res call({
 ApplicationEntity application, SubmissionEntity submission
});


@override $ApplicationEntityCopyWith<$Res> get application;@override $SubmissionEntityCopyWith<$Res> get submission;

}
/// @nodoc
class __$SubmitResultCopyWithImpl<$Res>
    implements _$SubmitResultCopyWith<$Res> {
  __$SubmitResultCopyWithImpl(this._self, this._then);

  final _SubmitResult _self;
  final $Res Function(_SubmitResult) _then;

/// Create a copy of SubmitResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? application = null,Object? submission = null,}) {
  return _then(_SubmitResult(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as ApplicationEntity,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as SubmissionEntity,
  ));
}

/// Create a copy of SubmitResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationEntityCopyWith<$Res> get application {
  
  return $ApplicationEntityCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}/// Create a copy of SubmitResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionEntityCopyWith<$Res> get submission {
  
  return $SubmissionEntityCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}
}

// dart format on
