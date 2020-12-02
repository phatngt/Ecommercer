import 'package:Ecommerce/UI/Login/components/loginbtn_form.dart';
import 'package:Ecommerce/UI/Register/components/radio_selection.dart';
import 'package:Ecommerce/UI/Register/components/input_form.dart';
import 'package:Ecommerce/UI/Register/components/square_selection.dart';
import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  double sizeListView = SizeConfig.screenHeight * 1.2 / 3;
  bool isSelected = false;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  onFocus(value) {
    setState(() {
      if (value) {
        widget.sizeListView = SizeConfig.screenHeight * 1 / 4;
      } else {
        widget.sizeListView = SizeConfig.screenHeight * 1.2 / 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/backgrounds/Register.png"),
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            fit: BoxFit.cover,
          ),
          Align(
            widthFactor: double.infinity,
            heightFactor: double.infinity,
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(top: SizeConfig.screenWidth * 1.2 / 3),
              width: SizeConfig.screenWidth * 2.3 / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.defautSize * 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: SizeConfig.defautSize * 13,
                      ),
                      Container(
                        child: Text(
                          "Registration",
                          style: TextStyle(
                              fontSize: SizeConfig.defautSize * 2.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: widget.sizeListView,
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          InputForm(
                            hintText: "Full name",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                          ),
                          InputForm(
                            hintText: "Email",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                          ),
                          Focus(
                            onFocusChange: (value) {
                              if (value) {
                                print(value);
                                widget.isSelected = value;
                                onFocus(widget.isSelected);
                              }
                            },
                            child: InputForm(
                              hintText: "Password",
                              fontSize: 16,
                              size: SizeConfig.screenWidth * 2.3 / 3,
                            ),
                          ),
                          Focus(
                            onFocusChange: (value) {
                              if (value) {
                                widget.isSelected = value;
                                onFocus(widget.isSelected);
                              }
                            },
                            child: InputForm(
                              hintText: "Confirm Password",
                              fontSize: 16,
                              size: SizeConfig.screenWidth * 2.3 / 3,
                            ),
                          ),
                          InputForm(
                            hintText: "Phone number",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                          ),
                        ]),
                  ),
                  RadioSelected(),
                  SquareSelected(),
                  BasicButton(
                    color: Colors.blue,
                    fontSize: 18,
                    boxSize: SizeConfig.screenWidth * 1 / 2,
                    text: "Register",
                    textColor: Colors.white,
                    borderRadius: 20,
                    press: () async {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
