import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_model.freezed.dart';
part 'journal_model.g.dart';

@freezed
class JournalModel with _$JournalModel {
  const factory JournalModel({
    required DateTime date,
    int? mood,
    String? note,
  }) = _JournalModel;

  factory JournalModel.fromJson(Map<String, dynamic> json) =>
      _$JournalModelFromJson(json);
}
