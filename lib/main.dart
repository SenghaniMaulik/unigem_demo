import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:unigem_demo/screens/enter_otp/enter_otp_screen.dart';
import 'package:unigem_demo/screens/select_language/select_language_screen.dart';
import 'package:unigem_demo/screens/sign_in/sign_in_screen.dart';
import 'package:unigem_demo/screens/verify_your_mobile/verify_your_mobile_screen.dart';
import 'package:unigem_demo/theme/main_theme_constants.dart';
import 'package:unigem_demo/theme/theme_manager.dart';

import 'locale/LanguageProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeManager()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('hi'), // Hindi
      ],*/
      locale: Provider.of<LanguageProvider>(context).currentLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeManager>(context).themeMode,
      initialRoute: EnterOTPScreen.id,
      routes: {
        SignInScreen.id: (context) => const SignInScreen(),
        SelectLanguageScreen.id: (context) => SelectLanguageScreen(),
        VerifyYourMobileScreen.id: (context) => const VerifyYourMobileScreen(),
        EnterOTPScreen.id: (context) => const EnterOTPScreen(mobile: "9033324938",comingFrom: ComingFrom.SIGN_UP,),
      },
    );
  }
}
