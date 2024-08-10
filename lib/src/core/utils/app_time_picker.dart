// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:todo_app/src/core/utils/utils_exports.dart';

Future<String?> openTimePicker({
  required BuildContext context,
}) async {
  final TimeOfDay now = TimeOfDay.now();
  String formattedTime = '';

  // Show the time picker dialog
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: now,
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary:
                AppColors.primary, // Change the color to match your app theme
          ),
        ),
        child: child!,
      );
    },
  );

  // Format the picked time
  if (pickedTime != null) {
    final now = DateTime.now();
    final formattedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    formattedTime =
        DateFormat('h:mm a').format(formattedDateTime).toUpperCase();
    return formattedTime;
  }
  return null;
}
