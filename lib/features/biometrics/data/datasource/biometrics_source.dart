import 'dart:convert';
import 'dart:math';

import 'package:time_series/features/biometrics/data/datasource/ibiometrics_source.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class BiometricsSource implements IBiometricsSource {
  final _random = Random();
  @override
  Future<List<BiometricsModel>> getBiometricData() async {
    await _simulateLatency();
    _simulateError();

    final String response = await rootBundle.loadString(
      'assets/json/biometrics.json',
    );

    final List decodedData = jsonDecode(response) as List;
    return decodedData.map((e) => BiometricsModel.fromJson(e)).toList();
  }

  @override
  Future<List<JournalModel>> getJournalData() async {
    await _simulateLatency();
    _simulateError();

    final String response = await rootBundle.loadString(
      'assets/json/biometrics.json',
    );

    final List decodedData = jsonDecode(response) as List;
    return decodedData.map((e) => JournalModel.fromJson(e)).toList();
  }

  Future<void> _simulateLatency() async {
    final delay = 700 + _random.nextInt(500);
    await Future.delayed(Duration(milliseconds: delay));
  }

  void _simulateError() async {
    if (_random.nextDouble() < 0.1) {
      throw Exception('Random data load failure');
    }
  }
}
