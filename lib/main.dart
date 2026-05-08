import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'portfolio_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Omar Elnagar | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A192F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF64FFDA),
          primary: const Color(0xFF64FFDA),
          secondary: const Color(0xFF64FFDA),
          surface: const Color(0xFF112240),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme,
        ).copyWith(
          displayLarge: GoogleFonts.outfit(
            color: const Color(0xFFE6F1FF),
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.outfit(
            color: const Color(0xFFE6F1FF),
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: GoogleFonts.outfit(
            color: const Color(0xFFE6F1FF),
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: const TextStyle(color: Color(0xFF8892B0)),
          bodyMedium: const TextStyle(color: Color(0xFF8892B0)),
        ),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}
