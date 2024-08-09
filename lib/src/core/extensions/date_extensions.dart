// Package imports:
import 'package:intl/intl.dart';

extension ToDateTime on DateTime? {
  String get toDateTime => (this == null)
      ? ''
      : DateFormat('MMM d, hh:mm a').format(this!.toLocal());

  String get toDate =>
      (this == null) ? '' : DateFormat('MMM d, y').format(this!.toLocal());

  String get toDateTimeYear => (this == null)
      ? ''
      : DateFormat('MMM d, y hh:mm a').format(this!.toLocal());

  String get toDateMonthYear =>
      (this == null) ? '' : DateFormat('dd/MM/yy').format(this!.toLocal());

  String get toTxnDate => (this == null)
      ? ''
      : DateFormat('dd MMM yyyy, hh:mma').format(this!.toLocal());
  String get toReceiptDate => (this == null)
      ? ''
      : DateFormat('hh:mma, EEE MMM dd, yyyy').format(this!.toLocal());
  String get toMonthDate =>
      (this == null) ? '' : DateFormat('d MMMM y').format(this!);

  DateTime get splitDateOnly => DateTime.parse(toString().split(' ')[0]);

  String get getHeaderDate => this!.day == DateTime.now().day
      ? 'Today'
      : this!.day == DateTime.now().day - 1
          ? 'Yesterday'
          : DateFormat('MMM dd, yyyy').format(this!);

  String get timeAgo {
    if (this == null) return '';
    final difference = DateTime.now().difference(this!);
    final days = difference.inDays;
    final hours = difference.inHours;
    final minutes = difference.inMinutes;
    final seconds = difference.inSeconds;
    if (days > 0) {
      return toDate;
    } else if (hours > 0) {
      return toTime;
    } else if (minutes > 0) {
      if (minutes == 1) {
        return '$minutes minute ago';
      }
      return '$minutes minutes ago';
    } else if (seconds > 0) {
      return '$seconds seconds ago';
    } else {
      return 'Just now';
    }
  }

  String get toTime => (this == null)
      ? ''
      : DateFormat('hh:mm a').format(this!.toLocal()).toLowerCase();
}

String calculateDateRange(DateTime startDate, DateTime endDate) {
  // Calculate the difference in days
  final daysDifference = endDate.difference(startDate).inDays;

  return '$daysDifference ${daysDifference == 1 ? 'day' : 'days'}';
}
