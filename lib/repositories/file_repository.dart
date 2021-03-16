import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FileRepository {
  Stream<QuerySnapshot> findByUserAndPath(User user, String path) {
    return FirebaseFirestore.instance
        .collection('/user/${user.uid}/files')
        .where('path', isEqualTo: path)
        .orderBy('title')
        .snapshots();
  }
}
