import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/repositories/file_repository.dart';
import 'package:pinzi/routes.dart';
import 'package:pinzi/screens/files_screen.dart';
import 'package:pinzi/widgets/custom_page_loader.dart';

class FutureBuilderResponse {
  FutureBuilderResponse();
}

class FilesController extends StatelessWidget {
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
          stream:
              FileRepository().findByUser(FirebaseAuth.instance.currentUser!),
          builder: (context, snapshotRoutine) {
            print(snapshotRoutine.data);
            print(snapshotRoutine.hasData);
            if (!snapshotRoutine.hasData) {
              return CustomPageLoader();
            }

            print(snapshotRoutine.data);

            return FilesScreen();
          });
    });
  }
}

var filesHandler = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, dynamic> params,
) {
  return FilesController();
});
