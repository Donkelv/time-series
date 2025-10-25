import 'package:freezed_annotation/freezed_annotation.dart';

part 'biometrics_model.freezed.dart';
part 'biometrics_model.g.dart';

@freezed
class BiometricsModel with _$BiometricsModel {
  const factory BiometricsModel({
    required String date,
    double? hrv,
    num? rhr,
    num? steps,
    num? sleepScore,
  }) = _BiometricsModel;

  factory BiometricsModel.fromJson(Map<String, dynamic> json) =>
      _$BiometricsModelFromJson(json);
}
