import 'package:Ecommerce/UI/Login/components/loginbtn_form.dart';
import 'package:Ecommerce/UI/Register/components/radio_selection.dart';
import 'package:Ecommerce/UI/Register/components/input_form.dart';
import 'package:Ecommerce/UI/Register/components/square_selection.dart';
import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:Ecommerce/services/register.dart';
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
  Register register;

  /*Adjust listview size of the inputs when the keyboard is pressed*/
  //Defauld listview size on screen
  double defauldSizeListView = SizeConfig.screenHeight * 1.3 / 3;
  //Resize height of the listview when the input is press
  double resizeListView = SizeConfig.screenHeight * 1 / 4;
  // The mark variable that use to determine press input

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController fullname = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();
  //Get value gender
  String gender;
  // Kiem tra xem nhan vao input hay chua?
  bool isSelected = false;
  GlobalKey<ScaffoldState> key;
  //Check email already exitst
  bool existEmail = false;
  //State for validator
  final _formState = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    key = GlobalKey<ScaffoldState>();
    KeyboardVisibilityNotification().addNewListener(onChange: (value) {
      isSelected = value ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
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
              child: Form(
                key: _formState,
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
                          width: SizeConfig.defautSize * 15,
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
                      height: isSelected
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
                                  isSelected = value;
                                });
                              },
                              input: fullname,
                              validator: (String value) {
                                String pattern = r'[0-9]';
                                RegExp regExp = new RegExp(pattern);
                                return regExp.hasMatch(value)
                                    ? 'Full name not is contains digits'
                                    : null;
                              },
                              labelText: "Full name",
                            ),
                            InputForm(
                              hintText: "Email",
                              fontSize: 16,
                              size: SizeConfig.screenWidth * 2.3 / 3,
                              onPress: (bool value) {
                                setState(() {
                                  isSelected = value;
                                });
                              },
                              input: email,
                              validator: (String value) {
                                String pattern =
                                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
                                RegExp regExp = new RegExp(pattern);

                                if (existEmail) {
                                  setState(() {
                                    existEmail = false;
                                  });
                                  return "Email already exists";
                                }

                                return regExp.hasMatch(value)
                                    ? null
                                    : 'Email is not validated';
                              },
                              labelText: "Email",
                            ),
                            InputForm(
                              hintText: "Password",
                              fontSize: 16,
                              size: SizeConfig.screenWidth * 2.3 / 3,
                              onPress: (bool value) {
                                setState(() {
                                  isSelected = value;
                                });
                              },
                              input: password,
                              isPassVisitble: true,
                              validator: (String value) {
                                String pattern =
                                    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
                                RegExp regExp = new RegExp(pattern);
                                return regExp.hasMatch(value)
                                    ? null
                                    : '8 characters, at least 1 letter and 1 number';
                              },
                              labelText: "Password",
                            ),
                            InputForm(
                              hintText: "Confirm Password",
                              fontSize: 16,
                              size: SizeConfig.screenWidth * 2.3 / 3,
                              onPress: (bool value) {
                                setState(() {
                                  isSelected = value;
                                });
                              },
                              input: confirmPassword,
                              isPassVisitble: true,
                              validator: (String value) {
                                return value.compareTo(password.text) == 0
                                    ? null
                                    : 'Password no match';
                              },
                              labelText: "Confirm password",
                            ),
                            InputForm(
                              hintText: "Phone number",
                              fontSize: 16,
                              size: SizeConfig.screenWidth * 2.3 / 3,
                              onPress: (bool value) {
                                setState(() {
                                  isSelected = value;
                                });
                              },
                              input: phoneNumber,
                              validator: (String value) {
                                String pattern = r'^(?:[+0]9)?[0-9]{10,12}$';
                                RegExp regExp = new RegExp(pattern);
                                if (value.length == 0) {
                                  return 'Please inter mobile number';
                                }
                                return regExp.hasMatch(value)
                                    ? null
                                    : 'Mobile number is not validated';
                              },
                              labelText: "Phone",
                            ),
                          ]),
                    ),
                    RadioSelected(
                      gender: (value) {
                        gender = value;
                      },
                    ),
                    SquareSelected(),
                    BasicButton(
                      color: Colors.blue,
                      fontSize: 18,
                      boxSize: SizeConfig.screenWidth * 1 / 2,
                      text: "Register",
                      textColor: Colors.white,
                      borderRadius: 20,
                      press: () async {
                        
                        if (_formState.currentState.validate()) {
                          widget.register = new Register(
                              fullName: fullname.text,
                              email: email.text,
                              password: password.text,
                              confirmPassword: confirmPassword.text,
                              phoneNumber: phoneNumber.text,
                              gender: gender);
                          widget.register.registerAccountIntoFirebase();
                          setState(() {
                            existEmail = true;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
