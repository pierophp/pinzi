import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FileContentRepository {
  Stream<DocumentSnapshot> findOneByUserAndId(User user, String id) {
    return FirebaseFirestore.instance
        .doc('/user/${user.uid}/files_contents/$id')
        .snapshots();
  }
}
