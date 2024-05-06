// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FlowState flowState) loading,
    required TResult Function(UserDataModelResponse data) success,
    required TResult Function(FlowState flowState) error,
    required TResult Function(File imagePath) imagePath,
    required TResult Function(T showPassword) showPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(FlowState flowState)? loading,
    TResult? Function(UserDataModelResponse data)? success,
    TResult? Function(FlowState flowState)? error,
    TResult? Function(File imagePath)? imagePath,
    TResult? Function(T showPassword)? showPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FlowState flowState)? loading,
    TResult Function(UserDataModelResponse data)? success,
    TResult Function(FlowState flowState)? error,
    TResult Function(File imagePath)? imagePath,
    TResult Function(T showPassword)? showPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagePath<T> value) imagePath,
    required TResult Function(ShowPassword<T> value) showPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagePath<T> value)? imagePath,
    TResult? Function(ShowPassword<T> value)? showPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagePath<T> value)? imagePath,
    TResult Function(ShowPassword<T> value)? showPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<T, $Res> {
  factory $ProfileStateCopyWith(
          ProfileState<T> value, $Res Function(ProfileState<T>) then) =
      _$ProfileStateCopyWithImpl<T, $Res, ProfileState<T>>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<T, $Res, $Val extends ProfileState<T>>
    implements $ProfileStateCopyWith<T, $Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProfileState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FlowState flowState) loading,
    required TResult Function(UserDataModelResponse data) success,
    required TResult Function(FlowState flowState) error,
    required TResult Function(File imagePath) imagePath,
    required TResult Function(T showPassword) showPassword,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(FlowState flowState)? loading,
    TResult? Function(UserDataModelResponse data)? success,
    TResult? Function(FlowState flowState)? error,
    TResult? Function(File imagePath)? imagePath,
    TResult? Function(T showPassword)? showPassword,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FlowState flowState)? loading,
    TResult Function(UserDataModelResponse data)? success,
    TResult Function(FlowState flowState)? error,
    TResult Function(File imagePath)? imagePath,
    TResult Function(T showPassword)? showPassword,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagePath<T> value) imagePath,
    required TResult Function(ShowPassword<T> value) showPassword,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagePath<T> value)? imagePath,
    TResult? Function(ShowPassword<T> value)? showPassword,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagePath<T> value)? imagePath,
    TResult Function(ShowPassword<T> value)? showPassword,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ProfileState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({FlowState flowState});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowState = null,
  }) {
    return _then(_$LoadingImpl<T>(
      null == flowState
          ? _value.flowState
          : flowState // ignore: cast_nullable_to_non_nullable
              as FlowState,
    ));
  }
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl(this.flowState);

  @override
  final FlowState flowState;

  @override
  String toString() {
    return 'ProfileState<$T>.loading(flowState: $flowState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl<T> &&
            (identical(other.flowState, flowState) ||
                other.flowState == flowState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<T, _$LoadingImpl<T>> get copyWith =>
      __$$LoadingImplCopyWithImpl<T, _$LoadingImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FlowState flowState) loading,
    required TResult Function(UserDataModelResponse data) success,
    required TResult Function(FlowState flowState) error,
    required TResult Function(File imagePath) imagePath,
    required TResult Function(T showPassword) showPassword,
  }) {
    return loading(flowState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(FlowState flowState)? loading,
    TResult? Function(UserDataModelResponse data)? success,
    TResult? Function(FlowState flowState)? error,
    TResult? Function(File imagePath)? imagePath,
    TResult? Function(T showPassword)? showPassword,
  }) {
    return loading?.call(flowState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FlowState flowState)? loading,
    TResult Function(UserDataModelResponse data)? success,
    TResult Function(FlowState flowState)? error,
    TResult Function(File imagePath)? imagePath,
    TResult Function(T showPassword)? showPassword,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(flowState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagePath<T> value) imagePath,
    required TResult Function(ShowPassword<T> value) showPassword,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagePath<T> value)? imagePath,
    TResult? Function(ShowPassword<T> value)? showPassword,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagePath<T> value)? imagePath,
    TResult Function(ShowPassword<T> value)? showPassword,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements ProfileState<T> {
  const factory Loading(final FlowState flowState) = _$LoadingImpl<T>;

  FlowState get flowState;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<T, _$LoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<T, $Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl<T> value, $Res Function(_$SuccessImpl<T>) then) =
      __$$SuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({UserDataModelResponse data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$SuccessImpl<T>>
    implements _$$SuccessImplCopyWith<T, $Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl<T> _value, $Res Function(_$SuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SuccessImpl<T>(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserDataModelResponse,
    ));
  }
}

