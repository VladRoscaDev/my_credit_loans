import 'package:flutter/material.dart';
import 'package:my_credit_loans/extensions/context_extensions.dart';
import 'package:my_credit_loans/widgets/app_button.dart';

class ErrorPage extends StatelessWidget {
  static const routeName = '/error';
  final String message;
  const ErrorPage({Key? key, this.message = 'Something went wrong!'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildErrorImage(context),
          SizedBox(
            height: context.height * 0.1,
          ),
          _buildErrorMessage(),
          SizedBox(
            height: context.height * 0.1,
          ),
          AppButton(
              message: 'Reincercati',
              callBackFunction: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }

  Row _buildErrorMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        )
      ],
    );
  }

  Container _buildErrorImage(BuildContext context) {
    return Container(
      width: context.width * 0.7,
      height: context.height * 0.3,
      child: Image.asset(
        'assets/images/error.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
