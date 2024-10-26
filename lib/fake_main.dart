import 'package:flutter/material.dart';
import 'package:hcm/theme_provider.dart'; // Pastikan ini mengarah ke file tema yang benar
import 'package:provider/provider.dart';

import 'navbar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode, 
      darkTheme: darkMode, 
      themeMode: themeProvider.themeMode, 
      home: const Navbar(),
    );
  }
}
