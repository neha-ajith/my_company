import 'package:flutter/material.dart';
import 'package:my_company/models/intern.dart';
import 'package:my_company/screens/home/intern_tile.dart';
import 'package:provider/provider.dart';

class InternList extends StatefulWidget {
  @override
  _InternListState createState() => _InternListState();
}

class _InternListState extends State<InternList> {
  @override
  Widget build(BuildContext context) {
    final interns = Provider.of<List<Intern>>(context) ?? [];
    //print(interns);
    interns.forEach((intern) {
      print(intern.name);
      print(intern.dept);
    });
    return ListView.builder(
        itemCount: interns.length,
        itemBuilder: (context, index) {
          return InternTile(intern: interns[index]);
        });
  }
}
