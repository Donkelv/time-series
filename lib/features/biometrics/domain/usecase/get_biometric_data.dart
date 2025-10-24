import 'package:dartz/dartz.dart';
import 'package:time_series/core/exceptions/exceptions.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/domain/repository/ibiometrics_repository.dart';

class GetBiometricData {
  GetBiometricData({required IBiometricRepository repository})
    : _repository = repository;

  final IBiometricRepository _repository;

  Future<Either<Failure, List<BiometricsModel>>> call() {
    return _repository.getBiometricData();
  }
}
