
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/domain/usecase/get_journal_data.dart';
import 'journal_state.dart';

class JournalNotifier extends StateNotifier<JournalState> {
  JournalNotifier({required GetJournalData journal, required Ref ref})
    : _journal = journal,
      _ref = ref,
      super(const JournalState.initial());

  final GetJournalData _journal;
  final Ref _ref;

  Future<void> journal() async {
    state = const JournalState.loading();
    final result = await _journal();
    result.fold(
      (error) {
        state = JournalState.error(error);
      },
      (data) async {
        state = JournalState.successful(data);
      },
    );
  }
}
