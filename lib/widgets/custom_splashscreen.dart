import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_credit_loans/extensions/context_extensions.dart';
import 'package:my_credit_loans/pages/landing_page.dart';

class CustomSplashScreen extends StatefulWidget {
  final int duration;
  final String nextPageRoute;

  ///Default it will navigate to the landing page
  ///[duration] are the number of seconds to the next screen
  ///[nextPageRoute] is the String with the page to navigate to
  const CustomSplashScreen(
      {Key? key, this.duration = 3, this.nextPageRoute = LandingPage.routeName})
      : super(key: key);

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * 0.1,
        ),
        Container(
          width: context.width * 0.4,
          height: context.height * 0.4,
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          height: context.height * 0.1,
        ),
        Text(
          'Welcome to My Credit Loans',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(
          height: context.height * 0.1,
        ),
        Center(
          child: CircularProgressIndicator(
            color: Colors.indigo,
          ),
        )
      ],
    );
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: widget.duration), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacementNamed(widget.nextPageRoute);
  }
}
