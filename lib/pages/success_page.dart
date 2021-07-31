import 'package:flutter/material.dart';
import 'package:my_credit_loans/extensions/context_extensions.dart';
import 'package:my_credit_loans/pages/landing_page.dart';
import 'package:my_credit_loans/widgets/app_button.dart';

class SuccessPage extends StatelessWidget {
  static const routeName = '/success';
  final String message;
  final bool isEligible;
  final int eligibleScore;
  const SuccessPage(
      {Key? key,
      this.message = 'Operatiune finalizata cu succes!',
      this.isEligible = false,
      this.eligibleScore = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSuccessImage(context),
          SizedBox(
            height: context.height * 0.1,
          ),
          _buildSuccessMessage(),
          _buildScore(),
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

  Row _buildScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            'Scorul obtinut este $eligibleScore',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        )
      ],
    );
  }

  Row _buildSuccessMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        )
      ],
    );
  }

  Container _buildSuccessImage(BuildContext context) {
    return Container(
      width: context.width * 0.7,
      height: context.height * 0.3,
      child: Image.asset(
        isEligible ? 'assets/images/success.png' : 'assets/images/refuse.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
