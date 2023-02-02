import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:unigem_demo/screens/select_language/select_language_screen.dart';
import 'package:unigem_demo/screens/sign_in.dart';
import 'package:unigem_demo/theme/main_theme_constants.dart';
import 'package:unigem_demo/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: MyMaterialApp(),);
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('hi'), // Spanish
      ],
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode:Provider.of<ThemeManager>(context).themeMode,
      initialRoute: SelectLanguageScreen.id,
      routes: {
        SignIn.id: (context) => SignIn(),
        SelectLanguageScreen.id: (context) => SelectLanguageScreen(),
      },
    );
  }
}

