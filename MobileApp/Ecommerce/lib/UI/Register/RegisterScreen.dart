import 'package:Ecommerce/UI/Register/components/radio_button.dart';
import 'package:Ecommerce/UI/Register/components/input_form.dart';
import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
            child: SizedBox(
              width: SizeConfig.screenWidth * 2.3 / 3,
              height: SizeConfig.screenHeight * 3.1 / 4,
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
                  InputForm(
                    hintText: "Full name",
                    fontSize: 16,
                  ),
                  InputForm(
                    hintText: "Email",
                    fontSize: 16,
                  ),
                  InputForm(
                    hintText: "Password",
                    fontSize: 16,
                  ),
                  InputForm(
                    hintText: "Confirm Password",
                    fontSize: 16,
                  ),
                  InputForm(
                    hintText: "Phone number",
                    fontSize: 16,
                  ),
                  RadioButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
