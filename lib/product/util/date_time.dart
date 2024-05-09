import 'package:intl/intl.dart';

class MyDateTime {
  String getDateTime() {
    final dateFormatter = DateFormat('yyyy-MM-dd');
    final timeFormatter = DateFormat('HH:mm:ss');
    final now = DateTime.now();
    final formattedDate = dateFormatter.format(now);
    final formattedTime = timeFormatter.format(now);
    return '$formattedDate $formattedTime';
  }

  String getDate() {
    final dateFormatter = DateFormat('dd.MM.yyyy');
    final now = DateTime.now();
    final formattedDate = dateFormatter.format(now);
    return formattedDate;
  }
}
