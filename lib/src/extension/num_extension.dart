import 'package:intl/intl.dart';

extension NumExtension on num {
  String toCurrency() => "RM ${NumberFormat("#,##0.00", "en_US").format(this)}";
}
