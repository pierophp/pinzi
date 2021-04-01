import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FileContentRepository {
  Stream<DocumentSnapshot> findOneByUserAndId(User user, String id) {
    return FirebaseFirestore.instance
        .doc('/user/${user.uid}/files_contents/$id')
        .snapshots();
  }

  Future<void> insert(
    User user,
    String id,
    Map<String, dynamic> data,
  ) async {
    final String documentPath = '/user/${user.uid}/files_contents/$id';

    await FirebaseFirestore.instance.doc(documentPath).set(data);
  }
}
