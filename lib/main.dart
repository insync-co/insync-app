import 'package:flutter/material.dart';
import 'package:insync_flutter/core/di/di.dart';
import 'package:insync_flutter/core/util/theme/ThemeManager.dart';
import 'package:provider/provider.dart';

import 'core/local/shared_preference.dart';
import 'core/navigation/AppRouter.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.init();
  runApp(
    MultiProvider(
      providers: [
        ...DependencyInjection.providers
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeManager = context.watch<ThemeManager>();

    return MaterialApp.router(  // Use MaterialApp.router for GoRouter
          title: 'Insync',
          debugShowCheckedModeBanner: false,
          theme: themeManager.currentTheme,
          routerConfig: AppRouter.router,  // Set up router configuration
        );
  }
}
