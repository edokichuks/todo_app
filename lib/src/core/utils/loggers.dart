// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:flutter/foundation.dart';

void debugLog(dynamic message) {
  if (kDebugMode) {
    log('DEBUG: $message');
  }
}
