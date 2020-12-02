import 'package:Ecommerce/UI/Login/body.dart';
import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(
        email: email,
        password: password,
      ),
      backgroundColor: Colors.white,
    );
  }
}
