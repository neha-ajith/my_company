import 'package:flutter/material.dart';
import 'package:my_company/screens/authenticate/register.dart';
import 'package:my_company/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isSignedIn = true;
  void toggleView() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignedIn) {
      return Register(toggleView);
    } else {
      return SignIn(toggleView);
    }
  }
}
