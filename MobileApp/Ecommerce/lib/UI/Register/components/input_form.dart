import 'dart:ui';

import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final TextEditingController input;
  final String hintText, labelText;
  final double fontSize, size;
  final bool isPassVisitble;
  Function(bool) onPress;
  Function(String) validator;
  InputForm(
      {Key key,
      this.input,
      this.hintText,
      this.labelText,
      this.fontSize = 16,
      this.size,
      this.onPress,
      this.validator,
      this.isPassVisitble = false})
      : super(key: key);
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();

  Color hintColor = Color(0xFFEF5350);
  changeColor(bool hasFocus) {
    if (hasFocus) {
      setState(() {
        hintColor = Color(0xFF03AA9F4);
      });
    } else {
      setState(() {
        hintColor = Color(0xFFEF5350);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: widget.size,
      child: Focus(
        onFocusChange: (value) {
          changeColor(value);
          if (value) {
            widget.onPress(value);
          }
        },
        child: TextFormField(
          controller: widget.input,
          obscureText: widget.isPassVisitble,
          validator: (value) {
            return widget.validator(value);
          },
          decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.labelText,
              labelStyle: TextStyle(
                fontFamily: "Inter",
                color: hintColor,
                fontWeight: FontWeight.w600,
                fontSize: widget.fontSize,
              ),
              hintStyle: TextStyle(
                fontFamily: "Inter",
                color: hintColor,
                fontWeight: FontWeight.w600,
                fontSize: widget.fontSize,
              )),
        ),
      ),
    );
  }
}