/// @nodoc

class _$SuccessImpl<T> implements Success<T> {
  const _$SuccessImpl(this.data);

  @override
  final UserDataModelResponse data;

  @override
  String toString() {
    return 'ProfileState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl<T> &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      __$$SuccessImplCopyWithImpl<T, _$SuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FlowState flowState) loading,
    required TResult Function(UserDataModelResponse data) success,
    required TResult Function(FlowState flowState) error,
    required TResult Function(File imagePath) imagePath,
    required TResult Function(T showPassword) showPassword,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(FlowState flowState)? loading,
    TResult? Function(UserDataModelResponse data)? success,
    TResult? Function(FlowState flowState)? error,
    TResult? Function(File imagePath)? imagePath,
    TResult? Function(T showPassword)? showPassword,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FlowState flowState)? loading,
    TResult Function(UserDataModelResponse data)? success,
    TResult Function(FlowState flowState)? error,
    TResult Function(File imagePath)? imagePath,
    TResult Function(T showPassword)? showPassword,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagePath<T> value) imagePath,
    required TResult Function(ShowPassword<T> value) showPassword,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagePath<T> value)? imagePath,
    TResult? Function(ShowPassword<T> value)? showPassword,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagePath<T> value)? imagePath,
    TResult Function(ShowPassword<T> value)? showPassword,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements ProfileState<T> {
  const factory Success(final UserDataModelResponse data) = _$SuccessImpl<T>;

  UserDataModelResponse get data;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<T, _$SuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({FlowState flowState});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flowState = null,
  }) {
    return _then(_$ErrorImpl<T>(
      null == flowState
          ? _value.flowState
          : flowState // ignore: cast_nullable_to_non_nullable
              as FlowState,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl(this.flowState);

  @override
  final FlowState flowState;

  @override
  String toString() {
    return 'ProfileState<$T>.error(flowState: $flowState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.flowState, flowState) ||
                other.flowState == flowState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flowState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FlowState flowState) loading,
    required TResult Function(UserDataModelResponse data) success,
    required TResult Function(FlowState flowState) error,
    required TResult Function(File imagePath) imagePath,
    required TResult Function(T showPassword) showPassword,
  }) {
    return error(flowState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(FlowState flowState)? loading,
    TResult? Function(UserDataModelResponse data)? success,
    TResult? Function(FlowState flowState)? error,
    TResult? Function(File imagePath)? imagePath,
    TResult? Function(T showPassword)? showPassword,
  }) {
    return error?.call(flowState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FlowState flowState)? loading,
    TResult Function(UserDataModelResponse data)? success,
    TResult Function(FlowState flowState)? error,
    TResult Function(File imagePath)? imagePath,
    TResult Function(T showPassword)? showPassword,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(flowState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagePath<T> value) imagePath,
    required TResult Function(ShowPassword<T> value) showPassword,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagePath<T> value)? imagePath,
    TResult? Function(ShowPassword<T> value)? showPassword,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagePath<T> value)? imagePath,
    TResult Function(ShowPassword<T> value)? showPassword,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements ProfileState<T> {
  const factory Error(final FlowState flowState) = _$ErrorImpl<T>;

  FlowState get flowState;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImagePathImplCopyWith<T, $Res> {
  factory _$$ImagePathImplCopyWith(
          _$ImagePathImpl<T> value, $Res Function(_$ImagePathImpl<T>) then) =
      __$$ImagePathImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({File imagePath});
}

/// @nodoc
class __$$ImagePathImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$ImagePathImpl<T>>
    implements _$$ImagePathImplCopyWith<T, $Res> {
  __$$ImagePathImplCopyWithImpl(
      _$ImagePathImpl<T> _value, $Res Function(_$ImagePathImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePath = null,
  }) {
    return _then(_$ImagePathImpl<T>(
      null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$ImagePathImpl<T> implements ImagePath<T> {
  const _$ImagePathImpl(this.imagePath);

  @override
  final File imagePath;

  @override
  String toString() {
    return 'ProfileState<$T>.imagePath(imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagePathImpl<T> &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagePathImplCopyWith<T, _$ImagePathImpl<T>> get copyWith =>
      __$$ImagePathImplCopyWithImpl<T, _$ImagePathImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FlowState flowState) loading,
    required TResult Function(UserDataModelResponse data) success,
    required TResult Function(FlowState flowState) error,
    required TResult Function(File imagePath) imagePath,
    required TResult Function(T showPassword) showPassword,
  }) {
    return imagePath(this.imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(FlowState flowState)? loading,
    TResult? Function(UserDataModelResponse data)? success,
    TResult? Function(FlowState flowState)? error,
    TResult? Function(File imagePath)? imagePath,
    TResult? Function(T showPassword)? showPassword,
  }) {
    return imagePath?.call(this.imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FlowState flowState)? loading,
    TResult Function(UserDataModelResponse data)? success,
    TResult Function(FlowState flowState)? error,
    TResult Function(File imagePath)? imagePath,
    TResult Function(T showPassword)? showPassword,
    required TResult orElse(),
  }) {
    if (imagePath != null) {
      return imagePath(this.imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagePath<T> value) imagePath,
    required TResult Function(ShowPassword<T> value) showPassword,
  }) {
    return imagePath(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagePath<T> value)? imagePath,
    TResult? Function(ShowPassword<T> value)? showPassword,
  }) {
    return imagePath?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagePath<T> value)? imagePath,
    TResult Function(ShowPassword<T> value)? showPassword,
    required TResult orElse(),
  }) {
    if (imagePath != null) {
      return imagePath(this);
    }
    return orElse();
  }
}

