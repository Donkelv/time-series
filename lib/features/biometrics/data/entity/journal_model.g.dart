// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalModelImpl _$$JournalModelImplFromJson(Map<String, dynamic> json) =>
    _$JournalModelImpl(
      date: DateTime.parse(json['date'] as String),
      mood: (json['mood'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$JournalModelImplToJson(_$JournalModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'mood': instance.mood,
      'note': instance.note,
    };
