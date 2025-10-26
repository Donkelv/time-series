import 'dart:convert';
import 'dart:math';

import 'package:time_series/core/exceptions/exceptions.dart';
import 'package:time_series/features/biometrics/data/datasource/ibiometrics_source.dart';
import 'package:time_series/features/biometrics/data/entity/biometrics_model.dart';
import 'package:time_series/features/biometrics/data/entity/journal_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class BiometricsSource implements IBiometricsSource {
  final _random = Random();
  bool printLogs = false;

  @override
  Future<List<BiometricsModel>> getBiometricData() async {
    try {
      await _simulateLatency();
      _simulateError();

      final String response = await rootBundle.loadString(
        'assets/json/biometrics_90d.json',
      );

      final List decodedData = jsonDecode(response) as List;
      return decodedData.map((e) => BiometricsModel.fromJson(e)).toList();
    } catch (e) {
      if(printLogs){
        print('Error in BiometricsSource.getBiometricData: $e');
      }
      if (e is Failure) {
        throw Failure(statusCode: e.statusCode, message: e.message);
      }
      throw Failure(
        message:
            "An error occurred, please check your internet connection and try again",
      );
    }
  }

  @override
  Future<List<JournalModel>> getJournalData() async {
    try {
      await _simulateLatency();
      _simulateError();

      final String response = await rootBundle.loadString(
        'assets/json/journals.json',
      );

      final List decodedData = jsonDecode(response) as List;
      return decodedData.map((e) => JournalModel.fromJson(e)).toList();
    } catch (e) {
      if(printLogs){
        print('Error in BiometricsSource.getJournalData: $e');
      }
      if (e is Failure) {
        throw Failure(statusCode: e.statusCode, message: e.message);
      }
      throw Failure(
        message:
            "An error occurred, please check your internet connection and try again",
      );
    }
  }

  Future<void> _simulateLatency() async {
    // Simulate 700-1200ms latency
    final latency = 700 + _random.nextInt(500);
    await Future.delayed(Duration(milliseconds: latency));
  }

  void _simulateError() {
    // Simulate ~10% random failures
    if (_random.nextDouble() < 0.1) {
      throw Failure(
        statusCode: 500,
        message: "Simulated network error - please try again",
      );
    }
  }
}