
import 'package:dartz/dartz.dart';
import 'package:time_series/core/exceptions/exceptions.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';

abstract class IBiometricRepository {
  Future<Either<Failure, List<BiometricsModel>>> getBiometricData();

  Future<Either<Failure, List<JournalModel>>> getJournalData();
}