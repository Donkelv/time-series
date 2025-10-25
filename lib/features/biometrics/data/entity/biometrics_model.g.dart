// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometrics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BiometricsModelImpl _$$BiometricsModelImplFromJson(
  Map<String, dynamic> json,
) => _$BiometricsModelImpl(
  date: json['date'] as String,
  hrv: (json['hrv'] as num?)?.toDouble(),
  rhr: json['rhr'] as num?,
  steps: json['steps'] as num?,
  sleepScore: json['sleepScore'] as num?,
);

Map<String, dynamic> _$$BiometricsModelImplToJson(
  _$BiometricsModelImpl instance,
) => <String, dynamic>{
  'date': instance.date,
  'hrv': instance.hrv,
  'rhr': instance.rhr,
  'steps': instance.steps,
  'sleepScore': instance.sleepScore,
};
