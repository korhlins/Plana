import 'package:flutter/material.dart';
import '../utilities/media_Query.dart';

class SmallCard extends StatelessWidget {
  SmallCard({
    required this.borderColor,
    required this.cardChild,
    required this.onTap,
    required this.textColor,
    required this.backgroundColor,
  });

  String cardChild;
  Color backgroundColor;
  Color textColor;
  Function()? onTap;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    double height = ScreenDimension(context: context).getHeight();
    double width = ScreenDimension(context: context).getWidth();

    return OutlinedButton(
        onPressed: onTap,
        child: Text(
          cardChild,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
        style: OutlinedButton.styleFrom(
            side: BorderSide(
                color: borderColor,
                style: BorderStyle.solid,
                width: width * 0.003),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height * 0.03),
            ),
            backgroundColor: backgroundColor,
            textStyle: TextStyle(color: textColor)));
  }
}
