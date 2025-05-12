// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listenable_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListenableStatus {
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String message) success,
    required TResult Function(String title, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String message)? success,
    TResult? Function(String title, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String message)? success,
    TResult Function(String title, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListenSuccess value) success,
    required TResult Function(ListenError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListenSuccess value)? success,
    TResult? Function(ListenError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListenSuccess value)? success,
    TResult Function(ListenError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListenableStatusCopyWith<ListenableStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListenableStatusCopyWith<$Res> {
  factory $ListenableStatusCopyWith(
          ListenableStatus value, $Res Function(ListenableStatus) then) =
      _$ListenableStatusCopyWithImpl<$Res, ListenableStatus>;
  @useResult
  $Res call({String title, String message});
}

/// @nodoc
class _$ListenableStatusCopyWithImpl<$Res, $Val extends ListenableStatus>
    implements $ListenableStatusCopyWith<$Res> {
  _$ListenableStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListenSuccessImplCopyWith<$Res>
    implements $ListenableStatusCopyWith<$Res> {
  factory _$$ListenSuccessImplCopyWith(
          _$ListenSuccessImpl value, $Res Function(_$ListenSuccessImpl) then) =
      __$$ListenSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message});
}

/// @nodoc
class __$$ListenSuccessImplCopyWithImpl<$Res>
    extends _$ListenableStatusCopyWithImpl<$Res, _$ListenSuccessImpl>
    implements _$$ListenSuccessImplCopyWith<$Res> {
  __$$ListenSuccessImplCopyWithImpl(
      _$ListenSuccessImpl _value, $Res Function(_$ListenSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$ListenSuccessImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ListenSuccessImpl implements ListenSuccess {
  const _$ListenSuccessImpl(this.title, this.message);

  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'ListenableStatus.success(title: $title, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListenSuccessImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListenSuccessImplCopyWith<_$ListenSuccessImpl> get copyWith =>
      __$$ListenSuccessImplCopyWithImpl<_$ListenSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String message) success,
    required TResult Function(String title, String message) error,
  }) {
    return success(title, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String message)? success,
    TResult? Function(String title, String message)? error,
  }) {
    return success?.call(title, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String message)? success,
    TResult Function(String title, String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(title, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListenSuccess value) success,
    required TResult Function(ListenError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListenSuccess value)? success,
    TResult? Function(ListenError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListenSuccess value)? success,
    TResult Function(ListenError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ListenSuccess implements ListenableStatus {
  const factory ListenSuccess(final String title, final String message) =
      _$ListenSuccessImpl;

  @override
  String get title;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ListenSuccessImplCopyWith<_$ListenSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ListenErrorImplCopyWith<$Res>
    implements $ListenableStatusCopyWith<$Res> {
  factory _$$ListenErrorImplCopyWith(
          _$ListenErrorImpl value, $Res Function(_$ListenErrorImpl) then) =
      __$$ListenErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message});
}

/// @nodoc
class __$$ListenErrorImplCopyWithImpl<$Res>
    extends _$ListenableStatusCopyWithImpl<$Res, _$ListenErrorImpl>
    implements _$$ListenErrorImplCopyWith<$Res> {
  __$$ListenErrorImplCopyWithImpl(
      _$ListenErrorImpl _value, $Res Function(_$ListenErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
  }) {
    return _then(_$ListenErrorImpl(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ListenErrorImpl implements ListenError {
  const _$ListenErrorImpl(this.title, this.message);

  @override
  final String title;
  @override
  final String message;

  @override
  String toString() {
    return 'ListenableStatus.error(title: $title, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListenErrorImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListenErrorImplCopyWith<_$ListenErrorImpl> get copyWith =>
      __$$ListenErrorImplCopyWithImpl<_$ListenErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title, String message) success,
    required TResult Function(String title, String message) error,
  }) {
    return error(title, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title, String message)? success,
    TResult? Function(String title, String message)? error,
  }) {
    return error?.call(title, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title, String message)? success,
    TResult Function(String title, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(title, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ListenSuccess value) success,
    required TResult Function(ListenError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ListenSuccess value)? success,
    TResult? Function(ListenError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ListenSuccess value)? success,
    TResult Function(ListenError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ListenError implements ListenableStatus {
  const factory ListenError(final String title, final String message) =
      _$ListenErrorImpl;

  @override
  String get title;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ListenErrorImplCopyWith<_$ListenErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
