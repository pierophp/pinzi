import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/repositories/file_repository.dart';
import 'package:pinzi/routes.dart';
import 'package:pinzi/screens/files/file_screen.dart';
import 'package:pinzi/widgets/custom_page_loader.dart';

class FutureBuilderResponse {
  FutureBuilderResponse();
}

class FileController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FutureBuilderResponse>(future: () async {
      return FutureBuilderResponse();
    }(), builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return CustomPageLoader();
      }

      final logged = FirebaseAuth.instance.currentUser != null;
      if (!logged) {
        Future.delayed(Duration(seconds: 2), () {
          router.navigateTo(
            context,
            "/",
            transition: TransitionType.inFromLeft,
            clearStack: true,
          );
        });

        return CustomPageLoader();
      }

      return StreamBuilder<QuerySnapshot>(
          stream: FileRepository().findByUserAndPath(
            FirebaseAuth.instance.currentUser!,
            '/',
          ),
          builder: (context, snapshotRoutine) {
            if (!snapshotRoutine.hasData) {
              return CustomPageLoader();
            }

            return FileScreen();
          });
    });
  }
}

var fileHandler = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, dynamic> params,
) {
  return FileController();
});
