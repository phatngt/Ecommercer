import 'package:Ecommerce/UI/Login/components/loginbtn_form.dart';
import 'package:Ecommerce/UI/Register/components/radio_selection.dart';
import 'package:Ecommerce/UI/Register/components/input_form.dart';
import 'package:Ecommerce/UI/Register/components/square_selection.dart';
import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:Ecommerce/services/register.dart';
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

// ignore: must_be_immutable
class Body extends StatefulWidget {
  Register register;

  /*Adjust listview size of the inputs when the keyboard is pressed*/
  //Defauld listview size on screen
  double defauldSizeListView = SizeConfig.screenHeight * 1.2 / 3;
  //Resize height of the listview when the input is press
  double resizeListView = SizeConfig.screenHeight * 1 / 4;
  // The mark variable that use to determine press input
  bool isSelected = false;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController fullname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();

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
                    height: SizeConfig.defautSize * 10,
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
                    height: widget.isSelected
                        ? widget.resizeListView
                        : widget.defauldSizeListView,
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          InputForm(
                            hintText: "Full name",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                            onPress: (bool value) {
                              setState(() {
                                widget.isSelected = value;
                              });
                            },
                            input: fullname,
                          ),
                          InputForm(
                            hintText: "Email",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                            onPress: (bool value) {
                              setState(() {
                                widget.isSelected = value;
                              });
                            },
                            input: email,
                          ),
                          InputForm(
                            hintText: "Password",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                            onPress: (bool value) {
                              setState(() {
                                widget.isSelected = value;
                              });
                            },
                            input: password,
                          ),
                          InputForm(
                              hintText: "Confirm Password",
                              fontSize: 16,
                              size: SizeConfig.screenWidth * 2.3 / 3,
                              onPress: (bool value) {
                                setState(() {
                                  widget.isSelected = value;
                                });
                              },
                              input: confirmPassword),
                          InputForm(
                            hintText: "Phone number",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                            onPress: (bool value) {
                              setState(() {
                                widget.isSelected = value;
                              });
                            },
                            input: phoneNumber,
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
                    press: () async {
                      widget.register = new Register(
                          fullName: fullname.text,
                          email: email.text,
                          password: password.text,
                          confirmPassword: confirmPassword.text,
                          phoneNumber: phoneNumber.text);
                      widget.register.registerAccountIntoFirebase();
                    },
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
