import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_screen.dart';
import 'theme_provider.dart';
import 'font_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FontProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, FontProvider>(
      builder: (context, themeProvider, fontProvider, child) {
        return MaterialApp(
          title: 'Flutter Multi Theme and Font',
          theme: themeProvider.currentTheme.copyWith(
            textTheme: themeProvider.currentTheme.textTheme.apply(
              fontFamily: fontProvider.currentFont.fontFamily,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: themeProvider.currentTheme.primaryColor,
              titleTextStyle: fontProvider.currentFont.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: themeProvider.currentTheme.primaryColor,
              textTheme: ButtonTextTheme.primary,
            ),
            scaffoldBackgroundColor: themeProvider.currentTheme.scaffoldBackgroundColor,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: themeProvider.currentTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          home: const MainScreen(),
        );
      },
    );
  }
}
