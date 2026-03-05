import 'package:flutter/material.dart';
import 'package:losimpson/screens/home-screens.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
    textTheme: GoogleFonts.quicksandTextTheme(), // Aplica Quicksand a toda la app 
    ),
      title: 'Los Simpson API',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
