import 'package:flutter/material.dart';
import 'package:time_series/core/theme/colors.dart';

extension ContextExtension on BuildContext {
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isSmallPhone => screenHeight <= 667.0; // iPhone 7 height approximate
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  double get availableHeight =>
      MediaQuery.of(this).size.height -
      MediaQuery.of(this).padding.top -
      MediaQuery.of(this).padding.bottom;
  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void showSuccessSnackBar({
    required String message,
    VoidCallback? onDismiss,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Column(
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 8.0),
                Flexible(
                    child:
                        Text(message, style: TextStyle(color: Colors.white))),
              ],
            ),
          ],
        ),
        backgroundColor: TimeSeriesColors.green2,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: TimeSeriesColors.green2, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void showErrorSnackBar({
    required String message,
    VoidCallback? onDismiss,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Column(
          children: [
            Row(
              children: [
                Icon(Icons.error, color: Colors.white),
                SizedBox(width: 8.0),
                Flexible(
                    child:
                        Text(message, style: TextStyle(color: Colors.white))),
              ],
            ),
          ],
        ),
        backgroundColor: TimeSeriesColors.primary.withOpacity(0.6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: TimeSeriesColors.primary.withOpacity(0.6), width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
