import 'package:flutter/material.dart';
import 'package:my_company/models/intern.dart';

class InternTile extends StatelessWidget {
  final Intern intern;
  InternTile({this.intern});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          title: Text(intern.name),
          subtitle: Text(intern.dept),
        ),
      ),
    );
  }
}
