import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/not_found_screen.dart';
import 'models/tour_package.dart';

void main() {
  runApp(const NusaTravelApp());
}

class NusaTravelApp extends StatelessWidget {
  const NusaTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusa Travel',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.detail) {
          final args = settings.arguments as TourPackage;
          return MaterialPageRoute(
            builder: (context) => DetailScreen(package: args),
          );
        }
        return null; // Akan memicu onUnknownRoute jika route tidak dikenali
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
    );
  }
}