// import 'ui_utilities/asset_path.dart';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:todo_app/src/core/utils/asset_path.dart';

class AppConstants {
  static const String primaryFontFamily = "Satoshi";
  static const String secondaryFontFamily = "IvyMode";
  static const String gifPath = "assets/gifs/";
  static const String svgPath = "assets/svgs/";
  static const String imagePath = "assets/images/";
  static const String isLoggedIn = "is_logged_in";
  static const String userId = "userId";
  static const String naira = '₦';

  static List<Map<String, dynamic>> barItems = [
    {"imagePath": SvgAssets.home, "title": "Home"},
    {"imagePath": SvgAssets.order, "title": "Orders"},
    {"imagePath": SvgAssets.saved, "title": "Saved"},
    {"imagePath": SvgAssets.profile, "title": "Profile"},
  ];
}

printOnlyInDebug(dynamic message) {
  if (kDebugMode) {
    print(message);
  }
}
