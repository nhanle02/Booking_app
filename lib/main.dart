import 'package:booking_app_source/representation/screen/splash_screen.dart';
import 'package:booking_app_source/theme/custom_themes.dart';
import 'package:booking_app_source/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:booking_app_source/core/helpers/local_storage_helper.dart';
import 'package:booking_app_source/routes.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'pages/login_page.dart';

import 'core/helpers/size_config.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Booking App',
          theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
          routes: routes,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: generateRoutes,
          home: Builder(
            builder: (context) {
              SizeConfig.init(context);
              return const SplashScreen();
            },
          ),
        );
      },
    );
  }
}

