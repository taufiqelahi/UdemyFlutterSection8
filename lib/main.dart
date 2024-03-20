import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy_flutter_section8/screen/category_screen.dart';
import 'package:udemy_flutter_section8/screen/tabbar_view_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final theme=ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    //brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme()
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabBarViewScreen(),
    );
  }
}
