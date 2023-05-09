import 'package:flutter/material.dart';

class HourButton extends StatelessWidget {
  final bool isEnabled = false;
  final String hour;
  HourButton({required this.isEnabled, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Text("8:00 AM"),
        ),
        /////////
        /* If the hour is selected, the slot will be highlighted. */
        decoration: (isEnabled
        ? BoxDecoration(color: Colors.amber)
        : BoxDecoration(
          border: Border.all(
            color: Colors.amber))),
          ),
      );
  }
}