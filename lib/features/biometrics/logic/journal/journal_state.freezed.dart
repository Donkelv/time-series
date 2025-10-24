// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$JournalState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<JournalModel> response) successful,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<JournalModel> response)? successful,
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<JournalModel> response)? successful,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Failure? error)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalSuccessfulState value) successful,
    required TResult Function(JournalInitialState value) initial,
    required TResult Function(JournalEmptyState value) empty,
    required TResult Function(JournalLoadingState value) loading,
    required TResult Function(JournalErrorState value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalSuccessfulState value)? successful,
    TResult? Function(JournalInitialState value)? initial,
    TResult? Function(JournalEmptyState value)? empty,
    TResult? Function(JournalLoadingState value)? loading,
    TResult? Function(JournalErrorState value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalSuccessfulState value)? successful,
    TResult Function(JournalInitialState value)? initial,
    TResult Function(JournalEmptyState value)? empty,
    TResult Function(JournalLoadingState value)? loading,
    TResult Function(JournalErrorState value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalStateCopyWith<$Res> {
  factory $JournalStateCopyWith(
    JournalState value,
    $Res Function(JournalState) then,
  ) = _$JournalStateCopyWithImpl<$Res, JournalState>;
}

/// @nodoc
class _$JournalStateCopyWithImpl<$Res, $Val extends JournalState>
    implements $JournalStateCopyWith<$Res> {
  _$JournalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$JournalSuccessfulStateImplCopyWith<$Res> {
  factory _$$JournalSuccessfulStateImplCopyWith(
    _$JournalSuccessfulStateImpl value,
    $Res Function(_$JournalSuccessfulStateImpl) then,
  ) = __$$JournalSuccessfulStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<JournalModel> response});
}

/// @nodoc
class __$$JournalSuccessfulStateImplCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$JournalSuccessfulStateImpl>
    implements _$$JournalSuccessfulStateImplCopyWith<$Res> {
  __$$JournalSuccessfulStateImplCopyWithImpl(
    _$JournalSuccessfulStateImpl _value,
    $Res Function(_$JournalSuccessfulStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? response = null}) {
    return _then(
      _$JournalSuccessfulStateImpl(
        null == response
            ? _value._response
            : response // ignore: cast_nullable_to_non_nullable
                as List<JournalModel>,
      ),
    );
  }
}

/// @nodoc

class _$JournalSuccessfulStateImpl implements JournalSuccessfulState {
  const _$JournalSuccessfulStateImpl(final List<JournalModel> response)
    : _response = response;

