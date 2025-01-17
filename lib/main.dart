import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tumer_detection/core/caching/app_shared_pref.dart';
import 'package:tumer_detection/core/caching/app_shared_pref_key.dart';
import 'package:tumer_detection/core/di/dependency_injection.dart';
import 'package:tumer_detection/core/helper/bloc_obsever.dart';
import 'package:tumer_detection/tumer_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  await AppSharedPref.initSharedPref();
  Bloc.observer = MyBlocObserver();
  role = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.role);
  userId = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.userId);
  name = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.name);
  email = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.email);
  runApp(const ProviderScope(child: TumerApp()));
print('rooools$role');
print('rooools$userId');
}
