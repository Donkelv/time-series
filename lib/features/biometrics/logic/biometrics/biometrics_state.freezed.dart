// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometrics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$BiometricsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BiometricsModel> data) successful,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BiometricsModel> data)? successful,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BiometricsModel> data)? successful,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure? error)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BiometricsSuccessfulState value) successful,
    required TResult Function(BiometricsEmptyState value) empty,
    required TResult Function(BiometricsInitialState value) initial,
    required TResult Function(BiometricsLoadingState value) loading,
    required TResult Function(BiometricsErrorState value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiometricsSuccessfulState value)? successful,
    TResult? Function(BiometricsEmptyState value)? empty,
    TResult? Function(BiometricsInitialState value)? initial,
    TResult? Function(BiometricsLoadingState value)? loading,
    TResult? Function(BiometricsErrorState value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiometricsSuccessfulState value)? successful,
    TResult Function(BiometricsEmptyState value)? empty,
    TResult Function(BiometricsInitialState value)? initial,
    TResult Function(BiometricsLoadingState value)? loading,
    TResult Function(BiometricsErrorState value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricsStateCopyWith<$Res> {
  factory $BiometricsStateCopyWith(
    BiometricsState value,
    $Res Function(BiometricsState) then,
  ) = _$BiometricsStateCopyWithImpl<$Res, BiometricsState>;
}

/// @nodoc
class _$BiometricsStateCopyWithImpl<$Res, $Val extends BiometricsState>
    implements $BiometricsStateCopyWith<$Res> {
  _$BiometricsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BiometricsSuccessfulStateImplCopyWith<$Res> {
  factory _$$BiometricsSuccessfulStateImplCopyWith(
    _$BiometricsSuccessfulStateImpl value,
    $Res Function(_$BiometricsSuccessfulStateImpl) then,
  ) = __$$BiometricsSuccessfulStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BiometricsModel> data});
}

/// @nodoc
class __$$BiometricsSuccessfulStateImplCopyWithImpl<$Res>
    extends _$BiometricsStateCopyWithImpl<$Res, _$BiometricsSuccessfulStateImpl>
    implements _$$BiometricsSuccessfulStateImplCopyWith<$Res> {
  __$$BiometricsSuccessfulStateImplCopyWithImpl(
    _$BiometricsSuccessfulStateImpl _value,
    $Res Function(_$BiometricsSuccessfulStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$BiometricsSuccessfulStateImpl(
        null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                as List<BiometricsModel>,
      ),
    );
  }
}

/// @nodoc

class _$BiometricsSuccessfulStateImpl implements BiometricsSuccessfulState {
  const _$BiometricsSuccessfulStateImpl(final List<BiometricsModel> data)
    : _data = data;

