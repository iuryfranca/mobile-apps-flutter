import 'package:flutter/material.dart';
import 'package:the_mobie_db/MovieList.dart';
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
      child: const MovieApp(),
    ),
  );
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const MovieList(),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeData? currentTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: Colors.green[700],
  );

  setLightMode() {
    currentTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light, // LightMode
      colorSchemeSeed: Colors.green[700],
    );
    notifyListeners();
  }

  setDarkmode() {
    currentTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark, // DarkMode
      colorSchemeSeed: Colors.green[700],
    );
    notifyListeners();
  }
}
