import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final double elevation;
  final Color backgroundColor;

  ///Default is a indigo app bar with no title and no elevation
  ///[title] the title to display
  ///[elevation] double value for elevation of the appbar
  ///[backgroundColor] is the color of the Appbar
  const CustomAppBar(
      {this.title, this.elevation = 0.0, this.backgroundColor = Colors.indigo})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      elevation: widget.elevation,
      backgroundColor: widget.backgroundColor,
      title: widget.title != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
