import 'package:freezed_annotation/freezed_annotation.dart';

part 'biometrics_model.freezed.dart';
part 'biometrics_model.g.dart';

@freezed
class BiometricsModel with _$BiometricsModel {
  const factory BiometricsModel({
    required DateTime date,
    double? hrv,
    int? rhr,
    int? steps,
    int? sleepScore,
  }) = _BiometricsModel;

  factory BiometricsModel.fromJson(Map<String, dynamic> json) =>
      _$BiometricsModelFromJson(json);
}
