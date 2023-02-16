import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:unigem_demo/src/features/authentication/screens/enter_otp/enter_otp_screen.dart';
import 'package:unigem_demo/src/features/authentication/screens/select_language/select_language_screen.dart';
import 'package:unigem_demo/src/features/authentication/screens/sign_in/sign_in_screen.dart';
import 'package:unigem_demo/src/features/authentication/screens/verify_your_mobile/verify_your_mobile_screen.dart';
import 'package:unigem_demo/theme/main_theme_constants.dart';
import 'package:unigem_demo/theme/theme_manager.dart';

import 'firebase_options.dart';
import 'locale/LanguageProvider.dart';
import 'src/repository/repository/authentication_repository/authentication_repository.dart';
import 'src/repository/repository/user_repository/user_repository.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    Get.put(AuthenticationRepository());
    Get.put(UserRepository());
  });
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
    return GetMaterialApp(
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
      locale:  Get.deviceLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeManager>(context).themeMode,
      color: Colors.white,
      /*home: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(),
          ),
        ),
      )*/
      initialRoute: SelectLanguageScreen.id,
      routes: {
        SignInScreen.id: (context) => const SignInScreen(),
        SelectLanguageScreen.id: (context) => SelectLanguageScreen(),
        VerifyYourMobileScreen.id: (context) => const VerifyYourMobileScreen(),
        EnterOTPScreen.id: (context) => const EnterOTPScreen(mobile: "9033324938",comingFrom: ComingFrom.SIGN_UP,),
      },
    );
  }
}
