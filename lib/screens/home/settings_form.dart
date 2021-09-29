import 'package:flutter/material.dart';
import 'package:my_company/models/user.dart';
import 'package:my_company/services/database.dart';
import 'package:my_company/shared/constants.dart';
import 'package:my_company/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> depts = ['Select', 'CSE', 'ECE', 'EEE', 'ME', 'CE'];

  String _currentName;
  String _currentDept;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FUser>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Update Your Details',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: inputDecor,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField(
                      decoration: inputDecor,
                      value: _currentDept ?? userData.dept,
                      items: depts.map((dept) {
                        return DropdownMenuItem(
                          value: dept,
                          child: Text(dept),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => _currentDept = val)),
                  RaisedButton(
                      color: Colors.purple[600],
                      child:
                          Text('Update', style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentName ?? userData.name,
                              _currentDept ?? userData.dept);
                          Navigator.pop(context);
                        }
                      })
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