abstract class ImagePath<T> implements ProfileState<T> {
  const factory ImagePath(final File imagePath) = _$ImagePathImpl<T>;

  File get imagePath;
  @JsonKey(ignore: true)
  _$$ImagePathImplCopyWith<T, _$ImagePathImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowPasswordImplCopyWith<T, $Res> {
  factory _$$ShowPasswordImplCopyWith(_$ShowPasswordImpl<T> value,
          $Res Function(_$ShowPasswordImpl<T>) then) =
      __$$ShowPasswordImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T showPassword});
}

/// @nodoc
class __$$ShowPasswordImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$ShowPasswordImpl<T>>
    implements _$$ShowPasswordImplCopyWith<T, $Res> {
  __$$ShowPasswordImplCopyWithImpl(
      _$ShowPasswordImpl<T> _value, $Res Function(_$ShowPasswordImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showPassword = freezed,
  }) {
    return _then(_$ShowPasswordImpl<T>(
      freezed == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ShowPasswordImpl<T> implements ShowPassword<T> {
  const _$ShowPasswordImpl(this.showPassword);

  @override
  final T showPassword;

  @override
  String toString() {
    return 'ProfileState<$T>.showPassword(showPassword: $showPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowPasswordImpl<T> &&
            const DeepCollectionEquality()
                .equals(other.showPassword, showPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(showPassword));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowPasswordImplCopyWith<T, _$ShowPasswordImpl<T>> get copyWith =>
      __$$ShowPasswordImplCopyWithImpl<T, _$ShowPasswordImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(FlowState flowState) loading,
    required TResult Function(UserDataModelResponse data) success,
    required TResult Function(FlowState flowState) error,
    required TResult Function(File imagePath) imagePath,
    required TResult Function(T showPassword) showPassword,
  }) {
    return showPassword(this.showPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(FlowState flowState)? loading,
    TResult? Function(UserDataModelResponse data)? success,
    TResult? Function(FlowState flowState)? error,
    TResult? Function(File imagePath)? imagePath,
    TResult? Function(T showPassword)? showPassword,
  }) {
    return showPassword?.call(this.showPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(FlowState flowState)? loading,
    TResult Function(UserDataModelResponse data)? success,
    TResult Function(FlowState flowState)? error,
    TResult Function(File imagePath)? imagePath,
    TResult Function(T showPassword)? showPassword,
    required TResult orElse(),
  }) {
    if (showPassword != null) {
      return showPassword(this.showPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(ImagePath<T> value) imagePath,
    required TResult Function(ShowPassword<T> value) showPassword,
  }) {
    return showPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(ImagePath<T> value)? imagePath,
    TResult? Function(ShowPassword<T> value)? showPassword,
  }) {
    return showPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(ImagePath<T> value)? imagePath,
    TResult Function(ShowPassword<T> value)? showPassword,
    required TResult orElse(),
  }) {
    if (showPassword != null) {
      return showPassword(this);
    }
    return orElse();
  }
}

abstract class ShowPassword<T> implements ProfileState<T> {
  const factory ShowPassword(final T showPassword) = _$ShowPasswordImpl<T>;

  T get showPassword;
  @JsonKey(ignore: true)
  _$$ShowPasswordImplCopyWith<T, _$ShowPasswordImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
