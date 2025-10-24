import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

extension AssetName on String {
  String get svg => 'assets/svg/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get mp4 => 'assets/videos/$this.mp4';
  String get gif => 'assets/gifs/$this.gif';
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool get isNumeric {
    if (isEmpty) {
      return false;
    }
    return double.tryParse(this) != null;
  }
}

extension DateTimeParsing on String {
  /// Converts a string to a DateTime object.
  /// Supports ISO 8601 and custom formats.
  /// Returns null if parsing fails.
  DateTime? toDateTime({String? format, bool isUtc = false}) {
    try {
      String trimmed = trim(); // Remove extra spaces

      // ✅ Step 1: Try parsing as ISO 8601 automatically
      if (format == null) {
        DateTime? parsedDate = DateTime.tryParse(trimmed);

        if (parsedDate != null) {
          return isUtc ? parsedDate.toUtc() : parsedDate;
        }
      }

      // ✅ Step 2: Try custom format if ISO parsing fails
      if (format != null) {
        return isUtc
            ? DateFormat(format).tryParseUtc(trimmed)
            : DateFormat(format).tryParse(trimmed);
      }

      return null; // Return null if parsing fails
    } catch (e) {
      debugPrint('Error parsing date: $e');
      return null; // Return null if parsing fails
    }
  }

  /// Formats a datetime string to "4 Jan at 16:07" format.
  /// Defaults to UTC parsing if string has "Z".
  String toFormattedDateTime({bool isUtc = false}) {
    DateTime? dateTime = toDateTime(isUtc: isUtc);
    if (dateTime == null) return "Invalid Date";

    // Convert date to "d MMM 'at' HH:mm" format
    return DateFormat("d MMM 'at' HH:mm").format(dateTime);
  }
}
