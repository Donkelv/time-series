import 'package:dartz/dartz.dart';
import 'package:time_series/core/exceptions/exceptions.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';
import 'package:time_series/features/biometrics/domain/repository/ibiometrics_repository.dart';

class GetJournalData {
  GetJournalData({required IBiometricRepository repository})
    : _repository = repository;

  final IBiometricRepository _repository;

  Future<Either<Failure, List<JournalModel>>> call() {
    return _repository.getJournalData();
  }
}
