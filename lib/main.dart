// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/src/application/entry_point/my_app.dart';

// Project imports:

import 'package:hive_flutter/hive_flutter.dart';
import 'src/core/services/local_storage.dart/local_storage_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(HiveKeys.appBox);
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const ProviderScope(child: MyApp()));
}
