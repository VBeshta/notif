import 'package:flutter/material.dart';
import 'package:notif/core/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();
  runApp(const App());
}
