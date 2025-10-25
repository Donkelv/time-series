// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

JournalModel _$JournalModelFromJson(Map<String, dynamic> json) {
  return _JournalModel.fromJson(json);
}

/// @nodoc
mixin _$JournalModel {
  String get date => throw _privateConstructorUsedError;
  int? get mood => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this JournalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalModelCopyWith<JournalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalModelCopyWith<$Res> {
  factory $JournalModelCopyWith(
    JournalModel value,
    $Res Function(JournalModel) then,
  ) = _$JournalModelCopyWithImpl<$Res, JournalModel>;
  @useResult
  $Res call({String date, int? mood, String? note});
}

/// @nodoc
class _$JournalModelCopyWithImpl<$Res, $Val extends JournalModel>
    implements $JournalModelCopyWith<$Res> {
  _$JournalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? mood = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as String,
            mood:
                freezed == mood
                    ? _value.mood
                    : mood // ignore: cast_nullable_to_non_nullable
                        as int?,
            note:
                freezed == note
                    ? _value.note
                    : note // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JournalModelImplCopyWith<$Res>
    implements $JournalModelCopyWith<$Res> {
  factory _$$JournalModelImplCopyWith(
    _$JournalModelImpl value,
    $Res Function(_$JournalModelImpl) then,
  ) = __$$JournalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, int? mood, String? note});
}

/// @nodoc
class __$$JournalModelImplCopyWithImpl<$Res>
    extends _$JournalModelCopyWithImpl<$Res, _$JournalModelImpl>
    implements _$$JournalModelImplCopyWith<$Res> {
  __$$JournalModelImplCopyWithImpl(
    _$JournalModelImpl _value,
    $Res Function(_$JournalModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JournalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? mood = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$JournalModelImpl(
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String,
        mood:
            freezed == mood
                ? _value.mood
                : mood // ignore: cast_nullable_to_non_nullable
                    as int?,
        note:
            freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JournalModelImpl implements _JournalModel {
  const _$JournalModelImpl({required this.date, this.mood, this.note});

  factory _$JournalModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalModelImplFromJson(json);

  @override
  final String date;
  @override
  final int? mood;
  @override
  final String? note;

  @override
  String toString() {
    return 'JournalModel(date: $date, mood: $mood, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, mood, note);

  /// Create a copy of JournalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalModelImplCopyWith<_$JournalModelImpl> get copyWith =>
      __$$JournalModelImplCopyWithImpl<_$JournalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalModelImplToJson(this);
  }
}

abstract class _JournalModel implements JournalModel {
  const factory _JournalModel({
    required final String date,
    final int? mood,
    final String? note,
  }) = _$JournalModelImpl;

  factory _JournalModel.fromJson(Map<String, dynamic> json) =
      _$JournalModelImpl.fromJson;

  @override
  String get date;
  @override
  int? get mood;
  @override
  String? get note;

  /// Create a copy of JournalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalModelImplCopyWith<_$JournalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
