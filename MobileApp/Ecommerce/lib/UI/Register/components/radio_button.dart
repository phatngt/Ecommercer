import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioButton extends StatefulWidget {
  String character;
  TextEditingController controls;

  RadioButton({Key key, this.controls}) : super(key: key);

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  selectedRadio(String value) {
    setState(() {
      widget.character = value;
      widget.controls.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 2),
        padding: EdgeInsets.symmetric(horizontal: 10),
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
                setState(() {
                  widget.character = val;
                });
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
