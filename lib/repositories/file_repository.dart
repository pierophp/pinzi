import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FileRepository {
  Stream<QuerySnapshot> findByUser(User user) {
    print('user/${user.uid}/files');

    return FirebaseFirestore.instance
        .collection('user/${user.uid}/files')
        .snapshots();
  }
}