  final List<BiometricsModel> _data;
  @override
  List<BiometricsModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BiometricsState.successful(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricsSuccessfulStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricsSuccessfulStateImplCopyWith<_$BiometricsSuccessfulStateImpl>
  get copyWith => __$$BiometricsSuccessfulStateImplCopyWithImpl<
    _$BiometricsSuccessfulStateImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BiometricsModel> data) successful,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return successful(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BiometricsModel> data)? successful,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return successful?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BiometricsModel> data)? successful,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure? error)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BiometricsSuccessfulState value) successful,
    required TResult Function(BiometricsEmptyState value) empty,
    required TResult Function(BiometricsInitialState value) initial,
    required TResult Function(BiometricsLoadingState value) loading,
    required TResult Function(BiometricsErrorState value) error,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiometricsSuccessfulState value)? successful,
    TResult? Function(BiometricsEmptyState value)? empty,
    TResult? Function(BiometricsInitialState value)? initial,
    TResult? Function(BiometricsLoadingState value)? loading,
    TResult? Function(BiometricsErrorState value)? error,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiometricsSuccessfulState value)? successful,
    TResult Function(BiometricsEmptyState value)? empty,
    TResult Function(BiometricsInitialState value)? initial,
    TResult Function(BiometricsLoadingState value)? loading,
    TResult Function(BiometricsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class BiometricsSuccessfulState implements BiometricsState {
  const factory BiometricsSuccessfulState(final List<BiometricsModel> data) =
      _$BiometricsSuccessfulStateImpl;

  List<BiometricsModel> get data;

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricsSuccessfulStateImplCopyWith<_$BiometricsSuccessfulStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BiometricsEmptyStateImplCopyWith<$Res> {
  factory _$$BiometricsEmptyStateImplCopyWith(
    _$BiometricsEmptyStateImpl value,
    $Res Function(_$BiometricsEmptyStateImpl) then,
  ) = __$$BiometricsEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BiometricsEmptyStateImplCopyWithImpl<$Res>
    extends _$BiometricsStateCopyWithImpl<$Res, _$BiometricsEmptyStateImpl>
    implements _$$BiometricsEmptyStateImplCopyWith<$Res> {
  __$$BiometricsEmptyStateImplCopyWithImpl(
    _$BiometricsEmptyStateImpl _value,
    $Res Function(_$BiometricsEmptyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BiometricsEmptyStateImpl implements BiometricsEmptyState {
  const _$BiometricsEmptyStateImpl();

  @override
  String toString() {
    return 'BiometricsState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricsEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BiometricsModel> data) successful,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BiometricsModel> data)? successful,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BiometricsModel> data)? successful,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure? error)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BiometricsSuccessfulState value) successful,
    required TResult Function(BiometricsEmptyState value) empty,
    required TResult Function(BiometricsInitialState value) initial,
    required TResult Function(BiometricsLoadingState value) loading,
    required TResult Function(BiometricsErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiometricsSuccessfulState value)? successful,
    TResult? Function(BiometricsEmptyState value)? empty,
    TResult? Function(BiometricsInitialState value)? initial,
    TResult? Function(BiometricsLoadingState value)? loading,
    TResult? Function(BiometricsErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiometricsSuccessfulState value)? successful,
    TResult Function(BiometricsEmptyState value)? empty,
    TResult Function(BiometricsInitialState value)? initial,
    TResult Function(BiometricsLoadingState value)? loading,
    TResult Function(BiometricsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class BiometricsEmptyState implements BiometricsState {
  const factory BiometricsEmptyState() = _$BiometricsEmptyStateImpl;
}

/// @nodoc
abstract class _$$BiometricsInitialStateImplCopyWith<$Res> {
  factory _$$BiometricsInitialStateImplCopyWith(
    _$BiometricsInitialStateImpl value,
    $Res Function(_$BiometricsInitialStateImpl) then,
  ) = __$$BiometricsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BiometricsInitialStateImplCopyWithImpl<$Res>
    extends _$BiometricsStateCopyWithImpl<$Res, _$BiometricsInitialStateImpl>
    implements _$$BiometricsInitialStateImplCopyWith<$Res> {
  __$$BiometricsInitialStateImplCopyWithImpl(
    _$BiometricsInitialStateImpl _value,
    $Res Function(_$BiometricsInitialStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BiometricsInitialStateImpl implements BiometricsInitialState {
  const _$BiometricsInitialStateImpl();

  @override
  String toString() {
    return 'BiometricsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BiometricsModel> data) successful,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BiometricsModel> data)? successful,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BiometricsModel> data)? successful,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure? error)? error,
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
    required TResult Function(BiometricsSuccessfulState value) successful,
    required TResult Function(BiometricsEmptyState value) empty,
    required TResult Function(BiometricsInitialState value) initial,
    required TResult Function(BiometricsLoadingState value) loading,
    required TResult Function(BiometricsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiometricsSuccessfulState value)? successful,
    TResult? Function(BiometricsEmptyState value)? empty,
    TResult? Function(BiometricsInitialState value)? initial,
    TResult? Function(BiometricsLoadingState value)? loading,
    TResult? Function(BiometricsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiometricsSuccessfulState value)? successful,
    TResult Function(BiometricsEmptyState value)? empty,
    TResult Function(BiometricsInitialState value)? initial,
    TResult Function(BiometricsLoadingState value)? loading,
    TResult Function(BiometricsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BiometricsInitialState implements BiometricsState {
  const factory BiometricsInitialState() = _$BiometricsInitialStateImpl;
}

/// @nodoc
abstract class _$$BiometricsLoadingStateImplCopyWith<$Res> {
  factory _$$BiometricsLoadingStateImplCopyWith(
    _$BiometricsLoadingStateImpl value,
    $Res Function(_$BiometricsLoadingStateImpl) then,
  ) = __$$BiometricsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BiometricsLoadingStateImplCopyWithImpl<$Res>
    extends _$BiometricsStateCopyWithImpl<$Res, _$BiometricsLoadingStateImpl>
    implements _$$BiometricsLoadingStateImplCopyWith<$Res> {
  __$$BiometricsLoadingStateImplCopyWithImpl(
    _$BiometricsLoadingStateImpl _value,
    $Res Function(_$BiometricsLoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BiometricsLoadingStateImpl implements BiometricsLoadingState {
  const _$BiometricsLoadingStateImpl();

  @override
  String toString() {
    return 'BiometricsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BiometricsModel> data) successful,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BiometricsModel> data)? successful,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BiometricsModel> data)? successful,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BiometricsSuccessfulState value) successful,
    required TResult Function(BiometricsEmptyState value) empty,
    required TResult Function(BiometricsInitialState value) initial,
    required TResult Function(BiometricsLoadingState value) loading,
    required TResult Function(BiometricsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiometricsSuccessfulState value)? successful,
    TResult? Function(BiometricsEmptyState value)? empty,
    TResult? Function(BiometricsInitialState value)? initial,
    TResult? Function(BiometricsLoadingState value)? loading,
    TResult? Function(BiometricsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiometricsSuccessfulState value)? successful,
    TResult Function(BiometricsEmptyState value)? empty,
    TResult Function(BiometricsInitialState value)? initial,
    TResult Function(BiometricsLoadingState value)? loading,
    TResult Function(BiometricsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BiometricsLoadingState implements BiometricsState {
  const factory BiometricsLoadingState() = _$BiometricsLoadingStateImpl;
}

/// @nodoc
abstract class _$$BiometricsErrorStateImplCopyWith<$Res> {
  factory _$$BiometricsErrorStateImplCopyWith(
    _$BiometricsErrorStateImpl value,
    $Res Function(_$BiometricsErrorStateImpl) then,
  ) = __$$BiometricsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure? error});
}

/// @nodoc
class __$$BiometricsErrorStateImplCopyWithImpl<$Res>
    extends _$BiometricsStateCopyWithImpl<$Res, _$BiometricsErrorStateImpl>
    implements _$$BiometricsErrorStateImplCopyWith<$Res> {
  __$$BiometricsErrorStateImplCopyWithImpl(
    _$BiometricsErrorStateImpl _value,
    $Res Function(_$BiometricsErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = freezed}) {
    return _then(
      _$BiometricsErrorStateImpl(
        freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as Failure?,
      ),
    );
  }
}

/// @nodoc

class _$BiometricsErrorStateImpl implements BiometricsErrorState {
  const _$BiometricsErrorStateImpl([this.error]);

  @override
  final Failure? error;

  @override
  String toString() {
    return 'BiometricsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricsErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricsErrorStateImplCopyWith<_$BiometricsErrorStateImpl>
  get copyWith =>
      __$$BiometricsErrorStateImplCopyWithImpl<_$BiometricsErrorStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BiometricsModel> data) successful,
    required TResult Function() empty,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BiometricsModel> data)? successful,
    TResult? Function()? empty,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BiometricsModel> data)? successful,
    TResult Function()? empty,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Failure? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BiometricsSuccessfulState value) successful,
    required TResult Function(BiometricsEmptyState value) empty,
    required TResult Function(BiometricsInitialState value) initial,
    required TResult Function(BiometricsLoadingState value) loading,
    required TResult Function(BiometricsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BiometricsSuccessfulState value)? successful,
    TResult? Function(BiometricsEmptyState value)? empty,
    TResult? Function(BiometricsInitialState value)? initial,
    TResult? Function(BiometricsLoadingState value)? loading,
    TResult? Function(BiometricsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BiometricsSuccessfulState value)? successful,
    TResult Function(BiometricsEmptyState value)? empty,
    TResult Function(BiometricsInitialState value)? initial,
    TResult Function(BiometricsLoadingState value)? loading,
    TResult Function(BiometricsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BiometricsErrorState implements BiometricsState {
  const factory BiometricsErrorState([final Failure? error]) =
      _$BiometricsErrorStateImpl;

  Failure? get error;

  /// Create a copy of BiometricsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricsErrorStateImplCopyWith<_$BiometricsErrorStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
