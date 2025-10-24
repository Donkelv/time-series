import 'package:dartz/dartz.dart';
import 'package:time_series/core/exceptions/exceptions.dart';
import 'package:time_series/features/biometrics/data/datasource/ibiometrics_source.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';
import 'package:time_series/features/biometrics/domain/repository/ibiometrics_repository.dart';

class BiometricRepository implements IBiometricRepository {
  BiometricRepository({required IBiometricsSource biometricsSource})
    : _biometricsSource = biometricsSource;

  final IBiometricsSource _biometricsSource;
  @override
  Future<Either<Failure, List<BiometricsModel>>> getBiometricData() async {
    try {
      final List<BiometricsModel> response =
          await _biometricsSource.getBiometricData();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(InternalException());
    }
  }

  @override
  Future<Either<Failure, List<JournalModel>>> getJournalData() async {
    try {
      final List<JournalModel> response =
          await _biometricsSource.getJournalData();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(InternalException());
    }
  }
}
