import 'package:flutter/material.dart';
import 'package:my_company/models/user.dart';
import 'package:my_company/screens/authenticate/authenticate.dart';
import 'package:my_company/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FUser>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
