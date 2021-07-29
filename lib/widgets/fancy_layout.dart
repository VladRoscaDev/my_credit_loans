import 'package:flutter/material.dart';
import 'package:my_credit_loans/extensions/context_extensions.dart';

class FancyLayout extends StatelessWidget {
  final Color backgroundColor;
  final Color contentBackgroundColor;
  final String sectionTitle;
  final Widget layout;

  ///Used for the curved layout
  ///[backgroundColor] the color behind  the card - default Colors.indigo
  ///[contentBackgroundColor] the color in the card - default Colors.white
  ///[sectionTitle] the title displayed on top of the card
  ///[layout] the Widget that will be displayed in the c
  const FancyLayout(
      {Key? key,
      this.backgroundColor = Colors.indigo,
      this.contentBackgroundColor = Colors.white,
      required this.sectionTitle,
      required this.layout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: context.height * 0.05,
          ),
          _buildSectionTitle(),
          SizedBox(
            height: context.height * 0.02,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: contentBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: layout,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildSectionTitle() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            sectionTitle,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          )
        ],
      ),
    );
  }
}
