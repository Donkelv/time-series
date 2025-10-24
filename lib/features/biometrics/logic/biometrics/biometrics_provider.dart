import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/data/datasource/biometrics_source.dart';
import 'package:time_series/features/biometrics/data/repository/biometric_repository.dart';
import 'package:time_series/features/biometrics/domain/repository/ibiometrics_repository.dart';
import 'package:time_series/features/biometrics/domain/usecase/get_biometric_data.dart';
import 'biometrics_notifier.dart';
import 'biometrics_state.dart';

final getBiometricsDataProvider =
    StateNotifierProvider<BiometricsNotifier, BiometricsState>(
      (ref) => BiometricsNotifier(
        biometrics: GetBiometricData(
          repository: ref.read(biometricsRepositoryProvider),
        ),
        ref: ref,
      ),
    );

final biometricsRepositoryProvider = Provider<IBiometricRepository>((ref) {
  return BiometricRepository(biometricsSource: BiometricsSource());
});
