import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BasicPassword extends StatefulWidget {
  final String hint;
  final IconData icon;
  final TextEditingController input;
  double boxSize, fontSize = 0, borderRadius = 0;

  BasicPassword(
      {Key key,
      this.hint,
      this.icon,
      this.input,
      this.boxSize,
      this.fontSize,
      this.borderRadius})
      : super(key: key);
  @override
  _BasicPasswordState createState() => _BasicPasswordState();
}

class _BasicPasswordState extends State<BasicPassword> {
  bool passwordVisible;
  Color borderColor = Color(0xFFBEB7B7);
  Color hintColor = Color(0xFFBEB7B7);

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  changeBorderColor(bool hasFocus) {
    if (hasFocus == true) {
      setState(() {
        borderColor = Color(0xFF94C9FE);
        hintColor = Color(0xFF3D93FE);
      });
    } else {
      setState(() {
        borderColor = Color(0xFFBEB7B7);
        hintColor = Color(0xFFBEB7B7);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: widget.boxSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                widget.borderRadius == 0 ? 20 : widget.borderRadius),
            border: Border.all(
              color: borderColor,
              width: 2,
            )),
        child: Focus(
          onFocusChange: (hasFocus) {
            changeBorderColor(hasFocus);
          },
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            obscureText: !passwordVisible,
            controller: widget.input,
            decoration: InputDecoration(
              icon: Icon(
                widget.icon,
                // color: kPrimaryColor,
              ),
              suffixIcon: GestureDetector(
                child: Icon(
                  passwordVisible ? Feather.eye_off : Feather.eye,
                  // color: kPrimaryColor,
                ),
                onTap: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontFamily: "Inter",
                color: hintColor,
                fontWeight: FontWeight.w600,
                fontSize: widget.fontSize == 0 ? 16 : widget.fontSize,
              ),
              border: InputBorder.none,
            ),
          ),
        ));
  }
}
