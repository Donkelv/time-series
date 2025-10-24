import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_series/features/biometrics/domain/usecase/get_journal_data.dart';
import 'package:time_series/features/biometrics/logic/biometrics/biometrics_provider.dart';
import 'journal_notifier.dart';
import 'journal_state.dart';

final journalProvider = StateNotifierProvider<JournalNotifier, JournalState>(
  (ref) => JournalNotifier(
    journal: GetJournalData(repository: ref.read(biometricsRepositoryProvider)),
    ref: ref,
  ),
);
