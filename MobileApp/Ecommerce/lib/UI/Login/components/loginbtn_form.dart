import 'dart:ui';

import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double boxSize, fontSize, borderRadius;

  const BasicButton(
      {Key key,
      this.text,
      this.press,
      this.color = Colors.black,
      this.textColor = Colors.white,
      this.boxSize = 100,
      this.fontSize = 16,
      this.borderRadius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: boxSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            color: color,
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
              ),
            )),
      ),
    );
  }
}
