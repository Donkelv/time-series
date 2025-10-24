import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';
import '../../../../../../../../core/exceptions/exceptions.dart';

part 'journal_state.freezed.dart';

extension JournalStateGetters on JournalState {
  bool get isSuccessful => this is JournalSuccessfulState;
  bool get isInit => this is JournalInitialState;
  bool get isLoading => this is JournalLoadingState;
  bool get isError => this is JournalErrorState;

  String? get error =>
      maybeWhen(error: (error) => error.toString(), orElse: () => null);
  List<JournalModel>? get data =>
      maybeWhen(successful: (response) => response, orElse: () => null);
}

@freezed
class JournalState with _$JournalState {
  /// Data is present state
  const factory JournalState.successful(List<JournalModel> response) =
      JournalSuccessfulState;

  /// Initial/default state
  const factory JournalState.initial() = JournalInitialState;

  /// Data is empty
  const factory JournalState.empty() = JournalEmptyState;

  /// Data is loading state
  const factory JournalState.loading() = JournalLoadingState;

  /// Error when loading data state
  const factory JournalState.error([Failure? error]) =
      JournalErrorState;
}
