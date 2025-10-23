import 'package:intl/intl.dart';

extension CurrencyFormat on num {
  String toCurrencyString(String? currency) {
    NumberFormat format = NumberFormat.currency(
      symbol: currency ?? '',
      decimalDigits: 2,
      locale: 'en_NG',
    );
    return format.format(this);
  }
}
