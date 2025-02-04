import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/categories.dart';

// 테마 설정
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // 앱 실행
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      // 첫 화면 : 카테고리 화면
      home: const CategoriesScreen(),
    );
  }
}
