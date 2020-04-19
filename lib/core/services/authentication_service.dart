import 'dart:async';

import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';
import 'package:provider_architecture/core/models/user.dart';

class AuthenticationService {
  // Inject our Api
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    // Not real login, we'll just request the user profile
    var fetcheduser = await _api.getUserProfile(userId);
    var hasUser = fetcheduser != null;
    if (hasUser) {
      userController.add(fetcheduser);
    }

    return hasUser;
  }
}
