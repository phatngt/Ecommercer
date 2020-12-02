import 'package:flutter/material.dart';

class BasicInput extends StatefulWidget {
  final String hint;
  final IconData icon;
  final TextEditingController input;
  double boxSize, fontSize = 0, borderRadius = 0;

  BasicInput(
      {Key key,
      this.hint,
      this.icon,
      this.input,
      this.boxSize,
      this.fontSize,
      this.borderRadius})
      : super(key: key);

  @override
  _BasicInputState createState() => _BasicInputState();
}

class _BasicInputState extends State<BasicInput> {
  Color borderColor = Color(0xFFBEB7B7);
  Color hintColor = Color(0xFFBEB7B7);
  @override
  void initState() {
    super.initState();
  }

  changeColor(bool hasFocus) {
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
            changeColor(hasFocus);
          },
          child: TextField(
            controller: widget.input,
            decoration: InputDecoration(
              icon: Icon(
                widget.icon,
                // color: kPrimaryColor,
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
