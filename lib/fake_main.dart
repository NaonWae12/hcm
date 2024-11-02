import 'package:flutter/material.dart';
import 'package:hcm/theme_provider.dart';
import 'package:provider/provider.dart';
import 'initial_display/page_login.dart';

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
      home: const PageLogin(),
    );
  }
}
