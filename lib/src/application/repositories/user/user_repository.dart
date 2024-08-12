// Project imports:
import 'package:todo_app/src/core/utils/enums.dart';

abstract interface class UserRepository {
  // User getUser();
  // Future<void> updateUser(User user);
  String getToken();
  String getRefreshToken();
  void saveToken(String token);
  void saveRefreshToken(String token);
  void saveCurrentState(CurrentState val);
  CurrentState getCurrentState();
  bool? getRememberMe();
  void saveRememberMe(bool val);
}
