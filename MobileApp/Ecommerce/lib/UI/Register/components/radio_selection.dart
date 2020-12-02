import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioSelected extends StatefulWidget {
  String character;

  @override
  _RadioSelectedState createState() => _RadioSelectedState();
}

class _RadioSelectedState extends State<RadioSelected> {
  selectedRadio(String value) {
    setState(() {
      widget.character = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.red,
        // child: SizedBox(
        //   width: SizeConfig.screenWidth * 2 / 3,
        child: ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: "Male",
          groupValue: widget.character,
          activeColor: Colors.blue,
          onChanged: (val) {
            selectedRadio(val);
          },
        ),
        Text(
          "Male",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: SizeConfig.defautSize * 1.8,
          ),
        ),
        SizedBox(
          width: SizeConfig.defautSize * 2,
        ),
        Radio(
          value: "Female",
          groupValue: widget.character,
          activeColor: Colors.blue,
          onChanged: (val) {
            selectedRadio(val);
          },
        ),
        Text(
          "Female",
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: SizeConfig.defautSize * 1.8,
          ),
        ),
      ],
    ));
  }
}
