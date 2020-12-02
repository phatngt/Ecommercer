import 'package:Ecommerce/UI/Login/components/loginbtn_form.dart';
import 'package:Ecommerce/UI/Register/components/radio_selection.dart';
import 'package:Ecommerce/UI/Register/components/input_form.dart';
import 'package:Ecommerce/UI/Register/components/square_selection.dart';
import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

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
  //The variable is holding infomation of scaffoldState key
  GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    super.initState();
    //Init _key
    _key = GlobalKey<ScaffoldState>();
    //When press back-button on keyboard, new listener will is added.
    KeyboardVisibilityNotification().addNewListener(onHide: () {
      _key.currentState.setState(() {
        //Resize the height of the cotainer listview become to default size.
        widget.defauldSizeListView = SizeConfig.screenHeight * 1.2 / 3;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _key,
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

                              print(widget.isSelected);
                            },
                          ),
                          InputForm(
                            hintText: "Email",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                            onPress: (bool value) {
                              setState(() {
                                widget.isSelected = value;
                              });

                              print(widget.isSelected);
                            },
                          ),
                          InputForm(
                            hintText: "Password",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                            onPress: (bool value) {
                              setState(() {
                                widget.isSelected = value;
                              });

                              print(widget.isSelected);
                            },
                          ),
                          InputForm(
                            hintText: "Confirm Password",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                            onPress: (bool value) {
                              setState(() {
                                widget.isSelected = value;
                              });

                              print(widget.isSelected);
                            },
                          ),
                          InputForm(
                            hintText: "Phone number",
                            fontSize: 16,
                            size: SizeConfig.screenWidth * 2.3 / 3,
                            onPress: (bool value) {
                              setState(() {
                                widget.isSelected = value;
                              });

                              print(widget.isSelected);
                            },
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
