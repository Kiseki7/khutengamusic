import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/audio_service.dart';
import 'services/theme_service.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const KhutengaMusicApp());
}

class KhutengaMusicApp extends StatelessWidget {
  const KhutengaMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AudioService()),
        ChangeNotifierProvider(create: (context) => ThemeService()),
      ],
      child: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return MaterialApp(
            title: 'Khutenga Music',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeService.themeMode,
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}

// Brand Colors
const Color primaryColor = Color(0xFFFF5446); // Coral Red
const Color primaryDark = Color(0xFF2D2D2D); // Dark Gray/Charcoal
const Color primaryLight = Color(0xFFFFFFFF); // White
const Color primaryLightAlt = Color(0xFFF5F5F5); // Light Gray

// Light Theme
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: primaryLight,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryLight,
    foregroundColor: primaryDark,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: primaryLight,
    selectedItemColor: primaryColor,
    unselectedItemColor: Color(0xFFB0B0B0),
  ),
  cardColor: primaryLightAlt,
  dialogBackgroundColor: primaryLight,
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    onBackground: primaryDark,
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: primaryDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryDark,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: primaryDark,
    selectedItemColor: primaryColor,
    unselectedItemColor: Color(0xFF808080),
  ),
  cardColor: Color(0xFF404040),
  dialogBackgroundColor: Color(0xFF404040),
  colorScheme: const ColorScheme.dark(
    primary: primaryColor,
    onBackground: primaryLight,
  ),
);