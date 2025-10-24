import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/domain/usecase/get_biometric_data.dart';
import 'biometrics_state.dart';

class BiometricsNotifier extends StateNotifier<BiometricsState> {
  BiometricsNotifier({
    required GetBiometricData biometrics,
    required Ref ref,
  })  : _biometrics = biometrics,
        _ref = ref,
        super(const BiometricsState.initial());

  final GetBiometricData _biometrics;
  final Ref _ref;

  Future<void> biometrics( ) async {
    state = const BiometricsState.loading();
    final result = await _biometrics();
    result.fold(
      (error) {
        state = BiometricsState.error(error);
      },
      (data) async {
        state = BiometricsState.successful(data);
      },
    );
  }
}
