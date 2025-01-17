import 'package:tumer_detection/core/caching/app_shared_pref.dart';

class AppSharedPrefKey {
  static String role = 'role';
  static String userId = 'userId';
  static String name = 'name';
  static String email = 'email';
}

var role = AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.role);
var userId = AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.userId);
var email = AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.email);
var name = AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.name);
