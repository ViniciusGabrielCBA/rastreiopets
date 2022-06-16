import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rastreiopets/models/user/user_local.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('usuario');

  add(UserLocal user) {
    var userMap = user.toMap();
    _firestore.collection('usuario').add(userMap);
  }

  Stream<QuerySnapshot> getUser() {
    return collectionReference.snapshots();
  }
}
