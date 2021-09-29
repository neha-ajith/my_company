import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_company/models/intern.dart';
import 'package:my_company/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference internCollection =
      FirebaseFirestore.instance.collection('interns');

  Future updateUserData(String name, String dept) async {
    return await internCollection
        .doc(uid)
        .set({'name': name, 'department': dept});
  }

  List<Intern> _internListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((docu) {
      return Intern(
          name: docu.data()['name'] ?? '',
          dept: docu.data()['department'] ?? '');
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()['name'],
        dept: snapshot.data()['department']);
  }

  Stream<List<Intern>> get interns {
    return internCollection.snapshots().map(_internListFromSnapshot);
  }

  Stream<UserData> get userData {
    return internCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
