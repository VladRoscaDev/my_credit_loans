import 'package:flutter/material.dart';
import 'package:my_credit_loans/extensions/context_extensions.dart';
import 'package:my_credit_loans/pages/landing_page.dart';
import 'package:my_credit_loans/widgets/app_button.dart';

class SuccessPage extends StatelessWidget {
  static const routeName = '/error';
  final String message;
  final bool isEligible;
  const SuccessPage(
      {Key? key,
      this.message = 'Operatiune finalizata cu succes!',
      this.isEligible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: context.width * 0.7,
            height: context.height * 0.3,
            child: Image.asset(
              isEligible
                  ? 'assets/images/success.png'
                  : 'assets/images/refuse.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: context.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              )
            ],
          ),
          SizedBox(
            height: context.height * 0.1,
          ),
          AppButton(
              message: 'De la inceput',
              callBackFunction: () {
                Navigator.of(context)
                    .pushReplacementNamed(LandingPage.routeName);
              })
        ],
      ),
    );
  }
}
