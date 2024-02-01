import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planbu_operator_app/widgets/operator_app.dart';
import 'package:planbu_operator_app/screens/jobs_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    primary: const Color(0xFF6E57FF),
    secondary: const Color(0xFFDB2291),
    tertiary: const Color(0xFF411FFF),
    seedColor: const Color(0xFF6E57FF),
  ),
  textTheme: GoogleFonts.robotoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      theme: theme,
      home: const OperatorApp(),
    );
  }
}
