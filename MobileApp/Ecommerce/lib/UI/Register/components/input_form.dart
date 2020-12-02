import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final TextEditingController input;
  final String hintText;
  final double fontSize;
  const InputForm({Key key, this.input, this.hintText, this.fontSize = 16})
      : super(key: key);
  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
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
      child: Focus(
        onFocusChange: (value) {
          changeColor(value);
        },
        child: TextField(
            controller: widget.input,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                    fontFamily: "Inter",
                    color: hintColor,
                    fontWeight: FontWeight.w600,
                    fontSize: widget.fontSize))),
      ),
    );
  }
}
