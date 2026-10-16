// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KycState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is KycState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'KycState()';
}


}

/// @nodoc
class $KycStateCopyWith<$Res>  {
$KycStateCopyWith(KycState _, $Res Function(KycState) __);
}


/// Adds pattern-matching-related methods to [KycState].
extension KycStatePatterns on KycState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( KycLoading value)?  loading,TResult Function( KycLoaded value)?  loaded,TResult Function( KycError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case KycLoading() when loading != null:
return loading(_that);case KycLoaded() when loaded != null:
return loaded(_that);case KycError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( KycLoading value)  loading,required TResult Function( KycLoaded value)  loaded,required TResult Function( KycError value)  error,}){
final _that = this;
switch (_that) {
case KycLoading():
return loading(_that);case KycLoaded():
return loaded(_that);case KycError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( KycLoading value)?  loading,TResult? Function( KycLoaded value)?  loaded,TResult? Function( KycError value)?  error,}){
final _that = this;
switch (_that) {
case KycLoading() when loading != null:
return loading(_that);case KycLoaded() when loaded != null:
return loaded(_that);case KycError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( ApplicationEntity application,  SubmissionEntity? latestSubmission)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case KycLoading() when loading != null:
return loading();case KycLoaded() when loaded != null:
return loaded(_that.application,_that.latestSubmission);case KycError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( ApplicationEntity application,  SubmissionEntity? latestSubmission)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case KycLoading():
return loading();case KycLoaded():
return loaded(_that.application,_that.latestSubmission);case KycError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( ApplicationEntity application,  SubmissionEntity? latestSubmission)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case KycLoading() when loading != null:
return loading();case KycLoaded() when loaded != null:
return loaded(_that.application,_that.latestSubmission);case KycError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class KycLoading implements KycState {
  const KycLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is KycLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'KycState.loading()';
}


}




/// @nodoc


class KycLoaded implements KycState {
  const KycLoaded({required this.application, this.latestSubmission});
  

 final  ApplicationEntity application;
 final  SubmissionEntity? latestSubmission;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KycLoadedCopyWith<KycLoaded> get copyWith => _$KycLoadedCopyWithImpl<KycLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is KycLoaded&&(identical(other.application, application) || other.application == application)&&(identical(other.latestSubmission, latestSubmission) || other.latestSubmission == latestSubmission));
}


@override
int get hashCode {
    return Object.hash(runtimeType,application,latestSubmission);
}

@override
String toString() {
    return 'KycState.loaded(application: $application, latestSubmission: $latestSubmission)';
}


}

/// @nodoc
abstract mixin class $KycLoadedCopyWith<$Res> implements $KycStateCopyWith<$Res> {
  factory $KycLoadedCopyWith(KycLoaded value, $Res Function(KycLoaded) _then) = _$KycLoadedCopyWithImpl;
@useResult
$Res call({
 ApplicationEntity application, SubmissionEntity? latestSubmission
});


$ApplicationEntityCopyWith<$Res> get application;$SubmissionEntityCopyWith<$Res>? get latestSubmission;

}
/// @nodoc
class _$KycLoadedCopyWithImpl<$Res>
    implements $KycLoadedCopyWith<$Res> {
  _$KycLoadedCopyWithImpl(this._self, this._then);

  final KycLoaded _self;
  final $Res Function(KycLoaded) _then;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? application = null,Object? latestSubmission = freezed,}) {
  return _then(KycLoaded(
application: null == application ? _self.application : application // ignore: cast_nullable_to_non_nullable
as ApplicationEntity,latestSubmission: freezed == latestSubmission ? _self.latestSubmission : latestSubmission // ignore: cast_nullable_to_non_nullable
as SubmissionEntity?,
  ));
}

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationEntityCopyWith<$Res> get application {
  
  return $ApplicationEntityCopyWith<$Res>(_self.application, (value) {
    return _then(_self.copyWith(application: value));
  });
}/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionEntityCopyWith<$Res>? get latestSubmission {
    if (_self.latestSubmission == null) {
    return null;
  }

  return $SubmissionEntityCopyWith<$Res>(_self.latestSubmission!, (value) {
    return _then(_self.copyWith(latestSubmission: value));
  });
}
}

/// @nodoc


class KycError implements KycState {
  const KycError(this.message);
  

 final  String message;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KycErrorCopyWith<KycError> get copyWith => _$KycErrorCopyWithImpl<KycError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is KycError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'KycState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $KycErrorCopyWith<$Res> implements $KycStateCopyWith<$Res> {
  factory $KycErrorCopyWith(KycError value, $Res Function(KycError) _then) = _$KycErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$KycErrorCopyWithImpl<$Res>
    implements $KycErrorCopyWith<$Res> {
  _$KycErrorCopyWithImpl(this._self, this._then);

  final KycError _self;
  final $Res Function(KycError) _then;

/// Create a copy of KycState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(KycError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
