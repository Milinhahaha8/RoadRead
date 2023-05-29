import 'package:cloud_firestore/cloud_firestore.dart';

import '../Model/UserModel.dart';

class DataRepository {
  // 1
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('users');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  // 3
  Future<DocumentReference> addUser(UserModel user) {
    return collection.add(user.toJson());
  }

  // 4
  void updateUser(UserModel user) async {
    await collection.doc(user.referenceId).update(user.toJson());
  }

  // 5
  void deleteUser(UserModel user) async {
    await collection.doc(user.referenceId).delete();
  }

  Future<bool> login(String user, String pass) async {
    final QuerySnapshot result = await collection
        .where('userName', isEqualTo: user)
        .where('userPassword', isEqualTo: pass)
        .limit(1)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.length == 1;
  }
}
