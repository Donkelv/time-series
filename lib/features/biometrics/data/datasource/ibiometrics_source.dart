import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';

abstract class IBiometricsSource {
  Future<List<BiometricsModel>> getBiometricData();
  Future<List<JournalModel>> getJournalData();
}
