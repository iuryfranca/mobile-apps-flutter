import 'package:flutter/material.dart';
import 'package:travel_app/details.dart';
import 'package:travel_app/login.dart';
import 'package:provider/provider.dart';

enum AppMenu {
  about,
  privacy,
  settings,
}

void main() async {
  runApp(
    MultiProvider(
      // create the provider
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        )
      ],
      child: const TravelersApp(),
    ),
  );
}

class TravelersApp extends StatelessWidget {
  const TravelersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const Login(),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeData? currentTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.lightBlueAccent,
  );

  setLightMode() {
    currentTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light, // LightMode
      colorSchemeSeed: Colors.lightBlueAccent,
    );
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark, // DarkMode
      colorSchemeSeed: Colors.lightBlueAccent,
    );
    notifyListeners();
  }
}
