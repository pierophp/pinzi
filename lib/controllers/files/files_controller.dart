import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pinzi/models/file.dart';
import 'package:pinzi/repositories/file_repository.dart';
import 'package:pinzi/routes.dart';
import 'package:pinzi/screens/files/files_screen.dart';
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
        Future.delayed(
          Duration(seconds: 2),
          () {
            router.navigateTo(
              context,
              "/",
              transition: TransitionType.inFromLeft,
              clearStack: true,
            );
          },
        );

        return CustomPageLoader();
      }

      return StreamBuilder<QuerySnapshot>(
        stream: FileRepository().findByUserAndPath(
          FirebaseAuth.instance.currentUser!,
          '/',
        ),
        builder: (context, snapshotFiles) {
          if (!snapshotFiles.hasData) {
            return CustomPageLoader();
          }

          final files = snapshotFiles.data!.docs
              .map((item) => File(snapshot: item))
              .toList();

          return FilesScreen(files: files);
        },
      );
    });
  }
}

var filesHandler = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, dynamic> params,
) {
  return FilesController();
});
