// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometrics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BiometricsModelImpl _$$BiometricsModelImplFromJson(
  Map<String, dynamic> json,
) => _$BiometricsModelImpl(
  date: DateTime.parse(json['date'] as String),
  hrv: (json['hrv'] as num?)?.toDouble(),
  rhr: (json['rhr'] as num?)?.toInt(),
  steps: (json['steps'] as num?)?.toInt(),
  sleepScore: (json['sleepScore'] as num?)?.toInt(),
);

Map<String, dynamic> _$$BiometricsModelImplToJson(
  _$BiometricsModelImpl instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'hrv': instance.hrv,
  'rhr': instance.rhr,
  'steps': instance.steps,
  'sleepScore': instance.sleepScore,
};
