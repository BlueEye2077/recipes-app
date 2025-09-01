import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/screens/tabs_screen.dart';

final lightTheme = ThemeData().copyWith(
  // scaffoldBackgroundColor: const Color(0xFFFCF9F8),
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA97760)),
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: const AppBarTheme().copyWith(
    color: const Color.fromARGB(255, 162, 115, 97),
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF231610),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF231610),
    brightness: Brightness.dark,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const TabsScreen(),
    );
  }
}
