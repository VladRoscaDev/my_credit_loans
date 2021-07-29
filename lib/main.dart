import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_credit_loans/pages/landing_page.dart';
import 'package:my_credit_loans/pages/personal_data_page.dart';
import 'package:my_credit_loans/pages/splash_screen_page.dart';
import 'package:my_credit_loans/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyCreditLoans());

class MyCreditLoans extends StatelessWidget {
  const MyCreditLoans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: UserProvider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyCreditLoans',
          initialRoute: '/',
          theme: ThemeData(
              primarySwatch: Colors.indigo,
              textTheme:
                  GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
          routes: {
            SplashScreenPage.routeName: (BuildContext context) =>
                SplashScreenPage(),
            LandingPage.routeName: (BuildContext context) => LandingPage(),
            PersonalDataPage.routeName: (BuildContext context) =>
                PersonalDataPage()
          },
        ));
  }
}
