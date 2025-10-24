// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometrics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BiometricsModel _$BiometricsModelFromJson(Map<String, dynamic> json) {
  return _BiometricsModel.fromJson(json);
}

/// @nodoc
mixin _$BiometricsModel {
  DateTime get date => throw _privateConstructorUsedError;
  double? get hrv => throw _privateConstructorUsedError;
  int? get rhr => throw _privateConstructorUsedError;
  int? get steps => throw _privateConstructorUsedError;
  int? get sleepScore => throw _privateConstructorUsedError;

  /// Serializes this BiometricsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BiometricsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BiometricsModelCopyWith<BiometricsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiometricsModelCopyWith<$Res> {
  factory $BiometricsModelCopyWith(
    BiometricsModel value,
    $Res Function(BiometricsModel) then,
  ) = _$BiometricsModelCopyWithImpl<$Res, BiometricsModel>;
  @useResult
  $Res call({
    DateTime date,
    double? hrv,
    int? rhr,
    int? steps,
    int? sleepScore,
  });
}

/// @nodoc
class _$BiometricsModelCopyWithImpl<$Res, $Val extends BiometricsModel>
    implements $BiometricsModelCopyWith<$Res> {
  _$BiometricsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BiometricsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? hrv = freezed,
    Object? rhr = freezed,
    Object? steps = freezed,
    Object? sleepScore = freezed,
  }) {
    return _then(
      _value.copyWith(
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            hrv:
                freezed == hrv
                    ? _value.hrv
                    : hrv // ignore: cast_nullable_to_non_nullable
                        as double?,
            rhr:
                freezed == rhr
                    ? _value.rhr
                    : rhr // ignore: cast_nullable_to_non_nullable
                        as int?,
            steps:
                freezed == steps
                    ? _value.steps
                    : steps // ignore: cast_nullable_to_non_nullable
                        as int?,
            sleepScore:
                freezed == sleepScore
                    ? _value.sleepScore
                    : sleepScore // ignore: cast_nullable_to_non_nullable
                        as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BiometricsModelImplCopyWith<$Res>
    implements $BiometricsModelCopyWith<$Res> {
  factory _$$BiometricsModelImplCopyWith(
    _$BiometricsModelImpl value,
    $Res Function(_$BiometricsModelImpl) then,
  ) = __$$BiometricsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    double? hrv,
    int? rhr,
    int? steps,
    int? sleepScore,
  });
}

/// @nodoc
class __$$BiometricsModelImplCopyWithImpl<$Res>
    extends _$BiometricsModelCopyWithImpl<$Res, _$BiometricsModelImpl>
    implements _$$BiometricsModelImplCopyWith<$Res> {
  __$$BiometricsModelImplCopyWithImpl(
    _$BiometricsModelImpl _value,
    $Res Function(_$BiometricsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BiometricsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? hrv = freezed,
    Object? rhr = freezed,
    Object? steps = freezed,
    Object? sleepScore = freezed,
  }) {
    return _then(
      _$BiometricsModelImpl(
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        hrv:
            freezed == hrv
                ? _value.hrv
                : hrv // ignore: cast_nullable_to_non_nullable
                    as double?,
        rhr:
            freezed == rhr
                ? _value.rhr
                : rhr // ignore: cast_nullable_to_non_nullable
                    as int?,
        steps:
            freezed == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                    as int?,
        sleepScore:
            freezed == sleepScore
                ? _value.sleepScore
                : sleepScore // ignore: cast_nullable_to_non_nullable
                    as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BiometricsModelImpl implements _BiometricsModel {
  const _$BiometricsModelImpl({
    required this.date,
    this.hrv,
    this.rhr,
    this.steps,
    this.sleepScore,
  });

  factory _$BiometricsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BiometricsModelImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double? hrv;
  @override
  final int? rhr;
  @override
  final int? steps;
  @override
  final int? sleepScore;

  @override
  String toString() {
    return 'BiometricsModel(date: $date, hrv: $hrv, rhr: $rhr, steps: $steps, sleepScore: $sleepScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BiometricsModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hrv, hrv) || other.hrv == hrv) &&
            (identical(other.rhr, rhr) || other.rhr == rhr) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.sleepScore, sleepScore) ||
                other.sleepScore == sleepScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, hrv, rhr, steps, sleepScore);

  /// Create a copy of BiometricsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BiometricsModelImplCopyWith<_$BiometricsModelImpl> get copyWith =>
      __$$BiometricsModelImplCopyWithImpl<_$BiometricsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BiometricsModelImplToJson(this);
  }
}

abstract class _BiometricsModel implements BiometricsModel {
  const factory _BiometricsModel({
    required final DateTime date,
    final double? hrv,
    final int? rhr,
    final int? steps,
    final int? sleepScore,
  }) = _$BiometricsModelImpl;

  factory _BiometricsModel.fromJson(Map<String, dynamic> json) =
      _$BiometricsModelImpl.fromJson;

  @override
  DateTime get date;
  @override
  double? get hrv;
  @override
  int? get rhr;
  @override
  int? get steps;
  @override
  int? get sleepScore;

  /// Create a copy of BiometricsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BiometricsModelImplCopyWith<_$BiometricsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
