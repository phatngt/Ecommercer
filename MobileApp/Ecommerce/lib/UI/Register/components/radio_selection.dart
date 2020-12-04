import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioSelected extends StatefulWidget {
  String character = 'Male';
  final Function(String) gender;
  RadioSelected({Key key, this.gender}) : super(key: key);
  @override
  _RadioSelectedState createState() => _RadioSelectedState();
}

class _RadioSelectedState extends State<RadioSelected> {
  selectedRadio(String value) {
    setState(() {
      widget.character = value;
      widget.gender(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.defautSize * 4,
        child: ButtonBar(
          buttonHeight: SizeConfig.defautSize * 1.5,
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
