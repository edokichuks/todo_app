import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/src/core/extensions/date_extensions.dart';
import 'package:todo_app/src/core/utils/utils_exports.dart';


Future<String?> openDatePicker({
  required BuildContext context,
}) async {
  final today = DateTime.now();
  String formattedDate = '';
  DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime.utc(1900),
      lastDate: today.add(
        const Duration(days: 30 * 3),
      ),
      builder: (BuildContext context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
            ),
          ),
          child: child!,
        );
      });

  if (pickedDate != null) {
    formattedDate = pickedDate.dayofWeekDate;
    return formattedDate;
  }

  return null;
}
