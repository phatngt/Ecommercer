import 'package:Ecommerce/UI/Login/components/input_form.dart';
import 'package:Ecommerce/UI/Login/components/loginbtn_form.dart';
import 'package:Ecommerce/UI/Login/components/password_form.dart';
import 'package:Ecommerce/config/sizeconfig.dart';
import 'package:Ecommerce/services/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body extends StatefulWidget {
  final TextEditingController email;
  final TextEditingController password;

  const Body({Key key, this.email, this.password}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        Stack(
          children: [
            ClipPath(
              clipper: LoginScreenShape(),
              child: AspectRatio(
                aspectRatio: 1.025,
                child: Container(
                  height: SizeConfig.screenHeight / 2,
                  width: SizeConfig.screenWidth,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/images/logo.svg"),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: SizeConfig.defautSize * 2),
        BasicInput(
          icon: Icons.email,
          hint: "example@gmail.com",
          input: widget.email,
          boxSize: SizeConfig.screenWidth * 3 / 4,
          borderRadius: 20,
          fontSize: 16,
        ),
        BasicPassword(
          icon: Icons.more_horiz,
          hint: "password",
          boxSize: SizeConfig.screenWidth * 3 / 4,
          input: widget.password,
          borderRadius: 20,
          fontSize: 16,
        ),
        SizedBox(
          height: SizeConfig.defautSize * 3,
        ),
        BasicButton(
          color: Colors.blue,
          fontSize: 18,
          boxSize: SizeConfig.screenWidth * 1 / 2,
          text: "Login",
          textColor: Colors.white,
          borderRadius: 20,
          press: () async {
            Login login = new Login(
                email: widget.email.text, password: widget.password.text);
            bool checked = await login.checkAccount();
            if (checked) {
              print("Successfully sign in");
            }
          },
        ),
        SizedBox(
          height: SizeConfig.defautSize * 1.5,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "No account yet? Create",
            style: TextStyle(
                color: Colors.blue, fontSize: SizeConfig.defautSize * 2),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login with",
              style: TextStyle(
                  fontSize: SizeConfig.defautSize * 2, color: Colors.blue),
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.google,
                color: Colors.redAccent,
              ),
              onPressed: () => {},
              highlightColor: Colors.blue,
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.facebookSquare,
                color: Colors.blueAccent,
              ),
              onPressed: () => {},
              highlightColor: Colors.blue,
            )
          ],
        )
      ]),
    );
  }
}

class LoginScreenShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 50;

    path.lineTo(0, height);
    var controllPoint = Offset(0, height - cornerSize);
    var endPoint = Offset(width / 2, height - cornerSize);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.moveTo(width, 0);
    path.lineTo(width, height);
    var controllPoint1 = Offset(width, height - cornerSize);
    var endPoint1 = Offset(width / 2, height - cornerSize);
    path.quadraticBezierTo(
        controllPoint1.dx, controllPoint1.dy, endPoint1.dx, endPoint1.dy);
    path.moveTo(width / 2, height - cornerSize);
    path.lineTo(0, 0);
    path.quadraticBezierTo(width, 0, width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
