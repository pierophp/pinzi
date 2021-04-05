import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FileContentRepository {
  Stream<QuerySnapshot> findByUserAndId(User user, String id) {
    return FirebaseFirestore.instance
        .collection('/user/${user.uid}/files/$id/content')
        .orderBy('sequence')
        .snapshots();
  }

  Future<void> insert(
    User user,
    String id,
    List<dynamic> data,
  ) async {
    final String collectionPath = '/user/${user.uid}/files/$id/content';
    var sequence = 0;
    for (final item in data) {
      item["sequence"] = sequence;
      await FirebaseFirestore.instance.collection(collectionPath).add(item);
      sequence++;
    }
  }
}
