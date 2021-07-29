import 'package:flutter/material.dart';
import 'package:my_credit_loans/extensions/context_extensions.dart';

class AppButton extends StatelessWidget {
  final String message;
  final VoidCallback callBackFunction;
  final Color buttonColor;
  final Color textColor;

  const AppButton(
      {Key? key,
      required this.message,
      required this.callBackFunction,
      this.buttonColor = Colors.indigo,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.3,
      height: context.height * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: buttonColor,
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        onPressed: callBackFunction,
      ),
    );
  }
}
