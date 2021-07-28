import 'package:flutter/material.dart';
import 'package:my_credit_loans/widgets/custom_splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  static const routeName = '/';
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomSplashScreen());
  }
}
