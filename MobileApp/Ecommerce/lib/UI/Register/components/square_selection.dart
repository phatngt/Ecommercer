import 'package:flutter/material.dart';

class SquareSelected extends StatefulWidget {
  bool selected = false;
  @override
  _SquareSelectedState createState() => _SquareSelectedState();
}

class _SquareSelectedState extends State<SquareSelected> {
  changeSelected(bool value) {
    setState(() {
      widget.selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
              value: widget.selected,
              activeColor: Colors.blue,
              onChanged: (value) {
                print(value);
                changeSelected(value);
              }),
          Text("Agree with Terms & Conditions")
        ],
      ),
    );
  }
}