  final List<JournalModel> _response;
  @override
  List<JournalModel> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  String toString() {
    return 'JournalState.successful(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalSuccessfulStateImpl &&
            const DeepCollectionEquality().equals(other._response, _response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_response));

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalSuccessfulStateImplCopyWith<_$JournalSuccessfulStateImpl>
  get copyWith =>
      __$$JournalSuccessfulStateImplCopyWithImpl<_$JournalSuccessfulStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<JournalModel> response) successful,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return successful(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<JournalModel> response)? successful,
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return successful?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<JournalModel> response)? successful,
    TResult Function()? initial,
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(Failure? error)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalSuccessfulState value) successful,
    required TResult Function(JournalInitialState value) initial,
    required TResult Function(JournalEmptyState value) empty,
    required TResult Function(JournalLoadingState value) loading,
    required TResult Function(JournalErrorState value) error,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalSuccessfulState value)? successful,
    TResult? Function(JournalInitialState value)? initial,
    TResult? Function(JournalEmptyState value)? empty,
    TResult? Function(JournalLoadingState value)? loading,
    TResult? Function(JournalErrorState value)? error,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalSuccessfulState value)? successful,
    TResult Function(JournalInitialState value)? initial,
    TResult Function(JournalEmptyState value)? empty,
    TResult Function(JournalLoadingState value)? loading,
    TResult Function(JournalErrorState value)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class JournalSuccessfulState implements JournalState {
  const factory JournalSuccessfulState(final List<JournalModel> response) =
      _$JournalSuccessfulStateImpl;

  List<JournalModel> get response;

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalSuccessfulStateImplCopyWith<_$JournalSuccessfulStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JournalInitialStateImplCopyWith<$Res> {
  factory _$$JournalInitialStateImplCopyWith(
    _$JournalInitialStateImpl value,
    $Res Function(_$JournalInitialStateImpl) then,
  ) = __$$JournalInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JournalInitialStateImplCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$JournalInitialStateImpl>
    implements _$$JournalInitialStateImplCopyWith<$Res> {
  __$$JournalInitialStateImplCopyWithImpl(
    _$JournalInitialStateImpl _value,
    $Res Function(_$JournalInitialStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$JournalInitialStateImpl implements JournalInitialState {
  const _$JournalInitialStateImpl();

  @override
  String toString() {
    return 'JournalState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<JournalModel> response) successful,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<JournalModel> response)? successful,
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<JournalModel> response)? successful,
    TResult Function()? initial,
    TResult Function()? empty,
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
    required TResult Function(JournalSuccessfulState value) successful,
    required TResult Function(JournalInitialState value) initial,
    required TResult Function(JournalEmptyState value) empty,
    required TResult Function(JournalLoadingState value) loading,
    required TResult Function(JournalErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalSuccessfulState value)? successful,
    TResult? Function(JournalInitialState value)? initial,
    TResult? Function(JournalEmptyState value)? empty,
    TResult? Function(JournalLoadingState value)? loading,
    TResult? Function(JournalErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalSuccessfulState value)? successful,
    TResult Function(JournalInitialState value)? initial,
    TResult Function(JournalEmptyState value)? empty,
    TResult Function(JournalLoadingState value)? loading,
    TResult Function(JournalErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class JournalInitialState implements JournalState {
  const factory JournalInitialState() = _$JournalInitialStateImpl;
}

/// @nodoc
abstract class _$$JournalEmptyStateImplCopyWith<$Res> {
  factory _$$JournalEmptyStateImplCopyWith(
    _$JournalEmptyStateImpl value,
    $Res Function(_$JournalEmptyStateImpl) then,
  ) = __$$JournalEmptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JournalEmptyStateImplCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$JournalEmptyStateImpl>
    implements _$$JournalEmptyStateImplCopyWith<$Res> {
  __$$JournalEmptyStateImplCopyWithImpl(
    _$JournalEmptyStateImpl _value,
    $Res Function(_$JournalEmptyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$JournalEmptyStateImpl implements JournalEmptyState {
  const _$JournalEmptyStateImpl();

  @override
  String toString() {
    return 'JournalState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JournalEmptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<JournalModel> response) successful,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<JournalModel> response)? successful,
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<JournalModel> response)? successful,
    TResult Function()? initial,
    TResult Function()? empty,
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
    required TResult Function(JournalSuccessfulState value) successful,
    required TResult Function(JournalInitialState value) initial,
    required TResult Function(JournalEmptyState value) empty,
    required TResult Function(JournalLoadingState value) loading,
    required TResult Function(JournalErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalSuccessfulState value)? successful,
    TResult? Function(JournalInitialState value)? initial,
    TResult? Function(JournalEmptyState value)? empty,
    TResult? Function(JournalLoadingState value)? loading,
    TResult? Function(JournalErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalSuccessfulState value)? successful,
    TResult Function(JournalInitialState value)? initial,
    TResult Function(JournalEmptyState value)? empty,
    TResult Function(JournalLoadingState value)? loading,
    TResult Function(JournalErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class JournalEmptyState implements JournalState {
  const factory JournalEmptyState() = _$JournalEmptyStateImpl;
}

/// @nodoc
abstract class _$$JournalLoadingStateImplCopyWith<$Res> {
  factory _$$JournalLoadingStateImplCopyWith(
    _$JournalLoadingStateImpl value,
    $Res Function(_$JournalLoadingStateImpl) then,
  ) = __$$JournalLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JournalLoadingStateImplCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$JournalLoadingStateImpl>
    implements _$$JournalLoadingStateImplCopyWith<$Res> {
  __$$JournalLoadingStateImplCopyWithImpl(
    _$JournalLoadingStateImpl _value,
    $Res Function(_$JournalLoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$JournalLoadingStateImpl implements JournalLoadingState {
  const _$JournalLoadingStateImpl();

  @override
  String toString() {
    return 'JournalState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<JournalModel> response) successful,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<JournalModel> response)? successful,
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<JournalModel> response)? successful,
    TResult Function()? initial,
    TResult Function()? empty,
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
    required TResult Function(JournalSuccessfulState value) successful,
    required TResult Function(JournalInitialState value) initial,
    required TResult Function(JournalEmptyState value) empty,
    required TResult Function(JournalLoadingState value) loading,
    required TResult Function(JournalErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalSuccessfulState value)? successful,
    TResult? Function(JournalInitialState value)? initial,
    TResult? Function(JournalEmptyState value)? empty,
    TResult? Function(JournalLoadingState value)? loading,
    TResult? Function(JournalErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalSuccessfulState value)? successful,
    TResult Function(JournalInitialState value)? initial,
    TResult Function(JournalEmptyState value)? empty,
    TResult Function(JournalLoadingState value)? loading,
    TResult Function(JournalErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class JournalLoadingState implements JournalState {
  const factory JournalLoadingState() = _$JournalLoadingStateImpl;
}

/// @nodoc
abstract class _$$JournalErrorStateImplCopyWith<$Res> {
  factory _$$JournalErrorStateImplCopyWith(
    _$JournalErrorStateImpl value,
    $Res Function(_$JournalErrorStateImpl) then,
  ) = __$$JournalErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure? error});
}

/// @nodoc
class __$$JournalErrorStateImplCopyWithImpl<$Res>
    extends _$JournalStateCopyWithImpl<$Res, _$JournalErrorStateImpl>
    implements _$$JournalErrorStateImplCopyWith<$Res> {
  __$$JournalErrorStateImplCopyWithImpl(
    _$JournalErrorStateImpl _value,
    $Res Function(_$JournalErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = freezed}) {
    return _then(
      _$JournalErrorStateImpl(
        freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as Failure?,
      ),
    );
  }
}

/// @nodoc

class _$JournalErrorStateImpl implements JournalErrorState {
  const _$JournalErrorStateImpl([this.error]);

  @override
  final Failure? error;

  @override
  String toString() {
    return 'JournalState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalErrorStateImplCopyWith<_$JournalErrorStateImpl> get copyWith =>
      __$$JournalErrorStateImplCopyWithImpl<_$JournalErrorStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<JournalModel> response) successful,
    required TResult Function() initial,
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(Failure? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<JournalModel> response)? successful,
    TResult? Function()? initial,
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(Failure? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<JournalModel> response)? successful,
    TResult Function()? initial,
    TResult Function()? empty,
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
    required TResult Function(JournalSuccessfulState value) successful,
    required TResult Function(JournalInitialState value) initial,
    required TResult Function(JournalEmptyState value) empty,
    required TResult Function(JournalLoadingState value) loading,
    required TResult Function(JournalErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalSuccessfulState value)? successful,
    TResult? Function(JournalInitialState value)? initial,
    TResult? Function(JournalEmptyState value)? empty,
    TResult? Function(JournalLoadingState value)? loading,
    TResult? Function(JournalErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalSuccessfulState value)? successful,
    TResult Function(JournalInitialState value)? initial,
    TResult Function(JournalEmptyState value)? empty,
    TResult Function(JournalLoadingState value)? loading,
    TResult Function(JournalErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class JournalErrorState implements JournalState {
  const factory JournalErrorState([final Failure? error]) =
      _$JournalErrorStateImpl;

  Failure? get error;

  /// Create a copy of JournalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalErrorStateImplCopyWith<_$JournalErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
