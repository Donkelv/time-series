import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';

import '../../../../../../../../core/exceptions/exceptions.dart';

part 'biometrics_state.freezed.dart';

extension BiometricsStateGetters on BiometricsState {
  bool get isSuccessful => this is BiometricsSuccessfulState;
  bool get isInit => this is BiometricsInitialState;
  bool get isLoading => this is BiometricsLoadingState;
  bool get isError => this is BiometricsErrorState;

  String? get error =>
      maybeWhen(error: (error) => error.toString(), orElse: () => null);
  List<BiometricsModel>? get data =>
      maybeWhen(successful: (response) => response, orElse: () => null);
}

@freezed
class BiometricsState with _$BiometricsState {
  /// Data is present state
  const factory BiometricsState.successful(List<BiometricsModel> data) = BiometricsSuccessfulState;

  /// Data is empty
  const factory BiometricsState.empty() = BiometricsEmptyState;

  /// Initial/default state
  const factory BiometricsState.initial() = BiometricsInitialState;

  /// Data is loading state
  const factory BiometricsState.loading() = BiometricsLoadingState;

  /// Error when loading data state
  const factory BiometricsState.error([Failure? error]) = BiometricsErrorState;
}
